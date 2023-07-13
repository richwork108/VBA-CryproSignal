import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestHelper {
  // make a web request with a link
  static Future<dynamic> getRequest(String url, Map data) async {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers : {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return jsonDecode(response.body);
  }
}
