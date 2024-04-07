import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Relife/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import "animation.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MySettingsScreen extends StatefulWidget {
  @override
  State<MySettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  String urlpath =
      "https://aquamarine-lazy-marmot-526.mypinata.cloud/ipfs/QmPgxBMhTg6FTETanmWA5hCBpGvCZXEkZm2MkyH1s4MjvX/?pinataGatewayToken=vSRxG5-Kq7UT0zr-khIm4yJqVmooF33MszFW5vIB-BqdCcu_sxASkUW9bkVHevhq";
  String jwtToken = dotenv.env['JWT'] ?? ""; //!Use your own pinata api token
  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    try {
      final String? _cid = await DBMSHelper.getCID();
      setState(() {
        if (_cid == "" || _cid == null) {
          urlpath =
              "https://aquamarine-lazy-marmot-526.mypinata.cloud/ipfs/QmPgxBMhTg6FTETanmWA5hCBpGvCZXEkZm2MkyH1s4MjvX/?pinataGatewayToken=vSRxG5-Kq7UT0zr-khIm4yJqVmooF33MszFW5vIB-BqdCcu_sxASkUW9bkVHevhq";
        } else
          urlpath =
              "https://aquamarine-lazy-marmot-526.mypinata.cloud/ipfs/$_cid/?pinataGatewayToken=vSRxG5-Kq7UT0zr-khIm4yJqVmooF33MszFW5vIB-BqdCcu_sxASkUW9bkVHevhq";
      });
    } catch (e) {
      setState(() {
        urlpath =
            "https://aquamarine-lazy-marmot-526.mypinata.cloud/ipfs/QmPgxBMhTg6FTETanmWA5hCBpGvCZXEkZm2MkyH1s4MjvX/?pinataGatewayToken=vSRxG5-Kq7UT0zr-khIm4yJqVmooF33MszFW5vIB-BqdCcu_sxASkUW9bkVHevhq";
      });
      final errorMessage = "Error Retrieving Image";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 20.v,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 5.h),
                Icon(
                  Icons.error_outline,
                  size: 35.adaptSize,
                  color: Colors.white,
                ),
                SizedBox(width: 5.h),
                Text(
                  '$errorMessage',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
      );
    }
  }

  String user_wallet = "";
  String password = "";
  String confirm_password = "";
  final ImagePicker _picker = ImagePicker();

  Future<dynamic> showUpdatePasswordDialog(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          content: Column(
            children: [
              Text(
                  "This is the update password dialog. Please Re-enter the app to apply Changes."),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "new",
                      fontSize: 22),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.black,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "new",
                      fontSize: 22),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.black,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    confirm_password = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showUpdateWalletDialog(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          content: Column(
            children: [
              Text(
                  "This is the update Wallet dialog. After doing so re-enter into the app to apply changes"),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'New Wallet Address',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "new",
                      fontSize: 22),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    user_wallet = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showDeleteProfileDialog(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          content: Column(
            children: [
              Text(
                  "This is the delete profile section. After doing so, re-enter into the app to apply changes"),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "new",
                      fontSize: 22),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.black,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "new",
                      fontSize: 22),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.black,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    confirm_password = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showUpdateAvatarDialog(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            Title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          content: Text(
              "This is the update avatar dialog. After that re-enter into the app to apply changes"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("Pick"),
              onPressed: () async {
                final _image =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (_image != null) {
                  try {
                    final String? username = await DBMSHelper.getUserName();
                    final String? pinatahash = await _pinFileToIPFS(_image);
                    await DBMSHelper.updateCID(username!, pinatahash);
                    print("-----------------------------------------------");
                    print(pinatahash);
                    print("------------------------------------------------");
                    setState(() {
                      urlpath =
                          "https://aquamarine-lazy-marmot-526.mypinata.cloud/ipfs/$pinatahash/?pinataGatewayToken=vSRxG5-Kq7UT0zr-khIm4yJqVmooF33MszFW5vIB-BqdCcu_sxASkUW9bkVHevhq";
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 20.v,
                        content: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 5.h),
                              Icon(
                                Icons.error_outline,
                                size: 35.adaptSize,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.h),
                              Text(
                                'Failed to pin image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  }
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> _pinFileToIPFS(var _image) async {
    var url = "https://api.pinata.cloud/pinning/pinFileToIPFS";
    print(jwtToken);
    var headers = {
      "Authorization": "Bearer " + jwtToken,
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['pinataMetadata'] = '{ "name": "Pinnie.json" }';
    request.fields['pinataOptions'] = '{ "cidVersion": 1 }';
    if (_image != null) {
      request.files.add(http.MultipartFile(
        'file',
        _image!.readAsBytes().asStream(),
        await _image!.length(),
        filename: _image!.path.split('/').last,
      ));
    } else {
      throw Exception('No image selected');
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse['IpfsHash'];
    } else {
      print(jsonResponse);
      throw Exception('Failed to pin file to IPFS');
    }
  }

  Future<dynamic> signOut(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            Title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          content: Text("Sign Out from your account"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("OK"),
              onPressed: () async {
                await DBMSHelper.deleteAccessToken();
                await DBMSHelper.deleteUser();
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.13, 0.05),
            end: Alignment(0.59, 0.99),
            colors: [
              appTheme.whiteA700,
              appTheme.deepOrange500,
            ],
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 35),
            Row(
              children: [
                Spacer(flex: 1),
                Text(
                  "Account Settings",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 21,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: "customfont",
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1, color: Colors.redAccent),
            SizedBox(height: 10),
            ListTile(
              title: Text("Update Password",
                  style: TextStyle(color: Colors.black87, fontSize: 22)),
              trailing: IconButton(
                icon: Icon(
                  Icons.key,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  showUpdatePasswordDialog(context, "Update Password");
                },
              ),
            ),
            ListTile(
              title: Text("Delete Profile",
                  style: TextStyle(color: Colors.black87, fontSize: 22)),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  showDeleteProfileDialog(context, "Delete profile");
                },
              ),
            ),
            ListTile(
              title: Text("Update Wallet Address",
                  style: TextStyle(color: Colors.black87, fontSize: 22)),
              trailing: IconButton(
                icon: Icon(
                  Icons.card_membership,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  showUpdateWalletDialog(context, "Update Wallet");
                },
              ),
            ),
            ListTile(
              title: Text("Update Avatar",
                  style: TextStyle(color: Colors.black87, fontSize: 22)),
              trailing: IconButton(
                icon: Icon(
                  Icons.person_2_rounded,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  showUpdateAvatarDialog(context, "Update Avatar");
                },
              ),
            ),
            ListTile(
              title: Text("Sign Out",
                  style: TextStyle(color: Colors.black87, fontSize: 22)),
              trailing: IconButton(
                icon: Icon(
                  Icons.power_settings_new,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  signOut(context, "Sign Out");
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ImageBuilderAnimation(
                  imageAssetPath: urlpath,
                  RADIUS: 99,
                ),
              ),
            ),
            Center(
              child: Text("Augatha Christy",
                  style: TextStyle(
                      color: Colors.black87, fontSize: 21, fontFamily: "new")),
            ),
          ],
        ),
      ),
    );
  }
}
