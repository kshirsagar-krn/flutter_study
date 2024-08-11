// lib/data/repositories/api_repository.dart
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';
import 'error_handler.dart';

class ApiClient extends GetConnect {
  final String _setBaseUrl = ApiConstants().getBaseUrl;
  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
      'accept': 'application/json',
    };
  }

  Future<Response> getData(String endpoint) async {
    final headers = await _getHeaders();
    final response = await get(_setBaseUrl + endpoint, headers: headers);
    log("${_setBaseUrl + endpoint}\n[DATA : ${response.statusCode}]\n${response.body}",
        name: "response");
    return _handleResponse(response);
  }

  Future<Response> postData(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    final response =
        await post(_setBaseUrl + endpoint, json.encode(body), headers: headers);
    return _handleResponse(response);
  }

  Future<Response> putData(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    final response =
        await put(_setBaseUrl + endpoint, json.encode(body), headers: headers);
    return _handleResponse(response);
  }

  Future<Response> deleteData(String endpoint) async {
    final headers = await _getHeaders();
    final response = await delete(_setBaseUrl + endpoint, headers: headers);
    return _handleResponse(response);
  }

  Response _handleResponse(Response response) {
    if (response.isOk) {
      return response;
    } else {
      throw Exception(
          ErrorHandler.handleError(response.statusCode!, response.statusText));
    }
  }
}
