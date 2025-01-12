import 'dart:convert';
import 'package:agriplant/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class UserService {

  // Login
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.loginEndpoint}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Đăng nhập thất bại: ${response.body}');
    }
  }
}
