import "package:flutter/material.dart";
import 'package:deep_s_application3/routes/app_routes.dart';
import 'package:deep_s_application3/core/app_export.dart';

class GradientLoginButton extends StatelessWidget {
  const GradientLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.v),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.LogIn);
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          fixedSize: Size(250.h, 33.v),
          backgroundColor: Color.fromARGB(255, 243, 96, 27),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.fSize,
          ),
        ),
      ),
    );
  }
}

class GradientRegisterButton extends StatelessWidget {
  const GradientRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.v),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.SignUp);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(250.h, 33.v),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        child: Text(
          "Register",
          style: TextStyle(
            color: Color.fromARGB(255, 243, 96, 27),
            fontSize: 15.fSize,
          ),
        ),
      ),
    );
  }
}
