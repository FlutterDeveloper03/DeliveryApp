// ignore_for_file: non_constant_identifier_names, file_names

import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_line.dart';

class PostOrderResponse {
  final Resp_dk_order_inv data;
  final int? fail_total;
  final List<Respfails> fails;
  final String message;
  final int status;
  final int? success_total;
  final List<Resp_dk_order_inv_line> successes;
  final int total;

  PostOrderResponse({
    required this.data,
    required this.fail_total,
    required this.fails,
    required this.message,
    required this.status,
    required this.success_total,
    required this.successes,
    required this.total});

  PostOrderResponse.fromJson(Map<String, dynamic> json)
      : data = Resp_dk_order_inv.fromJson(json['data']),
        fail_total = json['fail_total'],
        fails = (json['fails'] != null && (json['fails'] as List).isNotEmpty) ? (json['fails'] as List).map((e) => Respfails.fromJson(e)).toList() : [],
        message = json['message'],
        status = json['status'],
        success_total = json['success_total'],
        successes = (json['successes'] != null && (json['successes'] as List).isNotEmpty) ? (json['successes'] as List).map((e) => Resp_dk_order_inv_line.fromJson(e)).toList() : [],
        total = json['total'];

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
        'fail_total': fail_total,
        'fails':fails.map((e) => e.toJson()).toList(),
        'message': message,
        'status': status,
        'success_total': success_total,
        'successes': successes.map((e) => e.toJson()).toList(),
        'total': total,
      };
}

class Respfails {
  final Resp_dk_order_inv_line data;
  final int error_type_id;
  final String error_type_message;

  Respfails({
    required this.data,
    required this.error_type_id,
    required this.error_type_message,
  });

  Respfails.fromJson(Map<String, dynamic> json)
      : data = Resp_dk_order_inv_line.fromJson(json['data']),
        error_type_id = json['error_type_id'],
        error_type_message = json['error_type_message'];

  Map<String, dynamic> toJson() => {
        'data': data,
        'error_type_id': error_type_id,
        'error_type_message': error_type_message,
      };
}
