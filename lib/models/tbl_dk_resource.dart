// ignore_for_file: non_constant_identifier_names

import 'model.dart';
class TblDkResource extends Model{
  final int ResId;
  final String ResGuid;
  final int ResCatId;
  final int UnitId;
  final String UnitName;
  final int BrandId;
  final int UsageStatusId;
  final int ResMainImgId;
  final String BarcodeVal;
  final String ResRegNo;
  final String ResName;
  final String ResDesc;
  final String ResFullDesc;
//  final double ResPendingTotalAmount;
//  final double ResTotBalance;
//  final double ResPriceValue;
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

  TblDkResource({
    required this.ResId,
    required this.ResGuid,
    required this.ResCatId,
    required this.UnitId,
    required this.UnitName,
    required this.BrandId,
    required this.UsageStatusId,
    required this.ResMainImgId,
    required this.BarcodeVal,
    required this.ResRegNo,
    required this.ResName,
    required this.ResDesc,
    required this.ResFullDesc,
//    required this.ResPendingTotalAmount,
//    required this.ResTotBalance,
//    required this.ResPriceValue,
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
  });

  @override
  Map<String,dynamic> toMap()=>{
    "ResId":ResId,
    "ResGuid":ResGuid,
    "ResCatId":ResCatId,
    "UnitId":UnitId,
    "UnitName":UnitName,
    "BrandId":BrandId,
    "UsageStatusId":UsageStatusId,
    "ResMainImgId":ResMainImgId,
    "BarcodeVal":BarcodeVal,
    "ResRegNo":ResRegNo,
    "ResName":ResName,
    "ResDesc":ResDesc,
    "ResFullDesc":ResFullDesc,
//    "ResPendingTotalAmount":ResPendingTotalAmount,
//    "ResTotBalance":ResTotBalance,
//    "ResPriceValue":ResPriceValue,
    "ResMinSaleAmount":ResMinSaleAmount,
    "ResMaxSaleAmount":ResMaxSaleAmount,
    "ResMinSalePrice":ResMinSalePrice,
    "ResMaxSalePrice":ResMaxSalePrice,
    "AddInf1":AddInf1,
    "AddInf2":AddInf2,
    "AddInf3":AddInf3,
    "AddInf4":AddInf4,
    "AddInf5":AddInf5,
    "AddInf6":AddInf6,
    "CreatedDate":CreatedDate?.toString(),
    "ModifiedDate":ModifiedDate?.toString(),
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.millisecondsSinceEpoch : null,
  };

  static TblDkResource fromMap(Map<String,dynamic> map)=>
    TblDkResource(
      ResId:map['ResId'] ?? 0,
      ResGuid:map['ResGuid'] ?? "",
      ResCatId:map['ResCatId'] ?? 0,
      UnitId:map['UnitId'] ?? 0,
      UnitName:map['UnitName']?.toString() ?? "",
      BrandId:map['BrandId'] ?? 0,
      UsageStatusId:map['UsageStatusId'] ?? 0,
      ResMainImgId:map['ResMainImgId'] ?? 0,
      BarcodeVal:(map["BarcodeVal"]!=null) ? map["BarcodeVal"].toString() : "",
      ResRegNo:map['ResRegNo']?.toString() ?? "",
      ResName:map['ResName']?.toString() ?? "",
      ResDesc:map['ResDesc']?.toString() ?? "",
      ResFullDesc:map['ResFullDesc']?.toString() ?? "",
//      ResPendingTotalAmount:map['ResPendingTotalAmount'] ?? 0,
//      ResTotBalance:map["ResTotBalance"] ?? 0,
//      ResPriceValue:map["ResPriceValue"] ?? 0,
      ResMinSaleAmount:map['ResMinSaleAmount'] ?? 0,
      ResMaxSaleAmount:map['ResMaxSaleAmount'] ?? 0,
      ResMinSalePrice:map['ResMinSalePrice'] ?? 0,
      ResMaxSalePrice:map['ResMaxSalePrice'] ?? 0,
      AddInf1:map['AddInf1']?.toString() ?? "",
      AddInf2:map['AddInf2']?.toString() ?? "",
      AddInf3:map['AddInf3']?.toString() ?? "",
      AddInf4:map['AddInf4']?.toString() ?? "",
      AddInf5:map['AddInf5']?.toString() ?? "",
      AddInf6:map['AddInf6']?.toString() ?? "",
      CreatedDate:DateTime.parse(map['CreatedDate']?.toString() ?? '1900-01-01'),
      ModifiedDate:DateTime.parse(map['ModifiedDate']?.toString() ?? '1900-01-01'),
      SyncDateTime:(map['SyncDateTime']!=null) ? DateTime.fromMillisecondsSinceEpoch(map['SyncDateTime'] ?? 0) : null,
        );
}