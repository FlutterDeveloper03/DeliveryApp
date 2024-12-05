// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/Helpers/dbHelper.dart';
import 'package:delivery_app/models/tbl_dk_res_price_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events

class UserConfigPageEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadUserConfigPageEvent extends UserConfigPageEvent{}

//endregion Events

//region States
class UserConfigPageState extends Equatable{
  @override
  List<Object> get props => [];

}

class LoadingUserConfigPageState extends UserConfigPageState{}

class UserConfigPageLoadedState extends UserConfigPageState{
  final List<TblDkResPriceGroup> _priceGroups;
  final int _priceGroupId;

  UserConfigPageLoadedState(this._priceGroups,this._priceGroupId);

  List<TblDkResPriceGroup> get getPriceGroups=>_priceGroups;
  int get getPriceGroupId=>_priceGroupId;

  @override
  List<Object> get props => [_priceGroups,_priceGroupId];
}

class ErrorLoadUserConfigPage extends UserConfigPageState{
  final String errorText;

  ErrorLoadUserConfigPage(this.errorText);

  String get getErrorStr=>errorText;

  @override
  List<Object> get props => [errorText];
}


//endregion States

class UserConfigPageBloc extends Bloc<UserConfigPageEvent,UserConfigPageState>{
  List<TblDkResPriceGroup> priceGroups=[];

  UserConfigPageBloc():super(LoadingUserConfigPageState()){
    on<LoadUserConfigPageEvent>(onLoadUserConfigPageEvent);
  }

  @override
  void onTransition(Transition<UserConfigPageEvent, UserConfigPageState> transition){
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  void onLoadUserConfigPageEvent(LoadUserConfigPageEvent event, Emitter<UserConfigPageState> emit)async{
    emit(LoadingUserConfigPageState());
    try{
      List<Map<String,dynamic>> mapPriceGroups = await DbHelper.queryAllRows("tbl_dk_res_price_group");
      if(mapPriceGroups.isNotEmpty){
        priceGroups = mapPriceGroups.map((e) => TblDkResPriceGroup.fromMap(e)).toList();
      }

      final sharedPref = await SharedPreferences.getInstance();
      int priceGroupId = sharedPref.getInt(SharedPrefKeys.ResPriceGroupId) ?? 0;

      emit(UserConfigPageLoadedState(priceGroups,priceGroupId));
    } catch(e){
      debugPrint("PrintError: ${e.toString()}");
      emit(ErrorLoadUserConfigPage(e.toString()));
    }
  }

}

