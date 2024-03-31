import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DBMSHelper {
  static String baseUrl = 'http://192.168.0.153:3000';

  static Future<void> deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
  }

  static Future<void> storeAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<void> storeUserName(String N) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', N);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<Map<String, dynamic>> registerUser(String username,
      String password, String confirmPassword, String walletAddress) async {
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
      return {'private_key': data['private_key'], 'token': data['token']};
    } else {
      throw Exception(data['error']);
    }
  }

  static Future<dynamic> loginUser(
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
    } else
      return data['token'];
  }

  static Future<Map<String, dynamic>> getProtectedData() async {
    final String? accessToken = await getAccessToken();
    if (accessToken == null) {
      throw Exception('Access token not found.');
    }

    final url = Uri.parse('$baseUrl/protected-route');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken,
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {'user': data['user']};
    } else {
      throw Exception(data['error']);
    }
  }

  static Future<String> getCoins() async {
    final String? username = await getUserName();
    final url = Uri.parse('$baseUrl/balance');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({'username': username}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data['_balance'];
    } else {
      throw Exception(data['error']);
    }
  }
}
