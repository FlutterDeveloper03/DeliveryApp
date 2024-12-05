// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/tbl_dk_res_price.dart';

class VDkResource {
  final int ResId;
  final String ResGuid;
  final int ResCatId;
  final int UnitId;
  final String UnitName;
  final int BrandId;
  final int ResPriceGroupId;
  final double SalePrice;
  final double ResPendingTotalAmount;
  final double ResTotBalance;
  final int UsageStatusId;
  final int ResMainImgId;
  final String ResRegNo;
  final String BarcodeVal;
  final String ResName;
  final String ResDesc;
  final String ResFullDesc;
  final double ResMinSaleAmount;
  final double ResMaxSaleAmount;
  final double ResMinSalePrice;
  final double ResMaxSalePrice;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;
  final List<TblDkResPrice>? TblDkResPrices;

  VDkResource(
     {required this.ResId,
      required this.ResGuid,
      required this.ResCatId,
      required this.UnitId,
      required this.UnitName,
      required this.BrandId,
      required this.ResPriceGroupId,
      required this.SalePrice,
      required this.ResPendingTotalAmount,
      required this.ResTotBalance,
      required this.UsageStatusId,
      required this.ResMainImgId,
      required this.ResRegNo,
      required this.BarcodeVal,
      required this.ResName,
      required this.ResDesc,
      required this.ResFullDesc,
      required this.ResMinSaleAmount,
      required this.ResMaxSaleAmount,
      required this.ResMinSalePrice,
      required this.ResMaxSalePrice,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.SyncDateTime,
      required this.TblDkResPrices});

  static VDkResource fromMap(Map<String,dynamic> map){
    return VDkResource(
        ResId:map["ResId"],
        ResGuid:map["ResGuid"],
        ResCatId:map["ResCatId"],
        UnitId:map["UnitId"],
        UnitName:map["UnitName"],
        BrandId:map["BrandId"],
        ResPriceGroupId:map["ResPriceGroupId"],
        SalePrice:map["ResPriceValue"] ?? 0,
        ResPendingTotalAmount:map["ResPendingTotalAmount"] ?? 0,
        ResTotBalance:map["ResTotBalance"] ?? 0,
        UsageStatusId:map["UsageStatusId"],
        ResMainImgId:map["ResMainImgId"],
        ResRegNo:map["ResRegNo"].toString(),
        BarcodeVal:map["BarcodeVal"].toString(),
        ResName:map["ResName"].toString(),
        ResDesc:map["ResDesc"].toString(),
        ResFullDesc:map["ResFullDesc"].toString(),
        ResMinSaleAmount:map["ResMinSaleAmount"],
        ResMaxSaleAmount:map["ResMaxSaleAmount"],
        ResMinSalePrice:map["ResMinSalePrice"],
        ResMaxSalePrice:map["ResMaxSalePrice"],
        AddInf1:map["AddInf1"]?.toString() ?? "",
        AddInf2:map["AddInf2"]?.toString() ?? "",
        AddInf3:map["AddInf3"]?.toString() ?? "",
        AddInf4:map["AddInf4"]?.toString() ?? "",
        AddInf5:map["AddInf5"]?.toString() ?? "",
        AddInf6:map["AddInf6"]?.toString() ?? "",
        CreatedDate:map["CreatedDate"],
        ModifiedDate:map["ModifiedDate"],
        SyncDateTime:map["SyncDateTime"],
        TblDkResPrices:map["TblDkResPrices"]
    );
  }
}
