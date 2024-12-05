// ignore_for_file: file_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events
class NewOrdersPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadNewOrdersEvent extends NewOrdersPageEvent {}

class SearchNewOrdersEvent extends NewOrdersPageEvent {
  final List<Resp_dk_order_inv> orders;
  final String searchText;

  SearchNewOrdersEvent(this.orders, this.searchText);

  @override
  List<Object> get props => [orders, searchText];
}

class SortNewOrdersEvent extends NewOrdersPageEvent{
  final String statusValue;
  final String dateValue;

  SortNewOrdersEvent(this.statusValue, this.dateValue);

  @override
  List<Object> get props => [statusValue, dateValue];
}
//endregion Events

//region States

class NewOrdersPageState extends Equatable {

  @override
  List<Object> get props => [];

}

class NewOrdersPageInitial extends NewOrdersPageState {}

class LoadingNewOrdersState extends NewOrdersPageState {}

class NewOrdersLoadedState extends NewOrdersPageState {
  final List<Resp_dk_order_inv> _orders;

  NewOrdersLoadedState(this._orders);

  List<Resp_dk_order_inv> get getOrdersList => _orders;

  @override
  List<Object> get props => [_orders];
}
class SearchingNewOrdersCompletedState extends NewOrdersPageState {
  final List<Resp_dk_order_inv> _orders;
  final String _searchedText;

  SearchingNewOrdersCompletedState(this._orders, this._searchedText);

  List<Resp_dk_order_inv> get getOrdersList => _orders;

  String get getSearchedText => _searchedText;

  @override
  List<Object> get props => [_orders];
}

class SearchNewOrdersEmptyState extends NewOrdersPageState {}

class NewOrdersSearchErrorState extends NewOrdersPageState {
  final String errorText;

  NewOrdersSearchErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}

class NewOrdersEmptyState extends NewOrdersPageState {}

class NewOrdersLoadErrorState extends NewOrdersPageState {
  final String errorText;

  NewOrdersLoadErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}

class NewOrdersSortedState extends NewOrdersPageState {
  final List<Resp_dk_order_inv> sortedOrders;

  NewOrdersSortedState(this.sortedOrders);

  @override
  List<Object> get props => [sortedOrders];
}

class NewOrdersSortErrorState extends NewOrdersPageState {
  final String errorText;

  NewOrdersSortErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}

class NewOrdersSortEmptyState extends NewOrdersPageState{}
//endregion States

class NewOrdersPageBloc extends Bloc<NewOrdersPageEvent, NewOrdersPageState> {
  final Services _srv;
  final ProviderModel providerModel;
  NewOrdersPageBloc(this._srv, this.providerModel) :super(NewOrdersPageInitial()) {
    on<LoadNewOrdersEvent>(onLoadNewOrdersEvent);
    on<SearchNewOrdersEvent>(onSearchNewOrdersEvent);
    on<SortNewOrdersEvent>(onSortNewOrdersEvent);
  }

  Future<void> onLoadNewOrdersEvent(LoadNewOrdersEvent event, Emitter<NewOrdersPageState> emit) async{
    emit(LoadingNewOrdersState());
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(SharedPrefKeys.token) ?? '';
      List<Resp_dk_order_inv> newOrders = await _srv.getOrders(token, '', '', '');
      if(newOrders.isNotEmpty) {
          emit(NewOrdersLoadedState(newOrders));
        }
      else{
        emit(NewOrdersEmptyState());
      }
    } catch (e) {
      debugPrint("Print error getting new Orders from remote api (${e.toString()})");
      emit(NewOrdersLoadErrorState(e.toString()));
    }
  }

  void onSearchNewOrdersEvent(SearchNewOrdersEvent event, Emitter<NewOrdersPageState> emit)async{
    emit(LoadingNewOrdersState());
    try {
      List<Resp_dk_order_inv> searchResultList = [];
      searchResultList = event.orders
          .where((element) =>
      ((element.OInvRegNo.isNotEmpty) ? element.OInvRegNo.toLowerCase().contains(event.searchText.toLowerCase()) : false) ||
          ((element.RpAcc !=null) ? element.RpAcc!.RpAccName.toLowerCase().contains(event.searchText.toLowerCase()) : false) ||
          ((element.RpAcc !=null && element.RpAcc!.RpAccMobilePhoneNumber.isNotEmpty)
              ? element.RpAcc!.RpAccMobilePhoneNumber.toLowerCase().contains(event.searchText.toLowerCase())
              : false) ||
          ((element.RpAcc !=null && element.RpAcc!.RpAccAddress.isNotEmpty) ? element.RpAcc!.RpAccAddress.toLowerCase().contains(event.searchText.toLowerCase()) : false) ||
          ((element.RpAcc !=null && element.AddInf6.isNotEmpty) ? element.AddInf6.toLowerCase().contains(event.searchText.toLowerCase()) : false))
          .toList();
      if (searchResultList.isNotEmpty) {
        emit(SearchingNewOrdersCompletedState(searchResultList, event.searchText));
      } else {
        emit(SearchNewOrdersEmptyState());
      }
    } catch (e) {
      emit(NewOrdersSearchErrorState(e.toString()));
    }
  }

  void onSortNewOrdersEvent(SortNewOrdersEvent event, Emitter<NewOrdersPageState> emit) async{
    emit(LoadingNewOrdersState());
    try{
      List<Resp_dk_order_inv> sortedOrders = providerModel.getNewOrders;
      if(providerModel.getOrderStatuses.where((element) => element.InvStatGuid==event.statusValue).isNotEmpty) {
        sortedOrders = sortedOrders.where(
                (element) => element.InvStatId==providerModel.getOrderStatuses.firstWhere(
                    (element) => element.InvStatGuid==event.statusValue).InvStatId).toList();
      }
      sortedOrders.sort((a, b) {
        int result = 0;
        switch (event.dateValue) {
          case "From early to late":
            result = a.OInvDate!.compareTo(b.OInvDate!);
            break;
          case "From late to early":
            result = b.OInvDate!.compareTo(a.OInvDate!);
            break;
        }
        return result;
      });

      if(sortedOrders.isNotEmpty) {
        emit(NewOrdersSortedState(sortedOrders));
      }
      else{
        emit(NewOrdersSortEmptyState());
      }
    }
    catch(e){
      emit(NewOrdersSortErrorState(e.toString()));
    }
  }
}