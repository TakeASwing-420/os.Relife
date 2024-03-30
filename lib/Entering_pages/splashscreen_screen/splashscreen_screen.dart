import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    Future.delayed(Duration.zero, () async {
      try {
        await DBMSHelper.getProtectedData();
        Navigator.pushNamed(context, AppRoutes.challengeContainerScreen);
      } catch (e) {
        Navigator.pushNamed(context, AppRoutes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
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
      ),
    );
  }
}
