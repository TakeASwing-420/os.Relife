import "package:flutter/material.dart";
import 'package:deep_s_application3/routes/app_routes.dart';

class GradientLoginButton extends StatelessWidget {
  const GradientLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.LogIn);
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          fixedSize: const Size(250, 15),
          backgroundColor: Color.fromARGB(255, 243, 96, 27),
        ),
        child: const Text(
          "Login",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
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
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.SignUp);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(250, 15),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        child: const Text(
          "Register",
          style: TextStyle(
              color: Color.fromARGB(255, 243, 96, 27),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
