// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:delivery_app/models/CartItem.dart';
import 'package:delivery_app/models/Views/v_dk_orders.dart';
import 'package:delivery_app/models/Views/v_dk_resource.dart';
import 'package:delivery_app/models/responseModels/resp_api_config.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';
import 'package:delivery_app/models/responseModels/resp_dk_user.dart';
import 'package:delivery_app/models/tbl_dk_company.dart';
import 'package:delivery_app/models/tbl_dk_payment_methods.dart';
import 'package:delivery_app/models/tbl_dk_payment_types.dart';
import 'package:delivery_app/models/tbl_dk_res_category.dart';
import 'package:delivery_app/models/tbl_dk_res_price_group.dart';
import 'package:delivery_app/models/tbl_dk_rp_acc.dart';

class ProviderModel with ChangeNotifier{

  Resp_dk_user? _user;
  Resp_dk_user? get getUser=>_user;
  set setUser(Resp_dk_user user){
    _user = user;
    notifyListeners();
  }
  List<TblDkPaymentMethods> _paymentMethods=[];
  List<TblDkPaymentMethods> get getPaymentMethods=>_paymentMethods;
  set setPaymentMethods(List<TblDkPaymentMethods> paymentMethods){
    _paymentMethods = paymentMethods;
    notifyListeners();
  }

  List<TblDkPaymentTypes> _paymentTypes=[];
  List<TblDkPaymentTypes> get getPaymentTypes=>_paymentTypes;
  set setPaymentTypes(List<TblDkPaymentTypes> paymentTypes){
    _paymentTypes = paymentTypes;
    notifyListeners();
  }

  List<TblDkRpAcc> _rpAccs=[];
  List<TblDkRpAcc> get getRpAccs=>_rpAccs;
  set setRpAccs(List<TblDkRpAcc> rpAccs){
    _rpAccs = rpAccs;
    notifyListeners();
  }

  List<VDkResource> _resources=[];
  List<VDkResource> get getResources=>_resources;
  set setResources(List<VDkResource> resources){
    _resources = resources;
    notifyListeners();
  }

  List<TblDkResCategory> _resCategories=[];
  List<TblDkResCategory> get getResCategories=>_resCategories;
  set setResCategories(List<TblDkResCategory> resCategories){
    _resCategories = resCategories;
    notifyListeners();
  }

  List<TblDkResPriceGroup> _resPriceGroups=[];
  List<TblDkResPriceGroup> get getResPriceGroups=>_resPriceGroups;
  set setResPriceGroups(List<TblDkResPriceGroup> resPriceGroups){
    _resPriceGroups = resPriceGroups;
    notifyListeners();
  }

  RespApiConfig _apiConfig=RespApiConfig(false,false,false,1,'');
  RespApiConfig get  getApiConfig=>_apiConfig;
  set setApiConfig(RespApiConfig apiConfig){
    _apiConfig=apiConfig;
    notifyListeners();
  }

  TblDkRpAcc? _rpAcc;
  TblDkRpAcc? get getRpAcc=>_rpAcc;
  set setRpAcc(TblDkRpAcc? rpAcc) {
    _rpAcc = rpAcc;
    notifyListeners();
  }

  TblDkCompany? _company;
  TblDkCompany? get getCompany=>_company;
  set setCompany(TblDkCompany company){
    _company = company;
    notifyListeners();
  }

  List<CartItem> _cartItems=[];
  List<CartItem> get  getCartItems=>_cartItems;
  set setCartItems(List<CartItem> cartItems){
    _cartItems=cartItems;
    notifyListeners();
  }

  List<Resp_dk_order_inv> _orders=[];
  List<Resp_dk_order_inv> get getOrders=>_orders;
  set setOrders(List<Resp_dk_order_inv> orders){
    _orders = orders;
    notifyListeners();
  }

  List<Resp_dk_order_inv_status> _orderStatuses=[];
  List<Resp_dk_order_inv_status> get getOrderStatuses=>_orderStatuses;
  set setOrderStatuses(List<Resp_dk_order_inv_status> orderStatuses){
    _orderStatuses = orderStatuses;
    notifyListeners();
  }

  List<Resp_dk_order_inv> _newOrders=[];
  List<Resp_dk_order_inv> get getNewOrders=>_newOrders;
  set setNewOrders(List<Resp_dk_order_inv> newOrders){
    _newOrders = newOrders;
    notifyListeners();
  }


  List<VDkOrder> _ordersDetailed=[];
  List<VDkOrder> get getOrdersDetailed=>_ordersDetailed;
  set setOrdersDetailed(List<VDkOrder> ordersDetailed){
    _ordersDetailed = ordersDetailed;
  }

  bool _sendingAllOrders=false;
  bool get  getSendingAllOrders=>_sendingAllOrders;
  set setSendingAllOrders(bool sendingAllOrders){
    _sendingAllOrders=sendingAllOrders;
    notifyListeners();
  }

  int _resPriceGroupId=0;
  int get  getResPriceGroupId=>_resPriceGroupId;
  set setResPriceGroupId(int resPriceGroupId){
    _resPriceGroupId=resPriceGroupId;
    notifyListeners();
  }

  DateTime _ordersStartDate = DateTime.now();
  DateTime get getOrdersStartDate=>_ordersStartDate;
  set setOrdersStartDate(DateTime ordersStartDate) {
    _ordersStartDate = ordersStartDate;
    notifyListeners();
  }

  DateTime _ordersEndDate = DateTime.now();
  DateTime get getOrdersEndDate=>_ordersEndDate;
  set setOrdersEndDate(DateTime ordersEndDate) {
    _ordersEndDate = ordersEndDate;
    notifyListeners();
  }
}