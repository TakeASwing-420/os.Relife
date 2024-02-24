import 'package:flutter/material.dart';
import 'package:deep_s_application3/presentation/iphone_13_mini_twentyseven_screen/iphone_13_mini_twentyseven_screen.dart';
import 'package:deep_s_application3/presentation/iphone_13_mini_twenty_screen/iphone_13_mini_twenty_screen.dart';
import 'package:deep_s_application3/presentation/iphone_13_mini_twentythree_screen/iphone_13_mini_twentythree_screen.dart';
import 'package:deep_s_application3/presentation/challenge_container_screen/challenge_container_screen.dart';
import 'package:deep_s_application3/presentation/detail_page_challenge_screen/detail_page_challenge_screen.dart';
import 'package:deep_s_application3/presentation/iphone_13_mini_twentysix_screen/iphone_13_mini_twentysix_screen.dart';
import 'package:deep_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String iphone13MiniTwentysevenScreen =
      '/iphone_13_mini_twentyseven_screen';

  static const String iphone13MiniTwentyScreen =
      '/iphone_13_mini_twenty_screen';

  static const String iphone13MiniTwentythreeScreen =
      '/iphone_13_mini_twentythree_screen';

  static const String challengePage = '/challenge_page';

  static const String challengeContainerScreen = '/challenge_container_screen';

  static const String detailPageChallengeScreen =
      '/detail_page_challenge_screen';

  static const String iphone13MiniTwentysixScreen =
      '/iphone_13_mini_twentysix_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    iphone13MiniTwentysevenScreen: (context) => Iphone13MiniTwentysevenScreen(),
    iphone13MiniTwentyScreen: (context) => Iphone13MiniTwentyScreen(),
    iphone13MiniTwentythreeScreen: (context) => Iphone13MiniTwentythreeScreen(),
    challengeContainerScreen: (context) => ChallengeContainerScreen(),
    detailPageChallengeScreen: (context) => DetailPageChallengeScreen(),
    iphone13MiniTwentysixScreen: (context) => Iphone13MiniTwentysixScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
