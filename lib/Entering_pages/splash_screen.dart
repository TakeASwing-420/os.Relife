import 'package:flutter/material.dart';
import 'package:deep_s_application3/widgets/gradient_button.dart';
import 'package:deep_s_application3/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/fs.png'), // Replace with your PNG asset
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 505.v),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.adaptSize),
                        alignment: Alignment.center,
                        child: GradientLoginButton(),
                      ),
                      SizedBox(height: 10.v),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 37.v,
                          child: Text(
                            "OR",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 12.fSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: GradientRegisterButton(),
                      ),
                      SizedBox(height: 23.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
