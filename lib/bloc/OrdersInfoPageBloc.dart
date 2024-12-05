// ignore_for_file: file_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/putOrderStatusResponse.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';
import 'package:delivery_app/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Events
abstract class OrdersInfoPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadOrderStatusesEvent extends OrdersInfoPageEvent {}

class ChangeOrderStatusEvent extends OrdersInfoPageEvent{
  final Resp_dk_order_inv_status orderStatus;
  final Resp_dk_order_inv order;

  ChangeOrderStatusEvent(this.orderStatus, this.order);

  @override
  List<Object> get props => [orderStatus, order];
}
//endregion Events

//region States

abstract class OrdersInfoPageState extends Equatable {

  @override
  List<Object> get props => [];

}

class OrdersInfoPageInitial extends OrdersInfoPageState {}

class LoadingOrderStatusesState extends OrdersInfoPageState {}

class OrderStatusesLoadedState extends OrdersInfoPageState {
  final List<Resp_dk_order_inv_status> _orderStatuses;

  OrderStatusesLoadedState(this._orderStatuses);

  List<Resp_dk_order_inv_status> get getOrderStatusesList => _orderStatuses;

  @override
  List<Object> get props => [_orderStatuses];
}

class OrderStatusesEmptyState extends OrdersInfoPageState {}

class OrderStatusesLoadErrorState extends OrdersInfoPageState {
  final String errorText;

  OrderStatusesLoadErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}

class ChangingOrderStatusState extends OrdersInfoPageState {}

class OrderStatusChangedState extends OrdersInfoPageState {
  final PutOrderStatusResponse orderStatusResponse;

  OrderStatusChangedState(this.orderStatusResponse);

  @override
  List<Object> get props => [orderStatusResponse];
}

class OrderStatusChangeErrorState extends OrdersInfoPageState {
  final String errorText;

  OrderStatusChangeErrorState(this.errorText);

  @override
  List<Object> get props => [errorText];
}
//endregion States

class OrdersInfoPageBloc extends Bloc<OrdersInfoPageEvent, OrdersInfoPageState> {
  final Services _srv;
  final ProviderModel providerModel;
  OrdersInfoPageBloc(this._srv, this.providerModel) :super(OrdersInfoPageInitial()) {
    on<LoadOrderStatusesEvent>(onLoadOrderStatusesEvent);
    on<ChangeOrderStatusEvent>(_onChangeOrderStatusEvent);
  }

  Future<void> onLoadOrderStatusesEvent(LoadOrderStatusesEvent event, Emitter<OrdersInfoPageState> emit) async{
    emit(LoadingOrderStatusesState());
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(SharedPrefKeys.token) ?? '';
      List<Resp_dk_order_inv_status> orderStatuses = await _srv.getOrderStatuses(token);
      if(orderStatuses.isNotEmpty) {
        emit(OrderStatusesLoadedState(orderStatuses));
      }
      else {
        emit(OrderStatusesEmptyState());
      }
    } catch (e) {
      debugPrint("Print error getting Orders from remote api (${e.toString()})");
      emit(OrderStatusesLoadErrorState(e.toString()));
    }
  }

  Future<void> _onChangeOrderStatusEvent(ChangeOrderStatusEvent event, Emitter<OrdersInfoPageState> emit) async{
    emit(ChangingOrderStatusState());
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(SharedPrefKeys.token) ?? '';
      PutOrderStatusResponse? orderStatusResponse = await _srv.updateOrderStatus(token, event.order.OInvId, event.orderStatus.InvStatGuid);
      if(orderStatusResponse != null){
        emit(OrderStatusChangedState(orderStatusResponse));
      }
      else{
        emit(OrderStatusChangeErrorState(orderStatusResponse!.errorMessages.first));
      }
    } catch (e) {
      debugPrint("Print error updating order status (${e.toString()})");
      emit(OrderStatusChangeErrorState(e.toString()));
    }
  }
}