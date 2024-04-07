import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashscreenScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
