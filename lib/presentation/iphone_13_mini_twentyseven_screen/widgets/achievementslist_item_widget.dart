import 'package:Relife/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AchievementslistItemWidget extends StatelessWidget {
  const AchievementslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            "300 points",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 2.v),
          Text(
            "User opts-in to receive email content",
            style: CustomTextStyles.labelLarge12,
          ),
        ],
      ),
    );
  }
}
