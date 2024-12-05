

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_order_inv_line.dart';
import 'package:delivery_app/models/responseModels/resp_dk_rp_acc.dart';

class Resp_dk_order_inv {
  final int OInvId;
  final String OInvGuid;
  final int OInvTypeId;
  final int InvStatId;
  final int RpAccId;
  final int UId;
  final int CId;
  final int DivId;
  final int PtId;
  final int PmId;
  final int PaymStatusId;
  final String OInvRegNo;
  final String OInvDesc;
  final DateTime? OInvDate;
  final double OInvTotal;
  final double OInvExpenseAmount;
  final double OInvTaxAmount;
  final double OInvDiscountAmount;
  final double OInvFTotal;
  final double OInvPaymAmount;
  final int OInvCreditDays;
  final String OInvCreditDesc;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final int OInvLatitude;
  final int OInvLongitude;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final List<Resp_dk_order_inv_line> OrderLines;
  final int CurrencyId;
  final int WhId;
  final int WpId;
  final int EmpId;
  final String PaymCode;
  final String PaymDesc;
  final String OInvFTotalInWrite;
  final int OInvModifyCount;
  final int OInvPrintCount;
  final int CreatedUId;
  final int ModifiedUId;
  final DateTime? SyncDateTime;
  final int? GCRecord;
  final String InvDelAddress;
  final String InvDelPhone;
  final RespDkRpAcc? RpAcc;

  Resp_dk_order_inv({
    required this.OInvId,
    required this.OInvGuid,
    required this.OInvTypeId,
    required this.InvStatId,
    required this.RpAccId,
    required this.UId,
    required this.CId,
    required this.DivId,
    required this.PtId,
    required this.PmId,
    required this.PaymStatusId,
    required this.OInvRegNo,
    required this.OInvDesc,
    required this.OInvDate,
    required this.OInvTotal,
    required this.OInvExpenseAmount,
    required this.OInvTaxAmount,
    required this.OInvDiscountAmount,
    required this.OInvFTotal,
    required this.OInvPaymAmount,
    required this.OInvCreditDays,
    required this.OInvCreditDesc,
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6,
    required this.OInvLatitude,
    required this.OInvLongitude,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.OrderLines,
    required this.CurrencyId,
    required this.WhId,
    required this.WpId,
    required this.EmpId,
    required this.PaymCode,
    required this.PaymDesc,
    required this.OInvFTotalInWrite,
    required this.OInvModifyCount,
    required this.OInvPrintCount,
    required this.CreatedUId,
    required this.ModifiedUId,
    required this.SyncDateTime,
    required this.GCRecord,
    required this.InvDelAddress,
    required this.InvDelPhone,
    required this.RpAcc,
  });

