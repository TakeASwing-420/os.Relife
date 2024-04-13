import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Relife/core/app_export.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<LatLng> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var newPosition =
        await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
    return LatLng(newPosition.latitude, newPosition.longitude);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        // Get current location
        LatLng currentLocation = await _determinePosition();

        // Store current location in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble('current_latitude', currentLocation.latitude);
        prefs.setDouble('current_longitude', currentLocation.longitude);

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
