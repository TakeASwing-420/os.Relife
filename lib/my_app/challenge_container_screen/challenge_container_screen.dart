import 'package:Relife/core/app_export.dart';
import 'package:Relife/my_app/challenge_page/challenge_page.dart';
import 'package:Relife/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Relife/my_app/medical/medical.dart';
import 'package:Relife/my_app/settings/settings.dart';

class ChallengeContainerScreen extends StatefulWidget {
  ChallengeContainerScreen({Key? key}) : super(key: key);

  @override
  State<ChallengeContainerScreen> createState() =>
      _ChallengeContainerScreenState();
}

class _ChallengeContainerScreenState extends State<ChallengeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Future<dynamic> close_it(BuildContext context, String Title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            Title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        close_it(context, "Exit");
      },
      child: SafeArea(
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
              bottomNavigationBar: _buildBottomBar(context))),
    );
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
