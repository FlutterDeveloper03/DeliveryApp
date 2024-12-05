// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkBrand extends Model {
  final int? BrandId;
  final String BrandName;
  final String BrandDesc;
  final int BrandVisibleIndex;
  final int IsMain;
  final String BrandLink1;
  final String BrandLink2;
  final String BrandLink3;
  final String BrandLink4;
  final String BrandLink5;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkBrand(
     {required this.BrandId,
      required this.BrandName,
      required this.BrandDesc,
      required this.BrandVisibleIndex,
      required this.IsMain,
      required this.BrandLink1,
      required this.BrandLink2,
      required this.BrandLink3,
      required this.BrandLink4,
      required this.BrandLink5,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.SyncDateTime});

  @override
  Map<String, dynamic> toMap() {
    return {
      'BrandId': BrandId,
      'BrandName': BrandName,
      'BrandDesc': BrandDesc,
      'BrandVisibleIndex': BrandVisibleIndex,
      'IsMain': IsMain,
      'BrandLink1': BrandLink1,
      'BrandLink2': BrandLink2,
      'BrandLink3': BrandLink3,
      'BrandLink4': BrandLink4,
      'BrandLink5': BrandLink5,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
      'CreatedDate': CreatedDate.toString(),
      'ModifiedDate': ModifiedDate.toString(),
      'SyncDateTime': SyncDateTime.toString()
    };
  }

  static TblDkBrand fromMap(Map<String, dynamic> map) {
    return TblDkBrand(
        BrandId: map['BrandId'] ?? 0,
        BrandName: map['BrandName'] ?? "",
        BrandDesc: map['BrandDesc'] ?? "",
        BrandVisibleIndex: map['BrandVisibleIndex'] ?? 0,
        IsMain: map['IsMain'] ?? 0,
        BrandLink1: map['BrandLink1'] ?? "",
        BrandLink2: map['BrandLink2'] ?? "",
        BrandLink3: map['BrandLink3'] ?? "",
        BrandLink4: map['BrandLink4'] ?? "",
        BrandLink5: map['BrandLink5'] ?? "",
        AddInf1: map['AddInf1'] ?? "",
        AddInf2: map['AddInf2'] ?? "",
        AddInf3: map['AddInf3'] ?? "",
        AddInf4: map['AddInf4'] ?? "",
        AddInf5: map['AddInf5'] ?? "",
        AddInf6: map['AddInf6'] ?? "",
        CreatedDate: DateTime.parse(map['CreatedDate'] ?? '1900-01-01'),
        ModifiedDate: DateTime.parse(map['ModifiedDate'] ?? '1900-01-01'),
        SyncDateTime: DateTime.parse(map['SyncDateTime'] ?? '1900-01-01'));
  }
}
