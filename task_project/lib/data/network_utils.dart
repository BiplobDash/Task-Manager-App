import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
        // print('Unauthorized');
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  // Post Method
  Future<dynamic> postMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorize, String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json', 'token': token??''},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }
}
