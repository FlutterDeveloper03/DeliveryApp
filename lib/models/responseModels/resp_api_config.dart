// ignore_for_file: non_constant_identifier_names
class RespApiConfig {
  final bool NEGATIVE_WH_QTY_ORDER;
  final bool NEGATIVE_WH_QTY_SALE;
  final bool SHOW_NEGATIVE_WH_QTY_RESOURCE;
  final String message;
  final int status;

  RespApiConfig(this.NEGATIVE_WH_QTY_ORDER, this.NEGATIVE_WH_QTY_SALE, this.SHOW_NEGATIVE_WH_QTY_RESOURCE, this.status, this.message);

  RespApiConfig.fromJson(Map<String, dynamic> json)
      : NEGATIVE_WH_QTY_ORDER = json['NEGATIVE_WH_QTY_ORDER'],
        NEGATIVE_WH_QTY_SALE = json['NEGATIVE_WH_QTY_SALE'],
        SHOW_NEGATIVE_WH_QTY_RESOURCE = json['SHOW_NEGATIVE_WH_QTY_RESOURCE'],
        message = json['message'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'NEGATIVE_WH_QTY_ORDER': NEGATIVE_WH_QTY_ORDER,
        'NEGATIVE_WH_QTY_SALE':NEGATIVE_WH_QTY_SALE,
        'SHOW_NEGATIVE_WH_QTY_RESOURCE':SHOW_NEGATIVE_WH_QTY_RESOURCE,
        'message': message,
        'status': status,
      };
}
