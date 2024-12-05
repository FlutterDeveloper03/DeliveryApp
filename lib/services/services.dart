// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/postOrderResponse.dart';
import 'package:delivery_app/models/responseModels/putOrderStatusResponse.dart';
import 'package:delivery_app/models/responseModels/resp_api_config.dart';
import 'package:delivery_app/models/responseModels/resp_dk_image.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';
import 'package:delivery_app/models/responseModels/resp_dk_resource.dart';
import 'package:delivery_app/models/responseModels/resp_dk_user.dart';
import 'package:delivery_app/models/responseModels/resp_post_order.dart';
import 'package:delivery_app/models/tbl_dk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static const String MainAddress = '192.168.0.130:7000';
  String _myRoute = '';
  Future<String> get myRoute async {
    if (_myRoute.isEmpty) {
      try {
        final sharedPref = await SharedPreferences.getInstance();
        _myRoute = sharedPref.getString(SharedPrefKeys.ApiPrefix) ?? "";
        return _myRoute;
      } catch (e) {
        return '';
      }
    } else {
      return _myRoute;
    }
  }

  static const requestType = 1; // 1=http, 2=https;
  final publicAddress = MainAddress;
  final reqType = requestType;
  static Map<String, String> headers = {};

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      debugPrint('Print SET Cookie: $rawCookie');
      headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

//region Auth service

  String _token = '';
  DateTime? tokenExpDate;
  String? requestError;

  Future<String> getToken(String username,String password, ProviderModel providerModel) async {
    try {
      http.Client httpClient = http.Client();
      headers['Content-Type'] = 'application/json';
      var body = jsonEncode({"UName": username, "UPass": password});
      final response = await httpClient.post(
          (requestType == 1)
              ? Uri.http(MainAddress, '/api/auth/login/user')
              : Uri.https(MainAddress, '/api/auth/login/user'),
          headers: headers,body: body);
      updateCookie(response);
      if (response.statusCode == 200 || response.statusCode==201) {
        debugPrint(response.statusCode.toString());
        dynamic decoded = jsonDecode(response.body);
        _token = decoded['token'].toString();
        providerModel.setUser = Resp_dk_user.fromJson(decoded['user']);
        tokenExpDate = DateFormat('dd.MM.yyyy hh:mm:ss').parse(decoded['exp']);
        return decoded['token'].toString();
      } else {
        requestError = "Status code = ${response.statusCode}";
      }
    } catch (e) {
      requestError = e.toString();
      throw Exception(e.toString());
    }
    return '';
  }

  Future<void> deleteToken() async {
    _token = '';
    tokenExpDate = null;
  }

  Future<bool> hasToken() async {
    if (tokenExpDate != null && _token.isNotEmpty && tokenExpDate!.isAfter(DateTime.now().add(const Duration(minutes: 1)))) {
      return true;
    }
    return false;
  }

//endregion AuthService

