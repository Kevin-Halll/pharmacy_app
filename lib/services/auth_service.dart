import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import 'local_storage.dart';

class AuthService {
  final String apiBase = "http://192.168.56.1:8080/api/v1";

  Future<Map<String, dynamic>> register(User user) async {
    Map data = {
      'fullName': user.fullName,
      // 'image': user.image,
      'phoneNumber': user.phoneNumber,
      'email': user.email,
      'password': user.password,
      'role': user.role,
    };

    final http.Response response = await http.post(
      Uri.parse("$apiBase/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 400) {
      String user = jsonEncode(jsonDecode(response.body)['data']);
      LocalStorage.saveString("user", user);

      return jsonDecode(response.body);
    } else {
      _logResponseError(response);
      throw Exception('Failed to signup user');
    }
  }

  Future<String?> login(User user) async {
    Map data = {
      'email': user.email,
      'password': user.password,
    };

    final http.Response response = await http.post(
      Uri.parse("$apiBase/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> resp = jsonDecode(response.body);

      // return `false` if that status of the response is error
      if (resp['success'] == false) {
        _logResponseError(response);
        return resp['message'];
      }

      String token = resp['data']['token'] ?? "";

      if (token == "") {
        _logResponseError(response);
        return "We encountered an error on our end. Please try again later!";
      }

      LocalStorage.saveString('token', token);
      LocalStorage.saveString(
        "user",
        jsonEncode(resp['data']['user']).toString(),
      );

      return null;
    } else {
      _logResponseError(response);
      return jsonDecode(response.body)?['message'];
    }
  }

  Future<void> logout() async {
    LocalStorage.deleteString('token');
    LocalStorage.deleteString('user');
  }

  Future<bool> getLoginStatus(String tokenSharedPrefsKey) async {
    final token = await LocalStorage.readString(tokenSharedPrefsKey);

    if (token == "") return false;
    //TODO Update auth check url
    final http.Response response = await http.get(
      Uri.parse("$apiBase/recipes"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8",
        'Authorization': "Bearer $token",
      },
    );

    // handle server error
    if (response.statusCode == 500) {
      final resp = jsonDecode(response.body);

      final unauthorized = resp['message']!
          .toString()
          .contains('You must be logged in to access this resource');
      final respHasError = resp['message']!.toString() == "error";

      if (unauthorized || respHasError) return false;
    }

    // returns true if the user has access to resources from the endpoint.
    if (response.statusCode == 200) return true;

    // returns false if all other checks failed
    return false;
  }

  Future<String> getLocalUser(String userKey) async {
    String user = await LocalStorage.readString(userKey);

    return user;
  }

  // Private Utilities
  void _logResponseError(http.Response response) {
    debugPrint("Error - ${jsonDecode(response.body)?['message']}");
    debugPrint(response.body);
  }
}
