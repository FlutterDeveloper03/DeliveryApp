// ignore_for_file: file_names

class GetResponseDataAsJson {
  final dynamic data;
  final String message;
  final int status;
  final int total;

  GetResponseDataAsJson({this.data, required this.message, required this.status, required this.total});

  GetResponseDataAsJson.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        message = json['message'],
        status = json['status'] ?? 0,
        total = json['total'] ?? 0;
}
