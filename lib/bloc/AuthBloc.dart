// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events
/////////////////// Events ////////////////

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLogInEvent extends AuthEvent{
 final String username;
 final String password;

 AuthLogInEvent({required this.username,required this.password});

  @override
  List<Object> get props => [username,password];

  @override
  String toString() => 'AuthLogInEvent { username: $username,password: $password}';
}

class AuthLoggedInEvent extends AuthEvent {
  final String token;

  AuthLoggedInEvent({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class AuthLogOutEvent extends AuthEvent {}

//endregion Events

//region States
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {
  final String _token;
  final String username;
  final String password;
  final DateTime _tokenExpirationDate;
  final String apiAddress;

  AuthSuccess(this._token,this.username, this.password, this._tokenExpirationDate,this.apiAddress);

  String get getToken=>_token;
  String get getUName=>username;
  String get getUPass => password;
  String get getApiAddress=>apiAddress;
  DateTime get getTokenExpDate=>_tokenExpirationDate;

  @override
  List<Object> get props => [_token,username,password,_tokenExpirationDate,apiAddress];

  @override
  String toString() => 'AuthSuccessState { token: $_token }';
}
class AuthFailure extends AuthState {
  final String errorStatus;

  AuthFailure(this.errorStatus);

  String get getErrorStatus=>errorStatus;

  @override
  List<Object> get props => [errorStatus];

  @override
  String toString() => 'AuthFailureState { errorStatus: $errorStatus }';
}
class AuthInProgress extends AuthState {}

//endregion States

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final Services _srv;
  final ProviderModel providerModel;
  AuthBloc(this._srv, this.providerModel):super(AuthInitial()){
    on<AuthLogInEvent>(onAuthLogin);
    on<AuthLogOutEvent>((event, emit) => emit(AuthInitial()));
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition){
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  void onAuthLogin(AuthLogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try{
      bool hasToken=false;
      String token='';
        token = await _srv.getToken(event.username,event.password, providerModel);
        debugPrint('Print token is $token');
        hasToken=await _srv.hasToken();
      if (hasToken){
        debugPrint('Print hasToken=$hasToken');
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(SharedPrefKeys.token, token);
        emit(AuthSuccess(token,event.username,event.password, _srv.tokenExpDate ?? DateTime.now().subtract(const Duration(minutes: 10)),_srv.publicAddress));
      } else {
        emit(AuthFailure(_srv.requestError ?? ""));
      }
    }
    catch(_){
      emit(AuthFailure(
          _srv.requestError ?? ""));
    }
  }
}
