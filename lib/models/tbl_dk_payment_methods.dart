// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:delivery_app/models/model.dart';

class TblDkPaymentMethods extends Model {
  final int PmId;
  final String PmName;
  final String PmDesc;
  final int PmVisibleIndex;
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
  final int? GCRecord;

  TblDkPaymentMethods(
       {required this.ModifiedUId,
        required this.ModifiedDate,
        required this.GCRecord,
        required this.CreatedUId,
        required this.CreatedDate,
        required this.AddInf6,
        required this.AddInf5,
        required this.AddInf4,
        required this.AddInf3,
        required this.AddInf2,
        required this.AddInf1,
        required this.PmDesc,
        required this.PmId,
        required this.PmName,
        required this.PmVisibleIndex});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'PmId': PmId,
      'PmName': PmName,
      'PmDesc': PmDesc,
      'PmVisibleIndex': PmVisibleIndex,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
      'CreatedDate': CreatedDate?.toString(),
      'ModifiedDate': ModifiedDate?.toString(),
      'CreatedUId': CreatedUId,
      'ModifiedUId': ModifiedUId,
      'GCRecord': GCRecord,
    };
    return map;
  }

  static TblDkPaymentMethods fromMap(Map<String, dynamic> map) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return TblDkPaymentMethods(
      PmId: map['PmId'] ?? 0,
      PmName: map['PmName'] ?? "",
      PmDesc: map['PmDesc'] ?? "",
      PmVisibleIndex: map['PmVisibleIndex'] ?? 0,
      AddInf1: map['AddInf1'] ?? "",
      AddInf2: map['AddInf2'] ?? "",
      AddInf3: map['AddInf3'] ?? "",
      AddInf4: map['AddInf4'] ?? "",
      AddInf5: map['AddInf5'] ?? "",
      AddInf6: map['AddInf6'] ?? "",
      CreatedDate: dateFormat.parse((map['CreatedDate'] == null) ? '1900-01-01 00:00:00' : map['CreatedDate']),
      ModifiedDate: dateFormat.parse((map['ModifiedDate'] == null) ? '1900-01-01 00:00:00' : map['ModifiedDate']),
      CreatedUId: map['CreatedUId'] ?? 0,
      ModifiedUId: map['ModifiedUId'] ?? 0,
      GCRecord: map['GCRecord'],
    );
  }

  TblDkPaymentMethods.fromJson(Map<String, dynamic> json)
      : PmId = json['PmId'],
        PmName = json['PmName']?.toString() ?? "",
        PmDesc = json['PmDesc']?.toString() ?? "",
        PmVisibleIndex = json['PmVisibleIndex'],
        AddInf1 = json['AddInf1']?.toString() ?? "",
        AddInf2 = json['AddInf2']?.toString() ?? "",
        AddInf3 = json['AddInf3']?.toString() ?? "",
        AddInf4 = json['AddInf4']?.toString() ?? "",
        AddInf5 = json['AddInf5']?.toString() ?? "",
        AddInf6 = json['AddInf6']?.toString() ?? "",
        CreatedDate = DateTime.parse(json['CreatedDate'] ?? DateTime.now().toString()),
        ModifiedDate = DateTime.parse(json['ModifiedDate'] ?? DateTime.now().toString()),
        CreatedUId = json['CreatedUId'],
        ModifiedUId = json['ModifiedUId'],
        GCRecord = json['GCRecord'];

  Map<String, dynamic> toJson() => {
    'PmId': PmId,
    'PmName': PmName,
    'PmDesc': PmDesc,
    'PmVisibleIndex': PmVisibleIndex,
    'AddInf1': AddInf1,
    'AddInf2': AddInf2,
    'AddInf3': AddInf3,
    'AddInf4': AddInf4,
    'AddInf5': AddInf5,
    'AddInf6': AddInf6,
    'CreatedDate': CreatedDate?.toIso8601String(),
    'ModifiedDate': ModifiedDate?.toIso8601String(),
    'CreatedUId': CreatedUId,
    'ModifiedUId': ModifiedUId,
    'GCRecord': GCRecord,
  };
}
