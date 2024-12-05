// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkResPriceGroup extends Model {
  final int ResPriceGroupId;
  final String ResPriceGroupName;
  final String ResPriceGroupDesc;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkResPriceGroup({
    required this.ResPriceGroupId,
    required this.ResPriceGroupName,
    required this.ResPriceGroupDesc,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.SyncDateTime,
  });

  @override
  Map<String, dynamic> toMap() => {
        "ResPriceGroupId": ResPriceGroupId,
        "ResPriceGroupName": ResPriceGroupName,
        "ResPriceGroupDesc": ResPriceGroupDesc,
        "CreatedDate": (CreatedDate != null) ? CreatedDate.toString() : null,
        "ModifiedDate": (ModifiedDate != null) ? ModifiedDate.toString() : null,
        "SyncDateTime": (SyncDateTime != null) ? SyncDateTime.toString() : null,
      };

  static TblDkResPriceGroup fromMap(Map<String, dynamic> map) {
    return TblDkResPriceGroup(
      ResPriceGroupId: map["ResPriceGroupId"] ?? 0,
      ResPriceGroupName: map["ResPriceGroupName"]?.toString() ?? "",
      ResPriceGroupDesc: map["ResPriceGroupDesc"]?.toString() ?? "",
      CreatedDate: DateTime.parse(map["CreatedDate"] ?? '1900-01-01'),
      ModifiedDate: DateTime.parse(map["ModifiedDate"] ?? '1900-01-01'),
      SyncDateTime: DateTime.parse(map["SyncDateTime"] ?? '1900-01-01'),
    );
  }
}
