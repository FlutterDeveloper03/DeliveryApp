

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/model.dart';

class TblDkMobileOrderLine extends Model {
  final int? OInvLineId;
  final int OInvId;
  final int UnitId;
  final int CurrencyId;
  final int ResPriceGroupId;
  final int ResId;
  final String ResName;
  final String ResGuid;
  final String OInvLineDesc;
  final double OInvLineAmount;
  final double OInvLinePrice;
  final double OInvLineTotal;
  final double OInvLineExpenseAmount;
  final double OInvLineTaxAmount;
  final double OInvLineDiscAmount;
  final double OInvLineFTotal;
  final DateTime? OInvLineDate;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;

  TblDkMobileOrderLine({
    this.OInvLineId,
    required this.OInvId,
    required this.UnitId,
    required this.CurrencyId,
    required this.ResPriceGroupId,
    required this.ResId,
    required this.ResGuid,
    required this.ResName,
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
    required this.CreatedDate,
    required this.ModifiedDate,
  });

  @override
  Map<String, dynamic> toMap() => {
        "OInvLineId": OInvLineId,
        "OInvId": OInvId,
        "UnitId": UnitId,
        "CurrencyId": CurrencyId,
        "ResPriceGroupId": ResPriceGroupId,
        "ResId": ResId,
        "ResGuid": ResGuid.toString(),
        "ResName":ResName.toString(),
        "OInvLineDesc": OInvLineDesc,
        "OInvLineAmount": OInvLineAmount,
        "OInvLinePrice": OInvLinePrice,
        "OInvLineTotal": OInvLineTotal,
        "OInvLineExpenseAmount": OInvLineExpenseAmount,
        "OInvLineTaxAmount": OInvLineTaxAmount,
        "OInvLineDiscAmount": OInvLineDiscAmount,
        "OInvLineFTotal": OInvLineFTotal,
        "OInvLineDate": OInvLineDate?.millisecondsSinceEpoch,
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
        "CreatedDate": CreatedDate?.millisecondsSinceEpoch,
        "ModifiedDate": ModifiedDate?.millisecondsSinceEpoch,
      };

  static TblDkMobileOrderLine fromMap(Map<String, dynamic> map) => TblDkMobileOrderLine(
        OInvLineId: map['OInvLineId'] ?? 0,
        OInvId: map['OInvId'] ?? 0,
        UnitId: map['UnitId'] ?? 0,
        CurrencyId: map['CurrencyId'] ?? 0,
        ResPriceGroupId: map["ResPriceGroupId"] ?? 0,
        ResId: map['ResId'] ?? 0,
        ResGuid: map['ResGuid'] ?? '',
        ResName:map['ResName'] ?? '',
        OInvLineDesc: map['OInvLineDesc']?.toString() ?? '',
        OInvLineAmount: map['OInvLineAmount'] ?? 0,
        OInvLinePrice: map['OInvLinePrice'] ?? 0,
        OInvLineTotal: map['OInvLineTotal'] ?? 0,
        OInvLineExpenseAmount: map['OInvLineExpenseAmount'] ?? 0,
        OInvLineTaxAmount: map['OInvLineTaxAmount'] ?? 0,
        OInvLineDiscAmount: map['OInvLineDiscAmount'] ?? 0,
        OInvLineFTotal: map['OInvLineFTotal'] ?? 0,
        OInvLineDate: DateTime.fromMillisecondsSinceEpoch(map['OInvLineDate'] ?? 0),
        AddInf1: map['AddInf1']?.toString() ?? '',
        AddInf2: map['AddInf2']?.toString() ?? '',
        AddInf3: map['AddInf3']?.toString() ?? '',
        AddInf4: map['AddInf4']?.toString() ?? '',
        AddInf5: map['AddInf5']?.toString() ?? '',
        AddInf6: map['AddInf6']?.toString() ?? '',
        CreatedDate: DateTime.fromMillisecondsSinceEpoch(map['CreatedDate'] ?? 0),
        ModifiedDate: DateTime.fromMillisecondsSinceEpoch(map['ModifiedDate'] ?? 0),
      );

  Map<String, dynamic> toJson() => {
        "OInvLineId": OInvLineId,
        "OInvId": OInvId,
        "UnitId": UnitId,
        "CurrencyId": CurrencyId,
        "ResPriceGroupId": ResPriceGroupId,
        "ResId": ResId,
        "ResGuid": ResGuid,
        "ResName":ResName,
        "OInvLineDesc": OInvLineDesc,
        "OInvLineAmount": OInvLineAmount,
        "OInvLinePrice": OInvLinePrice,
        "OInvLineTotal": OInvLineTotal,
        "OInvLineExpenseAmount": OInvLineExpenseAmount,
        "OInvLineTaxAmount": OInvLineTaxAmount,
        "OInvLineDiscAmount": OInvLineDiscAmount,
        "OInvLineFTotal": OInvLineFTotal,
        "OInvLineDate": OInvLineDate?.toIso8601String(),
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
        "CreatedDate": CreatedDate?.toIso8601String(),
        "ModifiedDate": ModifiedDate?.toIso8601String(),
      };

  TblDkMobileOrderLine.fromJson(Map<String, dynamic> json)
      : OInvLineId = json["OInvLineId"] ?? 0,
        OInvId = json["OInvId"] ?? 0,
        UnitId = json["UnitId"] ?? 0,
        CurrencyId = json["CurrencyId"] ?? 0,
        ResPriceGroupId = json["ResPriceGroupId"] ?? 0,
        ResId = json["ResId"] ?? 0,
        ResGuid = json["ResGuid"] ?? '',
        ResName = json["ResName"] ?? '',
        OInvLineDesc = json["OInvLineDesc"] ?? '',
        OInvLineAmount = json["OInvLineAmount"] ?? 0,
        OInvLinePrice = json["OInvLinePrice"] ?? 0,
        OInvLineTotal = json["OInvLineTotal"] ?? 0,
        OInvLineExpenseAmount = json["OInvLineExpenseAmount"] ?? 0,
        OInvLineTaxAmount = json["OInvLineTaxAmount"] ?? 0,
        OInvLineDiscAmount = json["OInvLineDiscAmount"] ?? 0,
        OInvLineFTotal = json["OInvLineFTotal"] ?? 0,
        OInvLineDate = DateTime.parse(json["OInvLineDate"] ?? DateTime.now()),
        AddInf1 = json["AddInf1"] ?? '',
        AddInf2 = json["AddInf2"] ?? '',
        AddInf3 = json["AddInf3"] ?? '',
        AddInf4 = json["AddInf4"] ?? '',
        AddInf5 = json["AddInf5"] ?? '',
        AddInf6 = json["AddInf6"] ?? '',
        CreatedDate = DateTime.parse(json["CreatedDate"] ?? '1900-01-01'),
        ModifiedDate = DateTime.parse(json["ModifiedDate"] ?? '1900-01-01');
}
