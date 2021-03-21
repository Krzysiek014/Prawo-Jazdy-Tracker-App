import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();

  factory Session() {
    return _instance;
  }

  Map<String, String> headers = {};

  dynamic get(String url) async {
    final response = await http.get(
      Uri.http('192.168.1.100:8080', url),
      headers: headers,
    );
    return response.body;
  }

  Future<Map> post(String url, dynamic data) async {
    final response = await http.post(
      Uri.http('192.168.1.100:8080', url),
      body: data,
      headers: headers,
    );
    setCookie(response);
    return response.headers;
  }

  setCookie(http.Response response) {
    print('HEADERS: ' + headers.toString());
    headers['Cookie'] = response.headers['set-cookie'].split(';')[0];
    print('HEADERS: ' + headers.toString());
  }
}
