import 'package:flutter/material.dart';
import 'package:Relife/presentation/iphone_13_mini_twentyseven_screen/iphone_13_mini_twentyseven_screen.dart';
import 'package:Relife/presentation/iphone_13_mini_twenty_screen/iphone_13_mini_twenty_screen.dart';
import 'package:Relife/presentation/iphone_13_mini_twentythree_screen/iphone_13_mini_twentythree_screen.dart';
import 'package:Relife/presentation/challenge_container_screen/challenge_container_screen.dart';
import 'package:Relife/presentation/detail_page_challenge_screen/detail_page_challenge_screen.dart';
import 'package:Relife/presentation/iphone_13_mini_twentysix_screen/iphone_13_mini_twentysix_screen.dart';
import 'package:Relife/presentation/settings/settings.dart';

import 'package:Relife/Entering_pages/splashscreen_screen/splashscreen_screen.dart';
import 'package:Relife/Entering_pages/registar_screen/registar_screen.dart';
import 'package:Relife/Entering_pages/login_screen/login_screen.dart';

class AppRoutes {
  static const String iphone13MiniTwentysevenScreen =
      '/iphone_13_mini_twentyseven_screen';

  static const String iphone13MiniTwentyScreen =
      '/iphone_13_mini_twenty_screen';

  static const String iphone13MiniTwentythreeScreen =
      '/iphone_13_mini_twentythree_screen';

  static const String challengePage = '/challenge_page';

  static const String challengeContainerScreen = '/challenge_container_screen';

  static const String SettingsScreen = '/settings';

  static const String iphone13MiniTwentysixScreen =
      '/iphone_13_mini_twentysix_screen';

  static const String detailpage = '/detail';
  static const String splashscreenScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String registarScreen = '/registar_screen';

  static Map<String, WidgetBuilder> routes = {
    iphone13MiniTwentysevenScreen: (context) => Iphone13MiniTwentysevenScreen(),
    iphone13MiniTwentyScreen: (context) => Iphone13MiniTwentyScreen(),
    iphone13MiniTwentythreeScreen: (context) => Iphone13MiniTwentythreeScreen(),
    challengeContainerScreen: (context) => ChallengeContainerScreen(),
    iphone13MiniTwentysixScreen: (context) => Iphone13MiniTwentysixScreen(),
    SettingsScreen: (context) => MySettingsScreen(),
    detailpage: (context) => DetailPageChallengeScreen(),
    splashscreenScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    registarScreen: (context) => RegistarScreen(),
  };
}
