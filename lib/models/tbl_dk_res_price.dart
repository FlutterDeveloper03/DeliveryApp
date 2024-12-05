// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkResPrice extends Model{
  final int ResPriceId;
  final int ResPriceGroupId;
  final int UnitId;
  final int CurrencyId;
  final int ResId;
  final String ResPriceRegNo;
  final double ResPriceValue;
  final DateTime? PriceStartDate;
  final DateTime? PriceEndDate;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkResPrice({
    required this.ResPriceId,
    required this.ResPriceGroupId,
    required this.UnitId,
    required this.CurrencyId,
    required this.ResId,
    required this.ResPriceRegNo,
    required this.ResPriceValue,
    required this.PriceStartDate,
    required this.PriceEndDate,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.SyncDateTime,
  });

  @override
  Map<String,dynamic> toMap()=>{
    "ResPriceId":ResPriceId,
    "ResPriceGroupId":ResPriceGroupId,
    "UnitId":UnitId,
    "CurrencyId":CurrencyId,
    "ResId":ResId,
    "ResPriceRegNo":ResPriceRegNo,
    "ResPriceValue":ResPriceValue,
    "PriceStartDate":PriceStartDate?.millisecondsSinceEpoch ?? 0,
    "PriceEndDate":PriceEndDate?.millisecondsSinceEpoch ?? 0,
    "CreatedDate":CreatedDate?.millisecondsSinceEpoch ?? 0,
    "ModifiedDate":ModifiedDate?.millisecondsSinceEpoch ?? 0,
    "SyncDateTime":SyncDateTime?.millisecondsSinceEpoch,
  };

  static TblDkResPrice fromMap(Map<String,dynamic> map)=>
    TblDkResPrice(
        ResPriceId:map["ResPriceId"] ?? 0,
        ResPriceGroupId:map["ResPriceGroupId"] ?? 0,
        UnitId:map["UnitId"] ?? 0,
        CurrencyId:map["CurrencyId"] ?? 0,
        ResId:map["ResId"] ?? 0,
        ResPriceRegNo:map["ResPriceRegNo"] ?? "",
        ResPriceValue:map["ResPriceValue"] ?? "",
        PriceStartDate:DateTime.fromMillisecondsSinceEpoch(map["PriceStartDate"] ?? 0),
        PriceEndDate:DateTime.fromMillisecondsSinceEpoch(map["PriceEndDate"] ?? 0),
        CreatedDate:DateTime.fromMillisecondsSinceEpoch(map["CreatedDate"] ?? 0),
        ModifiedDate:DateTime.fromMillisecondsSinceEpoch(map["ModifiedDate"] ?? 0),
        SyncDateTime:DateTime.fromMillisecondsSinceEpoch(map["SyncDateTime"]),
    );
}