//region Resources

  Future<List<Resp_dk_resource>> getResources() async {
    try {
      Uri uri = (requestType == 1) ? Uri.http(MainAddress, '${await myRoute}/v-resources/') : Uri.https(MainAddress, '${await myRoute}/v-resources/');
      http.Client httpClient = http.Client();
      final response = await httpClient.get(uri, headers: headers);
      //updateCookie(response);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        if (decoded['data'].length == 0) {
          return [];
        }
        List list = decoded['data'];
        List<Resp_dk_resource> resource = list.map((data) => Resp_dk_resource.fromJson(data)).toList();
        return resource;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Resp_dk_resource?> getResource(int resId) async {
    try {
      http.Client httpClient = http.Client();
      Uri uri =
          (requestType == 1) ? Uri.http(MainAddress, '${await myRoute}/v-resources/$resId/') : Uri.https(MainAddress, '${await myRoute}/v-resources/$resId/');
      httpClient.get(uri, headers: headers).then((value) {
        //updateCookie(value);
        if (value.statusCode == 200) {
          dynamic decoded = jsonDecode(value.body);
          Resp_dk_resource resource = Resp_dk_resource.fromJson(decoded['data']);
          return resource;
        } else {
          return null;
        }
      });
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Resp_dk_resource>> getResourcesByCategory(int resCatId, int divId) async {
    try {
      debugPrint('Print Headers: ${headers.toString()}');
      debugPrint(headers['cookie'].toString());
      http.Client httpClient = http.Client();
      Map<String, String> parameters = {'avoidQtyCheckup': '1'};
      if (divId > 0) parameters['DivId'] = divId.toString();

      Uri uri = (requestType == 1)
          ? (resCatId == 0)
              ? Uri.http(MainAddress, '${await myRoute}/v-resources/', parameters)
              : Uri.http(MainAddress, '${await myRoute}/tbl-dk-categories/$resCatId/v-resources/', parameters)
          : (resCatId == 0)
              ? Uri.https(MainAddress, '${await myRoute}/v-resources/', parameters)
              : Uri.https(MainAddress, '${await myRoute}/tbl-dk-categories/$resCatId/v-resources/', parameters);
      final response = (resCatId == 0) ? await httpClient.get(uri, headers: headers) : await httpClient.get(uri, headers: headers);
      debugPrint('Print Headers: ${headers.toString()}');
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        List list = decoded['data'];
        List<Resp_dk_resource> resourceList = list.map((data) => Resp_dk_resource.fromJson(data)).toList();
        return resourceList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//endregion

//region Order
  Future<PostOrderResponse?> postOrderInv(Resp_post_order postOrder, String token) async {
    try {
      var postJson = jsonEncode(postOrder.toJson());
      http.Client httpClient = http.Client();
      Uri uri = (requestType == 1)
          ? Uri.http(MainAddress, '${await myRoute}/v1/checkout-sale-order-inv/')
          : Uri.https(MainAddress, '${await myRoute}/v1/checkout-sale-order-inv/');
      headers['x-access-token'] = token;
      headers['Content-Type'] = 'application/json';
      final response = await httpClient.post(uri, headers: headers, body: postJson);
      //updateCookie(response);
      if ((response.statusCode >= 200 && response.statusCode < 300) || (response.statusCode >= 400 && response.statusCode < 500)) {
        dynamic decoded = jsonDecode(response.body);
        var postOrderResponse = PostOrderResponse.fromJson(decoded);
        return postOrderResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Resp_dk_order_inv>> getOrders(String token, String invTypeGuid, String invStatGuid, String uGuid) async {
    try {
      headers['accesstoken'] = 'Bearer $token';
      http.Client httpClient = http.Client();
      Map<String, String> parameters = {'invTypeGuid': invTypeGuid, 'invStatGuid': invStatGuid, 'uGuid': uGuid};
      Uri uri = (requestType == 1)
          ? Uri.http(MainAddress, 'api/order/all', parameters)
              : Uri.https(MainAddress, 'api/order/all', parameters);
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        if (decoded['data'].length == 0) {
          return [];
        }
        List<Resp_dk_order_inv> orders = (decoded['data'] as List).map((e) => Resp_dk_order_inv.fromJson(e)).toList();
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Resp_dk_order_inv_status>> getOrderStatuses(String token) async{
    try {
      headers['accesstoken'] = 'Bearer $token';
      headers['Content-Type'] = 'application/json';
      http.Client httpClient = http.Client();
      Uri uri = (requestType == 1)
          ? Uri.http(MainAddress, '/api/inv-status')
          : Uri.https(MainAddress, '/api/inv-status');
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        if (decoded['data'].length == 0) {
          return [];
        }
        List<Resp_dk_order_inv_status> orderStatuses = (decoded['data'] as List).map((e) => Resp_dk_order_inv_status.fromJson(e)).toList();
        return orderStatuses;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PutOrderStatusResponse?> updateOrderStatus(String token,int oInvId, String invStatGuid) async {
    try {
      headers['accesstoken'] = 'Bearer $token';
      http.Client httpClient = http.Client();
      Map<String, String> parameters = {'id': oInvId.toString(), 'invStatGuid': invStatGuid};
      headers['Content-Type'] = 'application/json';
      Uri uri = (requestType == 1) ? Uri.http(MainAddress, '/api/order/status/$oInvId', parameters)
          : Uri.https(MainAddress, '/api/order/status/$oInvId', parameters);
      final response = await httpClient.put(uri, headers: headers);
      //updateCookie(response);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        var getResponseDataAsJson = PutOrderStatusResponse.fromJson(decoded);
        return getResponseDataAsJson;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//endregion Order

//region User
  Future<TblDkUser?> getDeviceUser(String token) async {
    try {
      headers['x-access-token'] = token;
      headers['Content-Type'] = 'application/json';
      http.Client httpClient = http.Client();
      Uri uri = (requestType == 1) ? Uri.http(MainAddress, '${await myRoute}/device-user/') : Uri.https(MainAddress, '${await myRoute}/device-user/');
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        TblDkUser deviceUser = TblDkUser.fromJson(decoded['data']);
        return deviceUser;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//endregion User

//region Config

  Future<RespApiConfig?> getConfig() async {
    try {
      http.Client httpClient = http.Client();
      Uri uri = (requestType == 1) ? Uri.http(MainAddress, '${await myRoute}/api-config/') : Uri.https(MainAddress, '${await myRoute}/api-config/');
      final response = await httpClient.get(uri, headers: headers);
      //updateCookie(response);
      if (response.statusCode == 200) {
        dynamic decoded = jsonDecode(response.body);
        if (decoded.length == 0) {
          return null;
        }
        RespApiConfig config = RespApiConfig.fromJson(decoded);
        return config;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

//endregion Config

//region Images

  Future<Resp_dk_image?> getImage(int imgId) async {
    try {
      http.Client httpClient = http.Client();
      Uri uri =
      (requestType == 1) ? Uri.http(MainAddress, '/api/image/$imgId/') : Uri.https(MainAddress, '/api/image/$imgId/');
      httpClient.get(uri, headers: headers).then((value) {
        //updateCookie(value);
        if (value.statusCode == 200) {
          dynamic decoded = jsonDecode(value.body);
          Resp_dk_image image = Resp_dk_image.fromJson(decoded['data']);
          return image;
        } else {
          return null;
        }
      });
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//endregion Images

}
