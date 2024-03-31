import 'package:Relife/core/app_export.dart';
import 'package:Relife/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:Relife/my_app/detail_page_challenge_screen/detail_page_challenge_screen.dart';

class ChallengelistItemWidget extends StatelessWidget {
  final String imagePath;
  final int creditScore;

  const ChallengelistItemWidget({
    Key? key,
    required this.imagePath,
    required this.creditScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 1.v),
            decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder4,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder4,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder4,
                ),
                child: Container(
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder4,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CustomImageView(
                        imagePath: imagePath,
                        height: 100.adaptSize,
                        width: 100.adaptSize,
                        radius: BorderRadius.circular(4.h),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(right: 41.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 48.v,
                                width: 1.h,
                                decoration: BoxDecoration(
                                  color: appTheme.gray800,
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 16.v,
                                  width: 22.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.gray800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 3.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jakarta 200KM Rides",
                  style: CustomTextStyles.labelLargeSpaceGroteskGray900,
                ),
                SizedBox(height: 3.v),
                Text(
                  "Ends on June 2024",
                  style: CustomTextStyles.labelMediumDeeporange500,
                ),
                SizedBox(height: 4.v),
                RichText(
                  text: TextSpan(
                    text: 'Credits Pts: ',
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                    children: [
                      TextSpan(
                        text: '$creditScore',
                        style: TextStyle(
                          color: appTheme.gray800,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.fSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.v),
                Text(
                  "Ride with Rivelo",
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 3.v),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPageChallengeScreen(),
                      ),
                    );
                  },
                  height: 38.v,
                  width: 140.h,
                  text: "Join challenge",
                  buttonTextStyle: CustomTextStyles.titleSmallSpaceGrotesk,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
