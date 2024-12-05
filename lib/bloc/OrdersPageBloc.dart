// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


//region Events
class OrdersPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadOrdersEvent extends OrdersPageEvent {
  final DateTime startDate;
  final DateTime endDate;

  LoadOrdersEvent(this.startDate, this.endDate);

  @override
  List<Object> get props => [startDate, endDate];
}

class SearchOrdersEvent extends OrdersPageEvent {
  final List<Resp_dk_order_inv> orders;
  final String searchText;
  final DateTime startDate;
  final DateTime endDate;

  SearchOrdersEvent(this.orders, this.searchText, this.startDate, this.endDate);

  @override
  List<Object> get props => [orders, searchText, startDate, endDate];
}

//endregion Events

//region States

class OrdersPageState extends Equatable {

  @override
  List<Object> get props => [];

}

class OrdersPageInitial extends OrdersPageState {}

class LoadingOrdersState extends OrdersPageState {}

class OrdersLoadedState extends OrdersPageState {
  final List<Resp_dk_order_inv> _orders;

  OrdersLoadedState(this._orders);

  List<Resp_dk_order_inv> get getOrdersList => _orders;

  @override
  List<Object> get props => [_orders];
}

class SearchingCompletedState extends OrdersPageState {
  final List<Resp_dk_order_inv> _orders;
  final String _searchedText;

  SearchingCompletedState(this._orders, this._searchedText);

  List<Resp_dk_order_inv> get getOrdersList => _orders;

  String get getSearchedText => _searchedText;

  @override
  List<Object> get props => [_orders];
}

class SearchResultEmptyState extends OrdersPageState {}

class OrdersEmptyState extends OrdersPageState {}

class OrdersLoadErrorState extends OrdersPageState {
  final String errorText;

  OrdersLoadErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}
//endregion Orders

class OrdersPageBloc extends Bloc<OrdersPageEvent, OrdersPageState> {
  final Services _srv;
  final ProviderModel providerModel;
  OrdersPageBloc(this._srv, this.providerModel) :super(OrdersPageInitial()){
    on<LoadOrdersEvent>(onLoadOrdersEvent);
    on<SearchOrdersEvent>(onSearchOrdersEvent);
  }

  void onLoadOrdersEvent(LoadOrdersEvent event, Emitter<OrdersPageState> emit)async{
    emit(LoadingOrdersState());
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(SharedPrefKeys.token) ?? '';
      List<Resp_dk_order_inv> orders = await _srv.getOrders(token, '', '', '');
      DateTime endDate = event.endDate.add(const Duration(hours: 23,minutes: 59,seconds: 59,milliseconds: 999));
      orders = orders.where((element) => element.OInvDate!.isAfterDate(event.startDate)  && element.OInvDate!.compareTo((endDate))<=0).toList();
      if(orders.isNotEmpty) {
         emit(OrdersLoadedState(orders));
      }
      else{
        emit(OrdersEmptyState());
      }
    } catch (e) {
      debugPrint("Print error getting Orders from remote api (${e.toString()})");
      emit(OrdersLoadErrorState(e.toString()));
    }
  }

  void onSearchOrdersEvent(SearchOrdersEvent event, Emitter<OrdersPageState> emit)async{
    emit(LoadingOrdersState());
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
        emit(SearchingCompletedState(searchResultList, event.searchText));
      } else {
        emit(SearchResultEmptyState());
      }
    } catch (e) {
      emit(OrdersLoadErrorState(e.toString()));
    }
  }
}

extension DateOnlyCompare on DateTime {
  bool isAfterDate(DateTime other) {
    return year >= other.year && month >= other.month
        && day >= other.day;
  }
}