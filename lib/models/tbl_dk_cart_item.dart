

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/model.dart';

class TblDkCartItem extends Model {
  final int ResId;
  final int RpAccId;
  final String ResRegNo;
  final double ItemCount;
  final double ResTotBalance;
  final int ResPriceGroupId;
  final double ResPriceValue;
  final double ItemPriceTotal;
  final double ResPendingTotalAmount;

  TblDkCartItem({
    required this.ResId,
    required this.RpAccId,
    required this.ResRegNo,
    required this.ItemCount,
    required this.ResTotBalance,
    required this.ResPriceGroupId,
    required this.ResPriceValue,
    required this.ItemPriceTotal,
    required this.ResPendingTotalAmount,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'ResId': ResId,
      'RpAccId':RpAccId,
      'ResRegNo': ResRegNo,
      'ItemCount': ItemCount,
      'ResTotBalance': ResTotBalance,
      'ResPriceGroupId':ResPriceGroupId,
      'ResPriceValue': ResPriceValue,
      'ItemPriceTotal': ItemPriceTotal,
      'ResPendingTotalAmount': ResPendingTotalAmount
    };
    return map;
  }

  static TblDkCartItem fromMap(Map<String, dynamic> map) {
    return TblDkCartItem(
      ResId: map['ResId'] ?? 0,
      RpAccId: map['RpAccId'] ?? 0,
      ResRegNo: map['ResRegNo']?.toString() ?? "",
      ItemCount: map['ItemCount'] ?? 0,
      ResTotBalance: map['ResTotBalance'] ?? 0,
      ResPriceGroupId:map['ResPriceGroupId'] ?? 0,
      ResPriceValue: map['ResPriceValue'] ?? 0,
      ItemPriceTotal: map['ItemPriceTotal'] ?? 0,
      ResPendingTotalAmount: map['ResPendingTotalAmount'] ?? 0,
    );
  }
}
