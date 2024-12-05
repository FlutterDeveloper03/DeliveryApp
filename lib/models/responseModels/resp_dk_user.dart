// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_user_role.dart';
import 'package:delivery_app/models/responseModels/resp_dk_user_type.dart';

class Resp_dk_user {
  final int UId;
  final String UGuid;
  final int CId;
  final int DivId;
  final int EmpId;
  final int UTypeId;
  final int RpAccId;
  final String URegNo;
  final String UName;
  final String UFullName;
  final int PinCode;
  final String UEmail;
  final String UShortName;
  final bool Disabled;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final String AddInf7;
  final String AddInf8;
  final DateTime? ULastActivityDate;
  final String ULastActivityDevice;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;
  final int CreatedUId;
  final int ModifiedUId;
  final int? GCRecord;
  final RespDkUserType? UserType;
  final List<RespDkUserRole>? Roles;

  Resp_dk_user({
      required this.UId,
      required this.UGuid,
      required this.CId,
      required this.DivId,
      required this.EmpId,
      required this.UTypeId,
      required this.RpAccId,
      required this.URegNo,
      required this.UName,
      required this.UFullName,
      required this.PinCode,
      required this.UEmail,
      required this.UShortName,
      required this.Disabled,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.AddInf7,
      required this.AddInf8,
      required this.ULastActivityDate,
      required this.ULastActivityDevice,
      this.CreatedDate,
      this.ModifiedDate,
      this.SyncDateTime,
      required this.CreatedUId,
      required this.ModifiedUId,
      required this.GCRecord,
      required this.UserType,
      required this.Roles
});

  Resp_dk_user.fromJson(Map<String, dynamic> json)
      : UId = json['UId'] ?? 0,
        UGuid = json['UGuid'] ?? "",
        CId = json['CId'] ?? 0,
        DivId = json["DivId"] ?? 0,
        EmpId = json["EmpId"] ?? 0,
        UTypeId = json['UTypeId'] ?? 0,
        RpAccId = json['RpAccId'] ?? 0,
        URegNo = json['URegNo'] ?? "",
        UName = json['UName'] ?? "",
        UFullName = json['UFullName'] ?? "",
        PinCode = json['PinCode'] ?? 0,
        UEmail = json['UEmail'] ?? "",
        UShortName = json['UShortName'] ?? "",
        Disabled = json['Disabled'] ?? false,
        AddInf1 = json["AddInf1"] ?? "",
        AddInf2 = json["AddInf2"] ?? "",
        AddInf3 = json["AddInf3"] ?? "",
        AddInf4 = json["AddInf4"] ?? "",
        AddInf5 = json["AddInf5"] ?? "",
        AddInf6 = json["AddInf6"] ?? "",
        AddInf7 = json["AddInf7"] ?? "",
        AddInf8 = json["AddInf8"] ?? "",
        ULastActivityDate = (json["ULastActivityDate"] != null) ? DateTime.parse(json["ULastActivityDate"]) : null,
        ULastActivityDevice = json['ULastActivityDevice'] ?? "",
        CreatedDate = (json["CreatedDate"] != null) ? DateTime.parse(json["CreatedDate"]) : null,
        ModifiedDate = (json["ModifiedDate"] != null) ? DateTime.parse(json["ModifiedDate"]) : null,
        SyncDateTime = (json["SyncDateTime"] != null) ? DateTime.parse(json["SyncDateTime"]) : null,
        CreatedUId = json["CreatedUId"] ?? 0,
        ModifiedUId = json["ModifiedUId"] ?? 0,
        GCRecord = json["GCRecord"] ?? 0,
        UserType = (json['UserType'] != null) ? RespDkUserType.fromJson(json['UserType']) : null,
        Roles =(json["Roles"]!=null && (json["Roles"] as List).isNotEmpty ) ? (json["Roles"] as List).map((e) => RespDkUserRole.fromJson(e)).toList() : [];

  Map<String, dynamic> toJson() => {
        "UId": UId,
        "UGuid": UGuid,
        "CId": CId,
        "DivId": DivId,
        "EmpId": EmpId,
        "UTypeId": UTypeId,
        "RpAccId": RpAccId,
        "URegNo": URegNo,
        "UName": UName,
        "UFullName": UFullName,
        "PinCode": PinCode,
        "UEmail": UEmail,
        "UShortName": UShortName,
        "Disabled": Disabled,
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
        "AddInf7": AddInf7,
        "AddInf8": AddInf8,
        "ULastActivityDate": (ULastActivityDate != null) ? ULastActivityDate?.toIso8601String() : "",
        "ULastActivityDevice": ULastActivityDevice,
        "CreatedDate": (CreatedDate != null) ? CreatedDate?.toIso8601String() : "",
        "ModifiedDate": (ModifiedDate != null) ? ModifiedDate?.toIso8601String() : "",
        "SyncDateTime": (SyncDateTime != null) ? SyncDateTime?.toIso8601String() : "",
        "CreatedUId": CreatedUId,
        "ModifiedUId": ModifiedUId,
        "GCRecord": GCRecord,
        "UserType": UserType?.toJson(),
        "Roles": (Roles!=null) ? Roles!.map((e) => e.toJson()).toList() : null,
      };
}
