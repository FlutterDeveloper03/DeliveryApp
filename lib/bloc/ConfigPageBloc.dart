import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:delivery_app/models/appLanguage.dart';

//region Events

class ConfigPageEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadConfigPageEvent extends ConfigPageEvent{}

//endregion Events

//region States
class ConfigPageState extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadingConfigPageState extends ConfigPageState{}

class ConfigPageLoadedState extends ConfigPageState{
  final List<AppLanguage> _languages;
  final String _appVersion;

  ConfigPageLoadedState(this._languages,this._appVersion);

  List<AppLanguage> get getAppLanguages=>_languages;
  String get getAppVersion=>_appVersion;

  @override
  List<Object> get props => [_languages,_appVersion];
}


//endregion States

class ConfigPageBloc extends Bloc<ConfigPageEvent,ConfigPageState>{
  List<AppLanguage> appLanguages=[];

  ConfigPageBloc():super(LoadingConfigPageState()){
    on<LoadConfigPageEvent>(_mapLoadConfigPageToState);
  }

  @override
  void onTransition(Transition<ConfigPageEvent, ConfigPageState> transition){
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  void _mapLoadConfigPageToState(LoadConfigPageEvent event, Emitter<ConfigPageState> emit)async{

    emit(LoadingConfigPageState());
    //region Languages
    appLanguages.add(
        AppLanguage('Türkmen', 'tk', 'TM')
    );
    appLanguages.add(
        AppLanguage('Русский', 'ru', 'RU')
    );
    appLanguages.add(
        AppLanguage('English', 'en', 'US')
    );
    PackageInfo pi = await PackageInfo.fromPlatform();
    String versionStr = '${pi.version}+${pi.buildNumber}';
    //endregion Languages

    emit(ConfigPageLoadedState(appLanguages,versionStr));
  }

}

