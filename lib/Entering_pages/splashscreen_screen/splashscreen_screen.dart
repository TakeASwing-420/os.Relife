import 'package:flutter/material.dart';
import 'package:Relife/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Perform any initialization tasks here
    // Example: Fetching data, checking authentication, etc.
    // Simulating a delay with Future.delayed for demonstration purpose
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the loginPage once initialization is complete
      Navigator.pushNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 94.adaptSize,
              width: 94.adaptSize,
            ),
            SizedBox(height: 18.v),
            Text(
              "os.Relife",
              style: theme.textTheme.headlineLarge,
            ),
            SizedBox(height: 5.v),
            CircularProgressIndicator(color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
