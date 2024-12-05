

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/model.dart';

class TblDkMobileOrder extends Model {
  final int? OInvId;
  final String OInvGuid;
  final int PtId;
  final int PmId;
  final int CurrencyId;
  final int RpAccId;
  final int UId;
  final String RpAccGuid;
  final int PaymStatusId;
  final String PaymCode;
  final String PaymDesc;
  final String OInvRegNo;
  final String OInvDesc;
  final DateTime? OInvDate;
  final double OInvTotal;
  final double OInvExpenseAmount;
  final double OInvTaxAmount;
  final double OInvDiscountAmount;
  final double OInvFTotal;
  final String OInvFTotalInWrite;
  final double OInvPaymAmount;
  final int OInvModifyCount;
  final int OInvPrintCount;
  final int OInvCreditDays;
  final String OInvCreditDesc;
  final double OInvLatitude;
  final double OInvLongitude;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkMobileOrder(
      {this.OInvId,
      required this.OInvGuid,
      required this.PtId,
      required this.PmId,
      required this.CurrencyId,
      required this.RpAccId,
      required this.UId,
      required this.RpAccGuid,
      required this.PaymStatusId,
      required this.PaymCode,
      required this.PaymDesc,
      required this.OInvRegNo,
      required this.OInvDesc,
      required this.OInvDate,
      required this.OInvTotal,
      required this.OInvExpenseAmount,
      required this.OInvTaxAmount,
      required this.OInvDiscountAmount,
      required this.OInvFTotal,
      required this.OInvFTotalInWrite,
      required this.OInvPaymAmount,
      required this.OInvModifyCount,
      required this.OInvPrintCount,
      required this.OInvCreditDays,
      required this.OInvCreditDesc,
      required this.OInvLatitude,
      required this.OInvLongitude,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      this.SyncDateTime});

  @override
  Map<String, dynamic> toMap() => {
        "OInvId": OInvId,
        "OInvGuid": OInvGuid,
        "PtId": PtId,
        "PmId": PmId,
        "CurrencyId": CurrencyId,
        "RpAccId": RpAccId,
        "UId": UId,
        "RpAccGuid": RpAccGuid,
        "PaymStatusId": PaymStatusId,
        "PaymCode": PaymCode,
        "PaymDesc": PaymDesc,
        "OInvRegNo": OInvRegNo,
        "OInvDesc": OInvDesc,
        "OInvDate": OInvDate?.millisecondsSinceEpoch,
        "OInvTotal": OInvTotal,
        "OInvExpenseAmount": OInvExpenseAmount,
        "OInvTaxAmount": OInvTaxAmount,
        "OInvDiscountAmount": OInvDiscountAmount,
        "OInvFTotal": OInvFTotal,
        "OInvFTotalInWrite": OInvFTotalInWrite,
        "OInvPaymAmount": OInvPaymAmount,
        "OInvModifyCount": OInvModifyCount,
        "OInvPrintCount": OInvPrintCount,
        "OInvCreditDays": OInvCreditDays,
        "OInvCreditDesc": OInvCreditDesc,
        "OInvLatitude": OInvLatitude,
        "OInvLongitude": OInvLongitude,
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
        "CreatedDate": CreatedDate?.millisecondsSinceEpoch,
        "ModifiedDate": ModifiedDate?.millisecondsSinceEpoch,
        "SyncDateTime": SyncDateTime?.millisecondsSinceEpoch
      };

  static TblDkMobileOrder fromMap(Map<String, dynamic> map) => TblDkMobileOrder(
      OInvId: map["OInvId"] ?? 0,
      OInvGuid: map["OInvGuid"] ?? '',
      PtId: map["PtId"] ?? 0,
      PmId: map["PmId"] ?? 0,
      CurrencyId: map["CurrencyId"] ?? 0,
      RpAccId: map["RpAccId"] ?? 0,
      UId: map["UId"] ?? 0,
      RpAccGuid: map["RpAccGuid"]?.toString() ?? '',
      PaymStatusId: map["PaymStatusId"] ?? 0,
      PaymCode: map["PaymCode"]?.toString() ?? '',
      PaymDesc: map["PaymDesc"]?.toString() ?? '',
      OInvRegNo: map["OInvRegNo"]?.toString() ?? '',
      OInvDesc: map["OInvDesc"]?.toString() ?? '',
      OInvDate: DateTime.fromMillisecondsSinceEpoch(map["OInvDate"] ?? DateTime.now().millisecondsSinceEpoch),
      OInvTotal: map["OInvTotal"] ?? 0,
      OInvExpenseAmount: map["OInvExpenseAmount"] ?? 0,
      OInvTaxAmount: map["OInvTaxAmount"] ?? 0,
      OInvDiscountAmount: map["OInvDiscountAmount"] ?? 0,
      OInvFTotal: map["OInvFTotal"] ?? 0,
      OInvFTotalInWrite: map["OInvFTotalInWrite"]?.toString() ?? '',
      OInvPaymAmount: map["OInvPaymAmount"] ?? 0,
      OInvModifyCount: map["OInvModifyCount"] ?? 0,
      OInvPrintCount: map["OInvPrintCount"] ?? 0,
      OInvCreditDays: map["OInvCreditDays"] ?? 0,
      OInvCreditDesc: map["OInvCreditDesc"] ?? '',
      OInvLatitude: map["OInvLatitude"] ?? 0,
      OInvLongitude: map["OInvLongitude"] ?? 0,
      AddInf1: map["AddInf1"]?.toString() ?? '',
      AddInf2: map["AddInf2"]?.toString() ?? '',
      AddInf3: map["AddInf3"]?.toString() ?? '',
      AddInf4: map["AddInf4"]?.toString() ?? '',
      AddInf5: map["AddInf5"]?.toString() ?? '',
      AddInf6: map["AddInf6"]?.toString() ?? '',
      CreatedDate: DateTime.fromMillisecondsSinceEpoch(map["CreatedDate"] ?? DateTime.parse('1900-01-01').millisecondsSinceEpoch),
      ModifiedDate: DateTime.fromMillisecondsSinceEpoch(map["ModifiedDate"] ?? DateTime.parse('1900-01-01').millisecondsSinceEpoch),
      SyncDateTime: (map["SyncDateTime"] != null) ? DateTime.fromMillisecondsSinceEpoch(map["SyncDateTime"]) : null);
}