  Resp_dk_order_inv.fromJson(Map<String, dynamic> json)
      : OInvId = json["OInvId"] ?? 0,
        OInvGuid = json["OInvGuid"] ?? '',
        OInvTypeId=json["OInvTypeId"] ?? 0,
        InvStatId=json["InvStatId"] ?? 0,
        RpAccId=json["RpAccId"] ?? 0,
        UId=json["UId"] ?? 0,
        CId=json["CId"] ?? 0,
        DivId=json["DivId"] ?? 0,
        PtId=json["PtId"] ?? 0,
        PmId=json["PmId"] ?? 0,
        PaymStatusId=json["PaymStatusId"] ?? 0,
        OInvRegNo=json["OInvRegNo"] ?? '',
        OInvDesc=json["OInvDesc"] ?? '',
        OInvDate=DateTime.parse(json["OInvDate"] ?? DateTime.now().toString()),
        OInvTotal=json["OInvTotal"].toDouble() ?? 0,
        OInvExpenseAmount=json["OInvExpenseAmount"].toDouble() ?? 0,
        OInvTaxAmount=json["OInvTaxAmount"].toDouble() ?? 0,
        OInvDiscountAmount=json["OInvDiscountAmount"].toDouble() ?? 0,
        OInvFTotal=json["OInvFTotal"].toDouble() ?? 0,
        OInvPaymAmount=json["OInvPaymAmount"].toDouble() ?? 0,
        OInvCreditDays=json["OInvCreditDays"] ?? 0,
        OInvCreditDesc=json["OInvCreditDesc"] ?? '',
        AddInf1=json["AddInf1"] ?? '',
        AddInf2=json["AddInf2"] ?? '',
        AddInf3=json["AddInf3"] ?? '',
        AddInf4=json["AddInf4"] ?? '',
        AddInf5=json["AddInf5"] ?? '',
        AddInf6=json["AddInf6"] ?? '',
        OInvLatitude=json["OInvLatitude"] ?? 0,
        OInvLongitude=json["OInvLongitude"] ?? 0,
        CreatedDate=DateTime.parse(json["CreatedDate"] ?? DateTime.now().toString()) ,
        ModifiedDate=DateTime.parse(json["ModifiedDate"] ?? DateTime.now().toString()),
        OrderLines=(json["OrderLines"] != null && (json["OrderLines"] as List).isNotEmpty ) ? (json["OrderLines"] as List).map((e) => Resp_dk_order_inv_line.fromJson(e)).toList() : [],
        CurrencyId = json['CurrencyId'] ?? 0,
        WhId = json['WhId'] ?? 0,
        WpId = json['WpId'] ?? 0,
        EmpId = json['EmpId'] ?? 0,
        PaymCode = json['PaymCode'] ?? '',
        PaymDesc = json['PaymDesc'] ?? '',
        OInvFTotalInWrite = json['OInvFTotalInWrite'] ?? '',
        OInvModifyCount = json['OInvModifyCount'] ?? 0,
        OInvPrintCount = json['OInvPrintCount'] ?? 0,
        CreatedUId = json['CreatedUId'] ?? 0,
        ModifiedUId = json['ModifiedUId'] ?? 0,
        SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null,
        GCRecord = json['GCRecord'] ?? 0,
        InvDelAddress = json['InvDelAddress'] ?? '',
        InvDelPhone = json['InvDelPhone'] ?? '',
        RpAcc = (json['RpAcc'] == null) ? null : RespDkRpAcc.fromJson(json['RpAcc']);


  Map<String, dynamic> toJson() => {
    'OInvId':OInvId,
    'OInvGuid':OInvGuid,
    'OInvTypeId':OInvTypeId,
    'InvStatId':InvStatId,
    'RpAccId':RpAccId,
    'UId':UId,
    'CId':CId,
    'DivId':DivId,
    'PtId':PtId,
    'PmId':PmId,
    'PaymStatusId':PaymStatusId,
    'OInvRegNo':OInvRegNo,
    'OInvDesc':OInvDesc,
    'OInvDate':OInvDate?.toIso8601String() ?? DateTime.now().toIso8601String(),
    'OInvTotal':OInvTotal,
    'OInvExpenseAmount':OInvExpenseAmount,
    'OInvTaxAmount':OInvTaxAmount,
    'OInvDiscountAmount':OInvDiscountAmount,
    'OInvFTotal':OInvFTotal,
    'OInvPaymAmount':OInvPaymAmount,
    'OInvCreditDays':OInvCreditDays,
    'OInvCreditDesc':OInvCreditDesc,
    'AddInf1':AddInf1,
    'AddInf2':AddInf2,
    'AddInf3':AddInf3,
    'AddInf4':AddInf4,
    'AddInf5':AddInf5,
    'AddInf6':AddInf6,
    'OInvLatitude':OInvLatitude,
    'OInvLongitude':OInvLongitude,
    'CreatedDate':CreatedDate?.toIso8601String(),
    'ModifiedDate':ModifiedDate?.toIso8601String(),
    'OrderLines': OrderLines.map((e) => e.toJson()).toList(),
    'CurrencyId': CurrencyId,
    'WhId': WhId,
    'WpId': WpId,
    'EmpId': EmpId,
    'PaymCode': PaymCode,
    'PaymDesc': PaymDesc,
    'OInvFTotalInWrite': OInvFTotalInWrite,
    'OInvModifyCount': OInvModifyCount,
    'OInvPrintCount': OInvPrintCount,
    'CreatedUId': CreatedUId,
    'ModifiedUId': ModifiedUId,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
    'GCRecord': GCRecord,
    'InvDelAddress': InvDelAddress,
    'InvDelPhone': InvDelPhone,
    'RpAcc': RpAcc?.toJson()
  };
}
