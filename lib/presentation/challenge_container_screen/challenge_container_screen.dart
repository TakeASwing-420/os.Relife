import 'package:Relife/core/app_export.dart';
import 'package:Relife/presentation/challenge_page/challenge_page.dart';
import 'package:Relife/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:Relife/presentation/iphone_13_mini_twenty_screen/iphone_13_mini_twenty_screen.dart';
import 'package:Relife/presentation/settings/settings.dart';

// ignore_for_file: must_be_immutable
class ChallengeContainerScreen extends StatelessWidget {
  ChallengeContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                child: Navigator(
                    key: navigatorKey,
                    initialRoute: AppRoutes.challengePage,
                    onGenerateRoute: (routeSetting) => PageRouteBuilder(
                        pageBuilder: (ctx, ani, ani1) =>
                            getCurrentPage(routeSetting.name!),
                        transitionDuration: Duration(seconds: 0)))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Reward:
        return AppRoutes.iphone13MiniTwentyScreen;
      case BottomBarEnum.Challenge:
        return AppRoutes.challengePage;
      case BottomBarEnum.Setting:
        return AppRoutes.SettingsScreen;

      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.challengePage:
        return ChallengePage();
      case AppRoutes.iphone13MiniTwentyScreen:
        return Iphone13MiniTwentyScreen();

      case AppRoutes.SettingsScreen:
        return MySettingsScreen();
      default:
        return DefaultWidget();
    }
  }
}
