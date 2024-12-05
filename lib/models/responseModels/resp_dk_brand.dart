

// ignore_for_file: non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_image.dart';

class RespDkBrand{
  final String BrandDesc;
  final int BrandId;
  final String BrandLink1;
  final String BrandLink2;
  final String BrandLink3;
  final String BrandLink4;
  final String BrandLink5;
  final String BrandName;
  final int BrandVisibleIndex;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int? GCRecord;
  final List<Resp_dk_image> Images;
  final bool IsMain;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final DateTime? SyncDateTime;

  RespDkBrand({
    required this.BrandDesc,
    required this.BrandId,
    required this.BrandLink1,
    required this.BrandLink2,
    required this.BrandLink3,
    required this.BrandLink4,
    required this.BrandLink5,
    required this.BrandName,
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6,
    required this.BrandVisibleIndex,
    required this.CreatedDate,
    required this.CreatedUId,
    required this.GCRecord,
    required this.Images,
    required this.IsMain,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.SyncDateTime,
  });

  RespDkBrand.fromJson(Map<String,dynamic> json)
    : BrandDesc=json["BrandDesc"] ?? "",
      BrandId=json["BrandId"] ?? 0,
      BrandLink1=json["BrandLink1"] ?? "",
      BrandLink2=json["BrandLink2"] ?? "",
      BrandLink3=json["BrandLink3"] ?? "",
      BrandLink4=json["BrandLink4"] ?? "",
      BrandLink5=json["BrandLink5"] ?? "",
      BrandName=json["BrandName"] ?? "",
      AddInf1 = json['AddInf1'] ?? "",
      AddInf2 = json['AddInf2'] ?? "",
      AddInf3 = json['AddInf3'] ?? "",
      AddInf4 = json['AddInf4'] ?? "",
      AddInf5 = json['AddInf5'] ?? "",
      AddInf6 = json['AddInf6'] ?? "",
      BrandVisibleIndex=json["BrandVisibleIndex"] ?? 0,
      CreatedDate=(json["CreatedDate"]!=null) ? DateTime.parse(json["CreatedDate"]) : null,
      CreatedUId=json["CreatedUId"] ?? 0,
      GCRecord=json["GCRecord"],
      Images=(json["Images"]==null) ? [] : (json["Images"] as List).map((e) => Resp_dk_image.fromJson(e)).toList(),
      IsMain=json["IsMain"] ?? 0,
      ModifiedDate=(json["ModifiedDate"]!=null) ? DateTime.parse(json["ModifiedDate"]) : null,
      ModifiedUId=json["ModifiedUId"] ?? 0,
      SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null;


  Map<String,dynamic> toJson()=>{
    "BrandDesc":BrandDesc,
    "BrandId":BrandId,
    "BrandLink1":BrandLink1,
    "BrandLink2":BrandLink2,
    "BrandLink3":BrandLink3,
    "BrandLink4":BrandLink4,
    "BrandLink5":BrandLink5,
    "BrandName":BrandName,
    'AddInf1':AddInf1,
    'AddInf2':AddInf2,
    'AddInf3':AddInf3,
    'AddInf4':AddInf4,
    'AddInf5':AddInf5,
    'AddInf6':AddInf6,
    "BrandVisibleIndex":BrandVisibleIndex,
    "CreatedDate":CreatedDate?.toIso8601String(),
    "CreatedUId":CreatedUId,
    "GCRecord":GCRecord,
    "Images":Images.map((e) => e.toJson()).toList(),
    "IsMain":IsMain,
    "ModifiedDate":ModifiedDate?.toIso8601String(),
    "ModifiedUId":ModifiedUId,
    "SyncDateTime":SyncDateTime?.toIso8601String(),
  };

}