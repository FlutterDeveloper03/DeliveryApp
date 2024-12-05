

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_accounting_info.dart';

class Resp_dk_company_info {
  final int AccInfId;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final String CAddress;
  final String CAddressLegal;
  final String CDesc;
  final String CEmail;
  final String CFullName;
  final String Wish;
  final int CId;
  final String CGuid;
  final double CLatitude;
  final double CLongitude;
  final String CName;
  final String CPostalCode;
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int? GCRecord;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final String Phone1;
  final String Phone2;
  final String Phone3;
  final String Phone4;
  final DateTime? SyncDateTime;
  final String WebAddress;
  final List<RespDkAccountingInfo?> Accounting_info;

  Resp_dk_company_info(
      this.AccInfId,
      this.AddInf1,
      this.AddInf2,
      this.AddInf3,
      this.AddInf4,
      this.AddInf5,
      this.AddInf6,
      this.CAddress,
      this.CAddressLegal,
      this.CDesc,
      this.CEmail,
      this.CFullName,
      this.Wish,
      this.CId,
      this.CGuid,
      this.CLatitude,
      this.CLongitude,
      this.CName,
      this.CPostalCode,
      this.CreatedDate,
      this.CreatedUId,
      this.GCRecord,
      this.ModifiedDate,
      this.ModifiedUId,
      this.Phone1,
      this.Phone2,
      this.Phone3,
      this.Phone4,
      this.SyncDateTime,
      this.WebAddress,
      this.Accounting_info);

  Resp_dk_company_info.fromJson(Map<String, dynamic> json)
      : AccInfId = json['AccInfId'] ?? 0,
        AddInf1 = json['AddInf1']?.toString() ?? "",
        AddInf2 = json['AddInf2']?.toString() ?? "",
        AddInf3 = json['AddInf3']?.toString() ?? "",
        AddInf4 = json['AddInf4']?.toString() ?? "",
        AddInf5 = json['AddInf5']?.toString() ?? "",
        AddInf6 = json['AddInf6']?.toString() ?? "",
        CAddress = json['CAddress']?.toString() ?? "",
        CAddressLegal = json['CAddressLegal'] ?? "",
        CDesc = json['CDesc']?.toString() ?? "",
        CEmail = json['CEmail']?.toString() ?? "",
        CFullName = json['CFullName']?.toString() ?? "",
        Wish = json['Wish']?.toString() ?? "",
        CId = json['CId'] ?? 0,
        CGuid = json['CGuid'] ?? "",
        CLatitude = json['CLatitude'] ?? 0.0,
        CLongitude = json['CLongitude'] ?? 0.0,
        CName = json['CName']?.toString() ?? "",
        CPostalCode = json['CPostalCode'] ?? "",
        CreatedDate = (json['CreatedDate']==null) ? null : DateTime.parse(json['CreatedDate']),
        CreatedUId = json['CreatedUId'] ?? 0,
        GCRecord = json['GCRecord'],
        ModifiedDate = (json['ModifiedDate']==null) ? null : DateTime.parse(json['ModifiedDate']),
        ModifiedUId = json['ModifiedUId'] ?? 0,
        Phone1 = json['Phone1'] ?? "",
        Phone2 = json['Phone2'] ?? "",
        Phone3 = json['Phone3'] ?? "",
        Phone4 = json['Phone4'] ?? "",
        SyncDateTime = (json['SyncDateTime']==null) ? null : DateTime.parse(json['SyncDateTime']),
        WebAddress = json['WebAddress'] ?? "",
        Accounting_info = (json['Accounting_info']==null || (json['Accounting_info'] as List).isEmpty) ? [] : (json['Accounting_info'] as List).map((e) => RespDkAccountingInfo.fromJson(e)).toList();


  Map<String,dynamic> toJson()=>{
    'AccInfId':AccInfId,
    'AddInf1':AddInf1,
    'AddInf2':AddInf2,
    'AddInf3':AddInf3,
    'AddInf4':AddInf4,
    'AddInf5':AddInf5,
    'AddInf6':AddInf6,
    'CAddress':CAddress,
    'CAddressLegal':CAddressLegal,
    'CDesc':CDesc,
    'CEmail':CEmail,
    'CFullName':CFullName,
    'Wish':Wish,
    'CId':CId,
    'CGuid':CGuid,
    'CLatitude':CLatitude,
    'CLongitude':CLongitude,
    'CName':CName,
    'CPostalCode':CPostalCode,
    'CreatedDate':CreatedDate?.toIso8601String(),
    'CreatedUId':CreatedUId,
    'GCRecord':GCRecord,
    'ModifiedDate':ModifiedDate?.toIso8601String(),
    'ModifiedUId':ModifiedUId,
    'Phone1':Phone1,
    'Phone2':Phone2,
    'Phone3':Phone3,
    'Phone4':Phone4,
    'SyncDateTime':SyncDateTime?.toIso8601String(),
    'WebAddress':WebAddress,
    'Accounting_info': Accounting_info.map((e) => e?.toJson()).toList()
  };

}
