// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:delivery_app/models/model.dart';

class TblDkPaymentTypes extends Model {
  final int PtId;
  final String PtName;
  final String PtDesc;
  final int PtVisibleIndex;
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

  TblDkPaymentTypes(
      { required this.CreatedDate,
        required this.CreatedUId,
        required this.GCRecord,
        required this.ModifiedDate,
        required this.ModifiedUId,
        required this.PtDesc,
        required this.PtId,
        required this.PtName,
        required this.AddInf1,
        required this.AddInf2,
        required this.AddInf3,
        required this.AddInf4,
        required this.AddInf5,
        required this.AddInf6,
        required this.PtVisibleIndex});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'PtId': PtId,
      'PtName': PtName,
      'PtDesc': PtDesc,
      'PtVisibleIndex': PtVisibleIndex,
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

  static TblDkPaymentTypes fromMap(Map<String, dynamic> map) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return TblDkPaymentTypes(
      PtId: map['PtId'] ?? 0,
      PtName: map['PtName'] ?? "",
      PtDesc: map['PtDesc'] ?? "",
      PtVisibleIndex: map['PtVisibleIndex'] ?? 0,
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

  TblDkPaymentTypes.fromJson(Map<String, dynamic> json)
      : PtId = json['PtId'],
        PtName = json['PtName']?.toString() ?? "",
        PtDesc = json['PtDesc']?.toString() ?? "",
        PtVisibleIndex = json['PtVisibleIndex'],
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
    'PtId': PtId,
    'PtName': PtName,
    'PtDesc': PtDesc,
    'PtVisibleIndex': PtVisibleIndex,
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
