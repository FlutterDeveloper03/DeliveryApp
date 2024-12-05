// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/Helpers/enums.dart';

//region States
class SplashScreenPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashScreenPageInitial extends SplashScreenPageState {}

class LoadingSplashScreenPageData extends SplashScreenPageState {
  final Status settings;
  final Status loadingData;

  LoadingSplashScreenPageData(this.settings, this.loadingData);

  @override
  List<Object> get props => [settings, loadingData];
}

class SplashScreenPageLoadedState extends SplashScreenPageState {

  SplashScreenPageLoadedState();

  @override
  List<Object> get props => [];
}

class ServerSettingsEmptyState extends SplashScreenPageState {}

class CantConnectToServerState extends SplashScreenPageState {}


class SplashScreenPageErrorState extends SplashScreenPageState {
  final String _errorString;

  SplashScreenPageErrorState(this._errorString);

  String get getErrorString => _errorString;

  @override
  List<Object> get props => [_errorString];
}

//endregion States

class SplashScreenPageCubit extends Cubit<SplashScreenPageState> {


  SplashScreenPageCubit() : super(SplashScreenPageInitial());

  void loadSplashScreenPage({int? loadMode}) async {
    emit(LoadingSplashScreenPageData(Status.progress, Status.progress));
    await Future.delayed(const Duration(seconds: 8));
    emit(SplashScreenPageLoadedState());
  }
}
