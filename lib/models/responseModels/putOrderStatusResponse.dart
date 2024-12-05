// ignore_for_file: non_constant_identifier_names, file_names


class PutOrderStatusResponse {
  final VDkOrderInv? successData;
  final int failTotal;
  final int fails;
  final List<String> messages;
  final int statusCode;
  final int successTotal;
  final int total;
  final List<String> errorMessages;

  PutOrderStatusResponse({
    required this.successData,
    required this.failTotal,
    required this.fails,
    required this.messages,
    required this.statusCode,
    required this.successTotal,
    required this.errorMessages,
    required this.total});

  PutOrderStatusResponse.fromJson(Map<String, dynamic> json)
      : successData = (json['successData'] != null) ? VDkOrderInv.fromJson(json['successData']) : null,
        failTotal = json['failTotal'] ?? 0,
        fails = json['fails'] ?? 0,
        messages = (json['messages'] != null && (json['messages'] as List).isNotEmpty) ? (json['messages'] as List).map((e) => e.toString()).toList() : [],
        statusCode = json['statusCode'] ?? 0,
        successTotal = json['successTotal'],
        errorMessages = (json['errorMessages'] != null && (json['errorMessages'] as List).isNotEmpty) ? (json['errorMessages'] as List).map((e) => e.toString()).toList() : [],
        total = json['total'] ?? 0;

  Map<String, dynamic> toJson() => {
    'data': successData?.toJson() ?? '',
    'failTotal': failTotal,
    'fails':fails,
    'messages': messages,
    'statusCode': statusCode,
    'successTotal': successTotal,
    'errorMessages': errorMessages,
    'total': total,
  };
}

class VDkOrderInv {
  final int OInvId;
  final String InvStatusName;

  VDkOrderInv({
    required this.OInvId,
    required this.InvStatusName,
  });

  VDkOrderInv.fromJson(Map<String, dynamic> json)
      : OInvId = json['OInvId'] ?? 0,
        InvStatusName = json['invStatusName'];

  Map<String, dynamic> toJson() => {
    'OInvId': OInvId,
    'invStatusName': InvStatusName,
  };
}
