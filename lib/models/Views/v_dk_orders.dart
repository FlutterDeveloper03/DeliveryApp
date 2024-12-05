

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/tbl_dk_mobile_order_line.dart';
import 'package:delivery_app/models/tbl_dk_rp_acc.dart';

class VDkOrder {
  final int? OInvId;
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
  final List<TblDkMobileOrderLine> OrderLines;
  final TblDkRpAcc? RpAcc;

  VDkOrder({
    required this.OInvId,
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
    this.CreatedDate,
    this.ModifiedDate,
    this.SyncDateTime,
    required this.OrderLines,
    required this.RpAcc,
  });
}
