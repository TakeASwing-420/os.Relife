import 'package:flutter/material.dart';
import 'package:Relife/core/app_export.dart';
import "animation.dart";

class MySettingsScreen extends StatefulWidget {
  @override
  State<MySettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  String user_wallet = "";
  String password = "";
  String confirm_password = "";

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
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("Pick"),
              onPressed: () {},
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
              appTheme.red300,
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
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ImageBuilderAnimation(
                  imageAssetPath: ImageConstant.imgFrame622,
                  RADIUS: 110,
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
