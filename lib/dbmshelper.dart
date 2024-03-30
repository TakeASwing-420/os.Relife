import 'dart:convert';
import 'package:http/http.dart' as http;

class DBMSHelper {
  static String baseUrl = 'http://192.168.0.153:3000';

  static Future<String> registerUser(String username, String password,
      String confirmPassword, String walletAddress) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'username': username,
        'password': password,
        'confirm_password': confirmPassword,
        'wallet': walletAddress,
      }),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data['private_key'];
    } else {
      throw Exception(data['error']);
    }
  }

  static Future<void> loginUser(
      String username, String password, String pKey) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'username': username, 'password': password, 'private_key': pKey}),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['error']);
    }
  }

  static Future<void> balance_unlimited(String username) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login user: ${response.body}');
    } else {
      final data = jsonDecode(response.body);
      return data['_balance'];
      //hetyui
    }
  }
}
