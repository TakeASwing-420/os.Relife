import 'package:flutter/material.dart';
import 'package:deep_s_application3/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "new",
                        fontSize: 22),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Border color when not focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Border color when enabled but not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Border color when focused
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      decorationThickness: 0),
                  cursorColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Border color when not focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Border color when enabled but not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Border color when focused
                    ),
                    fillColor: Colors.black,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "new",
                        fontSize: 22),
                    contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    filled: true,
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      decorationThickness: 0),
                  obscureText: true,
                  cursorColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, elevation: 5.0),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.challengeContainerScreen);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = "";
  String address = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          fontFamily: "new"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                      )),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Web3 Wallet Address',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          fontFamily: "new"),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                      )),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          fontFamily: "new"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                      )),
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Confirm Your Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          fontFamily: "new"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      )),
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.maxFinite, 35),
                      backgroundColor: Colors.blue[600]),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.challengeContainerScreen);
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
