import 'package:Relife/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilesectionItemWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final int creditScore;

  UserprofilesectionItemWidget({
    Key? key,
    required this.imagePath,
    required this.creditScore,
    required this.name,
    this.onTapUserProfile,
  }) : super(
          key: key,
        );

  VoidCallback? onTapUserProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapUserProfile!.call();
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder24,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 9.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: imagePath,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                      margin: EdgeInsets.only(bottom: 20.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 5.v),
                          Text(
                            "General practitioner",
                            style: theme.textTheme.labelLarge,
                          ),
                          SizedBox(height: 4.v),
                          Text(
                            "Chelsea and Westminster Hospital",
                            style: theme.textTheme.labelLarge,
                          ),
                          SizedBox(height: 4.v),
                          RichText(
                            text: TextSpan(
                              text: 'Credits Pts: ',
                              style: TextStyle(
                                  color: appTheme.black900,
                                  fontSize: 15.fSize,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                              children: [
                                TextSpan(
                                  text: '$creditScore',
                                  style: TextStyle(
                                      color: appTheme.gray800,
                                      fontSize: 13.fSize,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFrame,
                height: 19.adaptSize,
                width: 19.adaptSize,
                margin: EdgeInsets.only(
                  left: 38.h,
                  bottom: 60.v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
