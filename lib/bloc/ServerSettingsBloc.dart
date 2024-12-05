// ignore_for_file: file_names

import 'package:android_id/android_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events

class ServerSettingsEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadServerSettings extends ServerSettingsEvent{}

class SaveServerSettings extends ServerSettingsEvent{
  final String serverName;
  final String serverUName;
  final String serverUPass;
  final String dbName;
  final String apiPrefix;
  final int defaultConnectionMode; //1 API, 2 Direct

  SaveServerSettings(this.serverName,this.serverUName,this.serverUPass,this.dbName,this.apiPrefix,this.defaultConnectionMode);

  @override
  List<Object> get props => [serverName,serverUName,serverUPass,dbName,apiPrefix,defaultConnectionMode];

}


//endregion Events

//region States
class ServerSettingsState extends Equatable{

  @override
  List<Object> get props => [];

}

class ServerSettingsInitialState extends ServerSettingsState{}
class LoadingServerSettingsState extends ServerSettingsState{}

class ServerSettingsLoadedState extends ServerSettingsState{
  final String deviceId;
  final String serverName;
  final String serverUName;
  final String serverUPass;
  final String dbName;
  final String apiPrefix;
  final int defaultConnectionMode;


  ServerSettingsLoadedState(this.deviceId, this.serverName,this.serverUName, this.serverUPass,this.dbName, this.apiPrefix,this.defaultConnectionMode);


  String get getDeviceId=>deviceId;
  String get getServerName=>serverName;
  String get getServerUName=>serverUName;
  String get getServerUPass=>serverUPass;
  String get getDbName=>dbName;
  String get getApiPrefix=>apiPrefix;
  int get getDefaultConnectionMode=>defaultConnectionMode;

  @override
  List<Object> get props => [deviceId,serverName,serverUName,serverUPass,dbName,apiPrefix,defaultConnectionMode];
}

class SavingServerSettingsState extends ServerSettingsState{}

class ServerSettingsSavedState extends ServerSettingsState{
  final String serverName;
  final String serverUName;
  final String serverUPass;
  final String dbName;
  final String apiPrefix;
  final int defaultConnectionMode;



  ServerSettingsSavedState(this.serverName,this.serverUName, this.serverUPass,this.dbName, this.apiPrefix,this.defaultConnectionMode);


  String get getServerName=>serverName;
  String get getServerUName=>serverUName;
  String get getServerUPass=>serverUPass;
  String get getDbName=>dbName;
  String get getApiPrefix=>apiPrefix;
  int get getDefaultConnectionMode=>defaultConnectionMode;

  @override
  List<Object> get props => [serverName,serverUName,serverUPass,dbName,apiPrefix,defaultConnectionMode];
}
class ErrorSaveServerSettingsState extends ServerSettingsState{
  final String errorText;


  ErrorSaveServerSettingsState(this.errorText);


  String get getErrorText=>errorText;

  @override
  List<Object> get props => [errorText];
}


//endregion States

//region Bloc

class ServerSettingsBloc extends Bloc<ServerSettingsEvent,ServerSettingsState>{

  ServerSettingsBloc():super(ServerSettingsInitialState()){
    on<LoadServerSettings>(onLoadServerSettings);
    on<SaveServerSettings>(onSaveServerSettings);
  }

  String _deviceId="";
  String _serverName="";
  String _serverUName="";
  String _serverUPass="";
  String _dbName="";
  String _apiPrefix="";
  int _defaultConnectionMode=1;


  @override
  void onTransition(Transition<ServerSettingsEvent, ServerSettingsState> transition){
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  void onLoadServerSettings(LoadServerSettings event, Emitter<ServerSettingsState> emit)async{
    emit(LoadingServerSettingsState());
    try{
      _deviceId = await const AndroidId().getId() ?? '';

      final sharedPref = await SharedPreferences.getInstance();
      _serverName = sharedPref.getString(SharedPrefKeys.ServerName) ?? "";
      _serverUName = sharedPref.getString(SharedPrefKeys.ServerUName) ?? "";
      _serverUPass = sharedPref.getString(SharedPrefKeys.ServerUPass) ?? "";
      _apiPrefix = sharedPref.getString(SharedPrefKeys.ApiPrefix) ?? "";
      _dbName = sharedPref.getString(SharedPrefKeys.DbName) ?? "";
      _defaultConnectionMode = sharedPref.getInt(SharedPrefKeys.DefaultDbConMode) ?? 1;


      emit(ServerSettingsLoadedState(_deviceId,_serverName,_serverUName,_serverUPass,_dbName,_apiPrefix,_defaultConnectionMode));
    } catch (ex){
      emit(ServerSettingsLoadedState(_deviceId,_serverName,_serverUName,_serverUPass,_dbName,_apiPrefix,_defaultConnectionMode));
    }

  }


  void onSaveServerSettings(SaveServerSettings event,Emitter<ServerSettingsState> emit)async{
    emit(SavingServerSettingsState());
    try {
      final sharedPref = await SharedPreferences.getInstance();
      _serverName = event.serverName;
      _serverUName = event.serverUName;
      _serverUPass = event.serverUPass;
      _apiPrefix = event.apiPrefix;
      _dbName = event.dbName;
      _defaultConnectionMode = event.defaultConnectionMode;

      sharedPref.setString(SharedPrefKeys.ServerName, _serverName);
      sharedPref.setString(SharedPrefKeys.ServerUName, _serverUName);
      sharedPref.setString(SharedPrefKeys.ServerUPass, _serverUPass);
      sharedPref.setString(SharedPrefKeys.DbName, _dbName);
      sharedPref.setString(SharedPrefKeys.ApiPrefix, _apiPrefix);
      sharedPref.setInt(SharedPrefKeys.DefaultDbConMode, _defaultConnectionMode);

      emit(ServerSettingsSavedState(_serverName,_serverUName,_serverUPass,_dbName,_apiPrefix,_defaultConnectionMode));
    } on Exception catch (e) {
      emit(ErrorSaveServerSettingsState(e.toString()));
    }
  }


}

//endregion Bloc