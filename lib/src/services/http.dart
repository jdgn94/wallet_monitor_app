import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallet_monitor/src/localStorage/settings.dart';

class HttpServices {
  final String _urlBase = 'http://localhost:3000/api';
  final _pref = SettingsLocalStorage.pref;

  Map<String, String> _headers() {
    final token = _pref.getString('token');
    return {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST, PUT, PATCH, DELETE, OPTIONS",
      "Authorization": "Bearer $token"
    };
  }

  // function to sen http request to log in and return message and token in headers
  Future<Map<String, String>> logIn(String user, String pass) async {
    final Map<String, String> headers = _headers();
    final lang = _pref.getString('lang') ?? 'en';
    final url = Uri.parse('$_urlBase/log_in?lang=$lang');
    final Object body = {"username": user, "password": pass};

    try {
      final response = await http.post(url, headers: headers, body: body);
      final messageResponse = _messageResponse(response);

      if (response.statusCode < 300) {
        await _pref.setString('token', response.headers["authorization"]!);
      }

      print(response.statusCode);
      return messageResponse;
    } catch (e) {
      print(e);
      return {'status': "error", 'message': 'Error no defined'};
    }
  }
}

Map<String, String> _messageResponse(http.Response response) {
  final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
  ;
  print("estoy en la funcion para sacar el mensaje formateado");
  late String code;
  print(response.body);

  if (response.statusCode < 300) {
    code = 'success';
  } else {
    code = 'error';
  }

  return {
    "status": code,
    "message": jsonResponse['message'] ?? "No message",
  };
}
