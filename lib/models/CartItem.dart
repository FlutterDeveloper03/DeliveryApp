

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/Views/v_dk_resource.dart';

class CartItem {
  int ResId;
  VDkResource? resource;
  double ResTotBalance;
  double ItemCount;
  int ResPriceGroupId;
  double ResPriceValue;
  double ItemPriceTotal;
  double ResPendingTotalAmount;

  CartItem({
    required this.ResId,
    required this.resource,
    required this.ResTotBalance,
    required this.ItemCount,
    required this.ResPriceGroupId,
    required this.ResPriceValue,
    required this.ItemPriceTotal,
    required this.ResPendingTotalAmount
  });
}
