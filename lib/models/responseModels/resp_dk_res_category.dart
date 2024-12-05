// ignore_for_file: non_constant_identifier_names, camel_case_types

class Resp_dk_res_category {
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int? GCRecord;
  final bool IsMain;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final String ResCatDesc;
  final String ResCatIconData;
  final String ResCatIconFilePath;
  final String ResCatIconName;
  final int ResCatId;
  final String ResCatName;
  final int ResCatVisibleIndex;
  final int ResOwnerCatId;
  final DateTime? SyncDateTime;

  Resp_dk_res_category({
    required this.CreatedDate,
    required this.CreatedUId,
    required this.GCRecord,
    required this.IsMain,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.ResCatDesc,
    required this.ResCatIconData,
    required this.ResCatIconFilePath,
    required this.ResCatIconName,
    required this.ResCatId,
    required this.ResCatName,
    required this.ResCatVisibleIndex,
    required this.ResOwnerCatId,
    required this.SyncDateTime,
  });

  Resp_dk_res_category.fromJson(Map<String, dynamic> json)
      : CreatedDate=(json['CreatedDate']!=null) ? DateTime.parse(json['CreatedDate']) : null,
        CreatedUId=json['CreatedUId'] ?? 0,
        GCRecord=json['GCRecord'],
        IsMain=json['IsMain'] ?? false,
        ModifiedDate=(json['ModifiedDate']!=null) ? DateTime.parse(json['ModifiedDate']) : null,
        ModifiedUId=json['ModifiedUId'] ?? 0,
        ResCatDesc=json['ResCatDesc'] ?? "",
        ResCatIconData=json['ResCatIconData'] ?? "",
        ResCatIconFilePath=json['ResCatIconFilePath'] ?? "",
        ResCatIconName=json['ResCatIconName'] ?? "",
        ResCatId=json['ResCatId'] ?? 0,
        ResCatName=json['ResCatName'] ?? "",
        ResCatVisibleIndex=json['ResCatVisibleIndex'] ?? 0,
        ResOwnerCatId=json['ResOwnerCatId'] ?? 0,
        SyncDateTime=(json['SyncDateTime']!=null) ? DateTime.parse(json['SyncDateTime']) : null;

  Map<String, dynamic> toJson() => {
    'CreatedDate':(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    'CreatedUId':CreatedUId,
    'GCRecord':GCRecord,
    'IsMain':IsMain,
    'ModifiedDate':(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    'ModifiedUId':ModifiedUId,
    'ResCatDesc':ResCatDesc,
    'ResCatIconData':ResCatIconData,
    'ResCatIconFilePath':ResCatIconFilePath,
    'ResCatIconName':ResCatIconName,
    'ResCatId':ResCatId,
    'ResCatName':ResCatName,
    'ResCatVisibleIndex':ResCatVisibleIndex,
    'ResOwnerCatId':ResOwnerCatId,
    'SyncDateTime':(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
  };
}
