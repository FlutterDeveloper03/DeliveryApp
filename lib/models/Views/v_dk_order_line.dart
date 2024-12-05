// ignore_for_file: non_constant_identifier_names
import 'package:delivery_app/models/tbl_dk_resource.dart';

class VDkOrderLine{
  final int? OInvLineId;
  final int OInvId;
  final int UnitId;
  final int CurrencyId;
  final int ResId;
  final String OInvLineDesc;
  double OInvLineAmount;
  final double OInvLinePrice;
  final double OInvLineTotal;
  final double OInvLineExpenseAmount;
  final double OInvLineTaxAmount;
  final double OInvLineDiscAmount;
  double OInvLineFTotal;
  final DateTime? OInvLineDate;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final TblDkResource Resource;

  VDkOrderLine({
    required this.OInvLineId,
    required this.OInvId,
    required this.UnitId,
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
    required this.Resource
  });



}