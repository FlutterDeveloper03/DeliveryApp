

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_resource.dart';

class Resp_dk_order_inv_line{
  final int OInvLineId;
  final String OInvLineGuid;
  final int OInvId;
  final int WhId;
  final int ResUnitId;
  final int CurrencyId;
  final int ResId;
  final String OInvLineRegNo;
  final String OInvLineDesc;
  final int OInvLineAmount;
  final double OInvLinePrice;
  final double OInvLineTotal;
  final double OInvLineExpenseAmount;
  final double OInvLineTaxAmount;
  final double OInvLineDiscAmount;
  final double OInvLineFTotal;
  final double ExcRateValue;
  final DateTime OInvLineDate;
  final String ResAttributesString;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final String AddInf7;
  final String AddInf8;
  final String AddInf9;
  final String AddInf10;
  final Resp_dk_resource? Resource;

  Resp_dk_order_inv_line({
    required this.OInvLineId,
    required this.OInvId,
    required this.CurrencyId,
    required this.ResId,
    required this.OInvLineDesc,
    required this.OInvLineAmount,
    required this.OInvLinePrice,
    required this.OInvLineTotal,
    required this.OInvLineExpenseAmount,
    required this.OInvLineTaxAmount,
    required this.OInvLineDiscAmount,
    required this.OInvLineFTotal,
    required this.OInvLineDate,
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6,
    required this.AddInf7,
    required this.AddInf8,
    required this.AddInf9,
    required this.AddInf10,
    required this.OInvLineGuid,
    required this.WhId,
    required this.ResUnitId,
    required this.OInvLineRegNo,
    required this.ExcRateValue,
    required this.ResAttributesString,
    required this.Resource
  });

  Resp_dk_order_inv_line.fromJson(Map<String,dynamic> json)
      : OInvLineId=json["OInvLineId"] ?? 0,
        OInvId=json["OInvId"] ?? 0,
        CurrencyId=json["CurrencyId"] ?? 0,
        ResId=json["ResId"] ?? 0,
        OInvLineDesc=json["OInvLineDesc"] ?? "",
        OInvLineAmount=json["OInvLineAmount"].toInt() ?? 0,
        OInvLinePrice=json["OInvLinePrice"].toDouble() ?? 0,
        OInvLineTotal=json["OInvLineTotal"].toDouble() ?? 0,
        OInvLineExpenseAmount=json["OInvLineExpenseAmount"].toDouble() ?? 0,
        OInvLineTaxAmount=json["OInvLineTaxAmount"].toDouble() ?? 0,
        OInvLineDiscAmount=json["OInvLineDiscAmount"].toDouble() ?? 0,
        OInvLineFTotal=json["OInvLineFTotal"].toDouble() ?? 0,
        OInvLineDate=DateTime.parse(json["OInvLineDate"] ?? DateTime.now().toString()),
        AddInf1=json["AddInf1"] ?? "",
        AddInf2=json["AddInf2"] ?? "",
        AddInf3=json["AddInf3"] ?? "",
        AddInf4=json["AddInf4"] ?? "",
        AddInf5=json["AddInf5"] ?? "",
        AddInf6=json["AddInf6"] ?? "",
        AddInf7=json["AddInf7"] ?? "",
        AddInf8=json["AddInf8"] ?? "",
        AddInf9=json["AddInf9"] ?? "",
        AddInf10=json["AddInf10"] ?? "",
        OInvLineGuid = json['OInvLineGuid'] ?? "",
        WhId = json['WhId'] ?? 0,
        ResUnitId=json["ResUnitId"] ?? 0,
        OInvLineRegNo = json['OInvLineRegNo'] ?? "",
        ExcRateValue = json['ExcRateValue'].toDouble() ?? 0,
        ResAttributesString = json['ResAttributesString'] ?? "",
        Resource = (json['Resource'] == null) ? null : Resp_dk_resource.fromJson(json['Resource']);

  Map<String,dynamic> toJson()=>{
    'OInvLineId':OInvLineId,
    'OInvId':OInvId,
    'CurrencyId':CurrencyId,
    'ResId':ResId,
    'OInvLineDesc':OInvLineDesc,
    'OInvLineAmount':OInvLineAmount,
    'OInvLinePrice':OInvLinePrice,
    'OInvLineTotal':OInvLineTotal,
    'OInvLineExpenseAmount':OInvLineExpenseAmount,
    'OInvLineTaxAmount':OInvLineTaxAmount,
    'OInvLineDiscAmount':OInvLineDiscAmount,
    'OInvLineFTotal':OInvLineFTotal,
    'OInvLineDate':OInvLineDate.toIso8601String(),
    'AddInf1':AddInf1,
    'AddInf2':AddInf2,
    'AddInf3':AddInf3,
    'AddInf4':AddInf4,
    'AddInf5':AddInf5,
    'AddInf6':AddInf6,
    'AddInf7':AddInf7,
    'AddInf8':AddInf8,
    'AddInf9':AddInf9,
    'AddInf10':AddInf10,
    'OInvLineGuid': OInvLineGuid,
    'WhId': WhId,
    'ResUnitId':ResUnitId,
    'OInvLineRegNo': OInvLineRegNo,
    'ExcRateValue': ExcRateValue,
    'ResAttributesString': ResAttributesString,
    'Resource': Resource?.toJson()
  };
}