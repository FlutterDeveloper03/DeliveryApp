
// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_bank.dart';

class RespDkAccountingInfo {
  final int AccInfId;
  final int DivId;
  final int BankId;
  final int CurrencyId;
  final int AccTypeId;
  final int CId;
  final int RpAccId;
  final String AccInfName;
  final String AccInfDesc;
  final String AccInfNo;
  final bool AccInfActive;
  final DateTime? AccInfCreatedDate;
  final DateTime? AccInfClosedDate;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int CreatedUId;
  final int ModifiedUId;
  final DateTime? SyncDateTime;
  final RespDkBank? Bank;

  RespDkAccountingInfo({
      required this.AccInfId,
      required this.DivId,
      required this.BankId,
      required this.CurrencyId,
      required this.AccTypeId,
      required this.CId,
      required this.RpAccId,
      required this.AccInfName,
      required this.AccInfDesc,
      required this.AccInfNo,
      required this.AccInfActive,
      required this.AccInfCreatedDate,
      required this.AccInfClosedDate,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.CreatedUId,
      required this.ModifiedUId,
      required this.SyncDateTime,
      required this.Bank});

  RespDkAccountingInfo.fromJson(Map<String, dynamic> json)
      : AccInfId = json['AccInfId'] ?? 0,
        DivId = json['DivId'] ?? 0,
        BankId = json['BankId'] ?? 0,
        CurrencyId = json['CurrencyId'] ?? 0,
        AccTypeId = json['AccTypeId'] ?? 0,
        CId = json['CId'] ?? 0,
        RpAccId = json['RpAccId'] ?? 0,
        AccInfName = json['AccInfName'] ?? '',
        AccInfDesc = json['AccInfDesc'] ?? '',
        AccInfNo = json['AccInfNo'] ?? '',
        AccInfActive = json['AccInfActive'] ?? false,
        AccInfCreatedDate = (json['AccInfCreatedDate'] == null) ? null : DateTime.parse(json['AccInfCreatedDate']),
        AccInfClosedDate = (json['AccInfClosedDate'] == null) ? null : DateTime.parse(json['AccInfClosedDate']),
        AddInf1 = json['AddInf1']?.toString() ?? "",
        AddInf2 = json['AddInf2']?.toString() ?? "",
        AddInf3 = json['AddInf3']?.toString() ?? "",
        AddInf4 = json['AddInf4']?.toString() ?? "",
        AddInf5 = json['AddInf5']?.toString() ?? "",
        AddInf6 = json['AddInf6']?.toString() ?? "",
        CreatedDate = (json['CreatedDate'] == null) ? null : DateTime.parse(json['CreatedDate']),
        ModifiedDate = (json['ModifiedDate'] == null) ? null : DateTime.parse(json['ModifiedDate']),
        CreatedUId = json['CreatedUId'],
        ModifiedUId = json['ModifiedUId'],
        SyncDateTime = (json['SyncDateTime'] == null) ? null : DateTime.parse(json['SyncDateTime']),
        Bank = (json['Bank'] == null) ? null : RespDkBank.fromJson(json['Bank']);

  Map<String, dynamic> toJson() => {
        'AccInfId': AccInfId,
        'DivId': DivId,
        'BankId': BankId,
        'CurrencyId': CurrencyId,
        'AccTypeId': AccTypeId,
        'CId': CId,
        'RpAccId': RpAccId,
        'AccInfName': AccInfName,
        'AccInfDesc': AccInfDesc,
        'AccInfNo': AccInfNo,
        'AccInfActive': AccInfActive,
        'AccInfCreatedDate': (AccInfCreatedDate==null) ? "" : AccInfCreatedDate!.toIso8601String(),
        'AccInfClosedDate': (AccInfClosedDate!=null) ? AccInfClosedDate!.toIso8601String() : "",
        'AddInf1': AddInf1,
        'AddInf2': AddInf2,
        'AddInf3': AddInf3,
        'AddInf4': AddInf4,
        'AddInf5': AddInf5,
        'AddInf6': AddInf6,
        'CreatedDate': (CreatedDate!=null) ? CreatedDate!.toIso8601String() : "",
        'ModifiedDate': (ModifiedDate!=null) ? ModifiedDate!.toIso8601String() : "",
        'CreatedUId': CreatedUId,
        'ModifiedUId': ModifiedUId,
        'SyncDateTime': (SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
        'Bank': (Bank == null) ? null : Bank!.toJson()
      };
}
