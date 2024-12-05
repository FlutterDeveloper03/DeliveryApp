// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkResCategory extends Model {
  final int? ResCatId;
  final int ResOwnerCatId;
  final int ResCatVisibleIndex;
  final int IsMain;
  final String ResCatName;
  final String ResCatDesc;
  final String ResCatIconName;
  final String ResCatIconFilePath;
  final String ResCatIconData;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkResCategory({
    required this.ResCatId,
    required this.ResOwnerCatId,
    required this.ResCatVisibleIndex,
    required this.IsMain,
    required this.ResCatName,
    required this.ResCatDesc,
    required this.ResCatIconName,
    required this.ResCatIconFilePath,
    required this.ResCatIconData,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.SyncDateTime,
  });

  @override
  Map<String, dynamic> toMap() => {
        'ResCatId': ResCatId,
        'ResOwnerCatId': ResOwnerCatId,
        'ResCatVisibleIndex': ResCatVisibleIndex,
        'IsMain': IsMain,
        'ResCatName': ResCatName,
        'ResCatDesc': ResCatDesc,
        'ResCatIconName': ResCatIconName,
        'ResCatIconFilePath': ResCatIconFilePath,
        'ResCatIconData': ResCatIconData,
        'CreatedDate': CreatedDate?.toString(),
        'ModifiedDate': ModifiedDate?.toString(),
        'SyncDateTime': SyncDateTime?.toString(),
      };

  static TblDkResCategory fromMap(Map<String, dynamic> map) => TblDkResCategory(
      ResCatId: map['ResCatId'] ?? 0,
      ResOwnerCatId: map['ResOwnerCatId'] ?? 0,
      ResCatVisibleIndex: map['ResCatVisibleIndex'] ?? 0,
      IsMain: map['IsMain'] ?? 0,
      ResCatName: map['ResCatName']?.toString() ?? "",
      ResCatDesc: map['ResCatDesc']?.toString() ?? "",
      ResCatIconName: map['ResCatIconName']?.toString() ?? "",
      ResCatIconFilePath: map['ResCatIconFilePath']?.toString() ?? "",
      ResCatIconData: map['ResCatIconData']?.toString() ?? "",
      CreatedDate:DateTime.parse(map['CreatedDate'] ?? '1900-01-01'),
      ModifiedDate:DateTime.parse(map['ModifiedDate'] ?? '1900-01-01'),
      SyncDateTime:DateTime.parse(map['SyncDateTime'] ?? '1900-01-01')
      );
}
