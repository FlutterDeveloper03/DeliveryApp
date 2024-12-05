// ignore_for_file: file_names

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/responseModels/resp_api_config.dart';
import 'package:delivery_app/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events
class GlobalConfigEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadGlobalConfigEvent extends GlobalConfigEvent{}
//endregion Events

//region states
class GlobalConfigState extends Equatable{
  @override
  List<Object?> get props => [];
}
class GlobalConfigInitialState extends GlobalConfigState{}
class LoadingGlobalConfigState extends GlobalConfigState{}
class GlobalConfigLoadedState extends GlobalConfigState{
  final RespApiConfig config;

  GlobalConfigLoadedState(this.config);

  get getGlobalConfig=>config;

  @override
  List<Object?> get props => [config];
}
class GlobalConfigLoadErrorState extends GlobalConfigState{
  final String errorStr;

  GlobalConfigLoadErrorState(this.errorStr);

  @override
  List<Object?> get props => [errorStr];

  @override
  toString()=>'GlobalConfigLoadErrorState with error $errorStr';
}

//endregion states

//region bloc

class GlobalConfigBloc extends Bloc<GlobalConfigEvent, GlobalConfigState>{
  final Services srv = Services();

  GlobalConfigBloc():super(GlobalConfigInitialState()){
    on<LoadGlobalConfigEvent>(onLoadGlobalConfig);
  }

  @override
  void onTransition(Transition<GlobalConfigEvent, GlobalConfigState> transition){
    super.onTransition(transition);
    log(transition.toString());
  }

  void onLoadGlobalConfig(LoadGlobalConfigEvent event, Emitter<GlobalConfigState> emit)async{
    emit(LoadingGlobalConfigState());
    try{
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      RespApiConfig? respApiConfig = await srv.getConfig();
      if (respApiConfig!=null) {
        sharedPref.setBool(SharedPrefKeys.NegativeWHQuantityOrder, respApiConfig.NEGATIVE_WH_QTY_ORDER);
        sharedPref.setBool(SharedPrefKeys.ShowNegativeWHQuantityResource, respApiConfig.SHOW_NEGATIVE_WH_QTY_RESOURCE);
        emit(GlobalConfigLoadedState(respApiConfig));
      } else {
        bool negativeWhQtyOrder = sharedPref.getBool(SharedPrefKeys.NegativeWHQuantityOrder) ?? false;
        bool showNegWhQtyRes = sharedPref.getBool(SharedPrefKeys.ShowNegativeWHQuantityResource) ?? false;
        RespApiConfig conf = RespApiConfig(negativeWhQtyOrder, false, showNegWhQtyRes, 1, "OK");
        emit(GlobalConfigLoadedState(conf));
      }
    } catch (e){
      log(e.toString());
      emit(GlobalConfigLoadErrorState(e.toString()));
    }
  }


}

//endregion bloc