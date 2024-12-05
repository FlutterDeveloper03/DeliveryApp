
// ignore_for_file: non_constant_identifier_names, camel_case_types

class Resp_dk_order_inv_status{
  final int InvStatId;
  final String InvStatGuid;
  final String InvStatTmName;
  final String InvStatTmDesc;
  final String InvStatRuName;
  final String InvStatRuDesc;
  final String InvStatEnName;
  final String InvStatEnDesc;

  Resp_dk_order_inv_status({
    required this.InvStatId,
    required this.InvStatGuid,
    required this.InvStatTmName,
    required this.InvStatTmDesc,
    required this.InvStatRuName,
    required this.InvStatRuDesc,
    required this.InvStatEnName,
    required this.InvStatEnDesc
  });

  Resp_dk_order_inv_status.fromJson(Map<String,dynamic> json)
      : InvStatId=json["InvStatId"] ?? 0,
        InvStatGuid=json["InvStatGuid"] ?? "",
        InvStatTmName=json["InvStatName_tkTM"] ?? "",
        InvStatTmDesc=json["InvStatDesc_tkTM"] ?? "",
        InvStatRuName=json["InvStatName_ruRU"] ?? "",
        InvStatRuDesc=json["InvStatDesc_ruRU"] ?? "",
        InvStatEnName=json["InvStatName_enUS"] ?? "",
        InvStatEnDesc=json["InvStatDesc_enUS"] ?? "";

  Map<String,dynamic> toJson()=>{
    'InvStatId':InvStatId,
    'InvStatGuid':InvStatGuid,
    'InvStatName_tkTM':InvStatTmName,
    'InvStatDesc_tkTM':InvStatTmDesc,
    'InvStatName_ruRU':InvStatRuName,
    'InvStatDesc_ruRU':InvStatRuDesc,
    'InvStatName_enUS':InvStatEnName,
    'InvStatDesc_enUS':InvStatEnDesc,
  };
}