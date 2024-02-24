import 'package:deep_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilesectionItemWidget extends StatelessWidget {
  UserprofilesectionItemWidget({
    Key? key,
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
                      imagePath: ImageConstant.imgFrame62,
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
                            "Dr. Marcus Aminoff",
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
