// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'model.dart';

class Tbl_dk_config extends Model {
  final int ConfId;
  final String ServerName;
  final String DbName;
  final String DbUName;
  final String DbUPass;
  final String ApiPrefix;
  final String AppLanguage;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;

  Tbl_dk_config(
     {required this.ConfId,
      required this.ServerName,
      required this.DbName,
      required this.DbUName,
      required this.DbUPass,
      required this.ApiPrefix,
      required this.AppLanguage,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'ConfId': ConfId,
      'ServerName': ServerName,
      'DbName': DbName,
      'DbUName': DbUName,
      'DbUPass': DbUPass,
      'ApiPrefix': ApiPrefix,
      'AppLanguage': AppLanguage,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
    };
    return map;
  }

  static Tbl_dk_config fromMap(Map<String, dynamic> map) {
    return Tbl_dk_config(
      ConfId: map['ConfId'] ?? 0,
      ServerName: map['ServerName'] ?? "",
      DbName: map['DbName'] ?? "",
      DbUName: map['DbUName'] ?? "",
      DbUPass: map['DbUPass'] ?? "",
      ApiPrefix: map['ApiPrefix'] ?? "",
      AppLanguage: map['AppLanguage'] ?? "",
      AddInf1: map['AddInf1'] ?? "",
      AddInf2: map['AddInf2'] ?? "",
      AddInf3: map['AddInf3'] ?? "",
      AddInf4: map['AddInf4'] ?? "",
      AddInf5: map['AddInf5'] ?? "",
      AddInf6: map['AddInf6'] ?? "",
    );
  }
}
