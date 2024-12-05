// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_user_type.dart';

class RespDkUserRole {
  final int URoleId;
  final String URoleGuid;
  final int UId;
  final int UTypeId;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final String AddInf7;
  final String AddInf8;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int CreatedUId;
  final int ModifiedUId;
  final int? GCRecord;
  final DateTime? SyncDateTime;
  final RespDkUserType? UserType;

  RespDkUserRole({
    required this.URoleId,
    required this.URoleGuid,
    required this.UId,
    required this.UTypeId,
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6,
    required this.AddInf7,
    required this.AddInf8,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.CreatedUId,
    required this.ModifiedUId,
    required this.GCRecord,
    required this.SyncDateTime,
    required this.UserType});

  RespDkUserRole.fromJson(Map<String, dynamic> json)
    : URoleId = json['URoleId'] ?? 0,
      URoleGuid = json['URoleGuid'] ?? '',
      UId = json['UId'] ?? 0,
      UTypeId = json['UTypeId'] ?? 0,
      AddInf1 = json["AddInf1"] ?? "",
      AddInf2 = json["AddInf2"] ?? "",
      AddInf3 = json["AddInf3"] ?? "",
      AddInf4 = json["AddInf4"] ?? "",
      AddInf5 = json["AddInf5"] ?? "",
      AddInf6 = json["AddInf6"] ?? "",
      AddInf7 = json["AddInf7"] ?? "",
      AddInf8 = json["AddInf8"] ?? "",
      CreatedDate = (json["CreatedDate"] != null) ? DateTime.parse(json["CreatedDate"]) : null,
      ModifiedDate = (json["ModifiedDate"] != null) ? DateTime.parse(json["ModifiedDate"]) : null,
      CreatedUId = json["CreatedUId"] ?? 0,
      ModifiedUId = json["ModifiedUId"] ?? 0,
      GCRecord = json["GCRecord"] ?? 0,
      SyncDateTime = (json["SyncDateTime"] != null) ? DateTime.parse(json["SyncDateTime"]) : null,
      UserType = (json['UserType'] != null) ? RespDkUserType.fromJson(json['UserType']) : null;

  Map<String, dynamic> toJson() => {
    "URoleId": URoleId,
    "URoleGuid": URoleGuid,
    "UId": UId,
    "UTypeId": UTypeId,
    "AddInf1": AddInf1,
    "AddInf2": AddInf2,
    "AddInf3": AddInf3,
    "AddInf4": AddInf4,
    "AddInf5": AddInf5,
    "AddInf6": AddInf6,
    "AddInf7": AddInf7,
    "AddInf8": AddInf8,
    "CreatedDate": (CreatedDate != null) ? CreatedDate?.toIso8601String() : "",
    "ModifiedDate": (ModifiedDate != null) ? ModifiedDate?.toIso8601String() : "",
    "CreatedUId": CreatedUId,
    "ModifiedUId": ModifiedUId,
    "GCRecord": GCRecord,
    "SyncDateTime": (SyncDateTime != null) ? SyncDateTime?.toIso8601String() : "",
    "UserType": UserType?.toJson()
  };
}