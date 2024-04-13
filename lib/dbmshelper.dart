import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DBMSHelper {
  static String baseUrl =
      'http://relife-env.eba-na2t3mgp.ap-south-1.elasticbeanstalk.com'; //!This is AWS cloud server but you can run on localhost too
  static String jwtToken =
      dotenv.env['JWT'] ?? ""; //!Use your own pinata api token

  static Future<void> deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
  }

  static Future<void> deleteCID() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cid');
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

  static Future<void> storeCID(String N) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cid', N);
  }

  static Future<String?> getCID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cid');
  }

  static Future<void> updateCID(String username, String? cid) async {
    await storeCID(cid ?? "");
    final url = Uri.parse('$baseUrl/update-cid');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
        'cid': cid,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['error']);
    }
  }

  static Future<void> unpin() async {
    final existingCID = await DBMSHelper.getCID();

    // Unpin existing CID if it exists
    if (existingCID != null && existingCID != "") {
      await DBMSHelper.deleteCID();
      final url2 =
          Uri.parse("https://api.pinata.cloud/pinning/unpin/$existingCID");
      final response = await http.delete(
        url2,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + DBMSHelper.jwtToken,
        },
      );

      if (response.statusCode != 200) {
        final data = jsonDecode(response.body);
        throw Exception("Failed to unpin existing CID: ${data['error']}");
      }
    }
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

  static Future<Map<dynamic, String>> loginUser(
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
      return {'token': data['token'], 'cid': data['cid']};
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

  static Future<List<bool>> get_challenges() async {
    final String? username = await getUserName();
    final url = Uri.parse('$baseUrl/get-challenges');

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({'username': username}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> challengeList = data['challenges'];
      List<bool> boolList = challengeList.map((e) => e as bool).toList();
      return boolList;
    } else {
      throw Exception(data['error']);
    }
  }

  static Future<void> setChallenges(int challengeIndex, bool isActive) async {
    final String? username = await getUserName();
    final url = Uri.parse('$baseUrl/set-challenges');

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
        'challengeIndex': challengeIndex,
        'isActive': isActive,
      }),
    );

    if (response.statusCode != 200)
      throw Exception("Challenges could not be set");
  }

  static Future<String> redeemTokens(int amount) async {
    final url = Uri.parse('$baseUrl/redeem-tokens');
    final String? username = await getUserName();
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'amount': amount,
        'name': username,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (data['message']);
    } else {
      throw Exception(data['error']);
    }
  }

  static Future<void> fetchTokens(int amount) async {
    final url = Uri.parse('$baseUrl/fetch-tokens');
    final String? username = await getUserName();
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'amount': amount,
        'name': username,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      print(data);
      throw Exception(data['error']);
    }
  }

  static Future<String> updatePassword(
      String username,
      String privateKey,
      String previousPassword,
      String newPassword,
      String confirmPassword) async {
    final url = Uri.parse('$baseUrl/update-password');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
        'private_key': privateKey,
        'previous_password': previousPassword,
        'new_one': newPassword,
        'confirm_password': confirmPassword,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['error']);
    } else {
      return data["private_key"];
    }
  }

  static Future<String> goBuddy() async {
    final username = await DBMSHelper.getUserName();
    final url = Uri.parse('$baseUrl/wallet');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['error']);
    } else {
      String wallet = data["wallet"];
      String url = "https://sepolia.etherscan.io/address/$wallet";
      return url;
    }
  }

  static Future<void> deleteUserFromblockchain(
      String? username, String? previousPassword, String? privateKey) async {
    await DBMSHelper.unpin();
    await DBMSHelper.deleteAccessToken();
    await DBMSHelper.deleteUser();
    await DBMSHelper.deleteCID();

    final url = Uri.parse('$baseUrl/delete-user');
    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
        'previous_password': previousPassword,
        'private_key': privateKey,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['error']);
    }
  }

  static Future<void> updatewallet(String username, String wallet) async {
    final url = Uri.parse('$baseUrl/update-wallet');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({'username': username, "wallet": wallet}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['error']);
    }
  }
}
