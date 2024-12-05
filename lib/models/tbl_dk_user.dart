// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkUser extends Model {
  final int UId;
  final String UGuid;
  final int RpAccId;
  final int ResPriceGroupId;
  final String URegNo;
  final String UFullName;
  final String UName;
  final String UEmail;
  final int EmpId;
  final int UTypeId;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime CreatedDate;
  final DateTime ModifiedDate;
  final DateTime SyncDateTime;

  TblDkUser(
     {required this.UId,
      required this.UGuid,
      required this.RpAccId,
      required this.ResPriceGroupId,
      required this.URegNo,
      required this.UFullName,
      required this.UName,
      required this.UEmail,
      required this.EmpId,
      required this.UTypeId,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.SyncDateTime});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'UId': UId,
      'UGuid': UGuid,
      'RpAccId': RpAccId,
      'ResPriceGroupId': ResPriceGroupId,
      'URegNo': URegNo,
      'UFullName': UFullName,
      'UName': UName,
      'UEmail': UEmail,
      'EmpId': EmpId,
      'UTypeId': UTypeId,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
      'CreatedDate': CreatedDate.toString(),
      'ModifiedDate': ModifiedDate.toString(),
      'SyncDateTime': SyncDateTime.toString()
    };
    return map;
  }

  static TblDkUser fromMap(Map<String, dynamic> map) {
    return TblDkUser(
        UId: map['UId'] ?? 0,
        UGuid: map['UGuid'] ?? "",
        RpAccId: map['RpAccId'] ?? 0,
        ResPriceGroupId: map['ResPriceGroupId'] ?? 0,
        URegNo: map['URegNo']?.toString() ?? "",
        UFullName: map['UFullName']?.toString() ?? "",
        UName: map['UName']?.toString() ?? "",
        UEmail: map['UEmail']?.toString() ?? "",
        EmpId: map['EmpId'] ?? 0,
        UTypeId: map['UTypeId'] ?? 0,
        AddInf1: map['AddInf1']?.toString() ?? "",
        AddInf2: map['AddInf2']?.toString() ?? "",
        AddInf3: map['AddInf3']?.toString() ?? "",
        AddInf4: map['AddInf4']?.toString() ?? "",
        AddInf5: map['AddInf5']?.toString() ?? "",
        AddInf6: map['AddInf6']?.toString() ?? "",
        CreatedDate: DateTime.parse(map['CreatedDate'] ?? '1900-01-01'),
        ModifiedDate: DateTime.parse(map['ModifiedDate'] ?? '1900-01-01'),
        SyncDateTime: DateTime.parse(map['SyncDateTime'] ?? '1900-01-01'));
  }

  TblDkUser.fromJson(Map<String, dynamic> json)
      : UId = json['UId'] ?? 0,
        UGuid = json['UGuid'] ?? "",
        RpAccId = json['RpAccId'] ?? 0,
        ResPriceGroupId = json['ResPriceGroupId'] ?? 0,
        URegNo = json['URegNo'] ?? "",
        UFullName = json['UFullName'] ?? "",
        UName = json['UName'] ?? "",
        UEmail = json['UEmail'] ?? "",
        EmpId = json['EmpId'] ?? 0,
        UTypeId = json['UTypeId'] ?? 0,
        AddInf1 = json['AddInf1'] ?? "",
        AddInf2 = json['AddInf2'] ?? "",
        AddInf3 = json['AddInf3'] ?? "",
        AddInf4 = json['AddInf4'] ?? "",
        AddInf5 = json['AddInf5'] ?? "",
        AddInf6 = json['AddInf6'] ?? "",
        CreatedDate = DateTime.parse(json['CreatedDate'] ?? '1900-01-01'),
        ModifiedDate = DateTime.parse(json['ModifiedDate'] ?? '1900-01-01'),
        SyncDateTime = DateTime.parse(json['SyncDateTime'] ?? '1900-01-01');

  Map<String, dynamic> toJson() => {
        'UId': UId,
        'UGuid': UGuid,
        'RpAccId': RpAccId,
        'ResPriceGroupId': ResPriceGroupId,
        'URegNo': URegNo,
        'UFullName': UFullName,
        'UName': UName,
        'UEmail': UEmail,
        'EmpId': EmpId,
        'UTypeId': UTypeId,
        'AddInf1': AddInf1,
        'AddInf2': AddInf2,
        'AddInf3': AddInf3,
        'AddInf4': AddInf4,
        'AddInf5': AddInf5,
        'AddInf6': AddInf6,
        'CreatedDate': CreatedDate.toIso8601String(),
        'ModifiedDate': ModifiedDate.toIso8601String(),
        'SyncDateTime': SyncDateTime.toIso8601String(),
      };
}
