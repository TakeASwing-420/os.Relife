import '../iphone_13_mini_twentyseven_screen/widgets/achievementslist_item_widget.dart';
import 'package:Relife/core/app_export.dart';
import 'package:flutter/material.dart';

class Iphone13MiniTwentysevenScreen extends StatelessWidget {
  const Iphone13MiniTwentysevenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0.97, 1.01),
              colors: [
                appTheme.tealA400,
                appTheme.teal500,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.v),
                Text(
                  "Achievements",
                  style: CustomTextStyles.headlineLargeBlack900,
                ),
                SizedBox(height: 20.v),
                _buildAchievementsList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAchievementsList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 10.v,
          );
        },
        itemCount: 7,
        itemBuilder: (context, index) {
          return AchievementslistItemWidget();
        },
      ),
    );
  }
}
