import 'package:flutter/material.dart';
import "package:Relife/my_app/fitness_tracker_details_screen/fitness_tracker_details_screen.dart";
import 'package:Relife/my_app/medical/medical.dart';
import 'package:Relife/my_app/challenge_container_screen/challenge_container_screen.dart';

import 'package:Relife/my_app/settings/settings.dart';

import 'package:Relife/Entering_pages/splashscreen_screen/splashscreen_screen.dart';
import 'package:Relife/Entering_pages/registar_screen/registar_screen.dart';
import 'package:Relife/Entering_pages/login_screen/login_screen.dart';

class AppRoutes {
  static const String iphone13MiniTwentyScreen =
      '/iphone_13_mini_twenty_screen';

  static const String challengePage = '/challenge_page';

  static const String challengeContainerScreen = '/challenge_container_screen';

  static const String SettingsScreen = '/settings';

  static const String splashscreenScreen = '/splash_screen';

  static const String map = "/mapscreen";

  static const String loginScreen = '/login_screen';

  static const String registarScreen = '/registar_screen';

  static Map<String, WidgetBuilder> routes = {
    iphone13MiniTwentyScreen: (context) => Iphone13MiniTwentyScreen(),
    challengeContainerScreen: (context) => ChallengeContainerScreen(),
    SettingsScreen: (context) => MySettingsScreen(),
    splashscreenScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    registarScreen: (context) => RegistarScreen(),
  };
}
