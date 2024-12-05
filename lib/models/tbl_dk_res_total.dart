// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkResTotal extends Model{
  final int ResTotId;
  final int ResId;
  final int WhId;
  final double ResTotBalance;
  final double ResTotInAmount;
  final double ResPendingTotalAmount;
  final double ResTotOutAmount;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkResTotal({
    required this.ResTotId,
    required this.ResId,
    required this.WhId,
    required this.ResTotBalance,
    required this.ResTotInAmount,
    required this.ResPendingTotalAmount,
    required this.ResTotOutAmount,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.SyncDateTime,
  });

  @override
  Map<String,dynamic> toMap()=>{
    "ResTotId":ResTotId,
    "ResId":ResId,
    "WhId":WhId,
    "ResTotBalance":ResTotBalance,
    "ResTotInAmount":ResTotInAmount,
    "ResPendingTotalAmount":ResPendingTotalAmount,
    "ResTotOutAmount":ResTotOutAmount,
    "CreatedDate":CreatedDate?.toString(),
    "ModifiedDate":ModifiedDate?.toString(),
    "SyncDateTime":SyncDateTime?.toString(),
  };

  static TblDkResTotal fromMap(Map<String,dynamic> map)=>
    TblDkResTotal(
      ResTotId:map["ResTotId"] ?? 0,
      ResId:map["ResId"] ?? 0,
      WhId:map["WhId"] ?? 0,
      ResTotBalance:map["ResTotBalance"] ?? 0,
      ResTotInAmount:map["ResTotInAmount"] ?? 0,
      ResPendingTotalAmount:map["ResPendingTotalAmount"] ?? 0,
      ResTotOutAmount:map["ResTotOutAmount"] ?? 0,
      CreatedDate:DateTime.parse(map["CreatedDate"] ?? '1900-01-01'),
      ModifiedDate:DateTime.parse(map["ModifiedDate"] ?? '1900-01-01'),
      SyncDateTime:DateTime.parse(map["SyncDateTime"] ?? '1900-01-01'),
    );
}