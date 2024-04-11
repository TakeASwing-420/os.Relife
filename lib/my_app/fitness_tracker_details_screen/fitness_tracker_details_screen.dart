import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class FitnessTrackerDetailsScreen extends StatefulWidget {
  FitnessTrackerDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<FitnessTrackerDetailsScreen> createState() =>
      _FitnessTrackerDetailsScreenState();
}

class _FitnessTrackerDetailsScreenState
    extends State<FitnessTrackerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 17.v),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 4.v),
                SizedBox(
                  height: 692.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      _buildStackmap(context),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 175.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 1),
                              colors: [
                                appTheme.black900,
                                appTheme.black900.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildStackvectorfour(context)
                    ],
                  ),
                ),
                SizedBox(height: 36.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget

  Widget buildPlayIconButton({
    required double radius,
    required VoidCallback onPressed,
  }) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Icon(
            Icons.play_arrow,
            size: 40.adaptSize,
            color: Colors.deepOrangeAccent,
          ),
        ),
        Material(
          color: Colors.transparent,
          shape: CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(radius),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: radius,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildStackmap(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 378.v,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 24.v),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgSnazzyImage1,
              height: 378.v,
              width: 414.h,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackvectorfour(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.deepOrange500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 337.v,
          width: double.maxFinite,
          decoration: AppDecoration.gradientDeepOrangeToRed.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    right: 41.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35.v),
                      Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "3",
                                    style: CustomTextStyles.titleMediumGray50,
                                  ),
                                  TextSpan(
                                      text: "h",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70001),
                                  TextSpan(
                                    text: "     ",
                                  ),
                                  TextSpan(
                                    text: "25",
                                    style: CustomTextStyles.titleMediumGray50,
                                  ),
                                  TextSpan(
                                    text: "m",
                                    style:
                                        CustomTextStyles.titleMediumWhiteA70001,
                                  )
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 71.h),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "8104",
                                      style: CustomTextStyles.titleMediumGray50,
                                    ),
                                    TextSpan(
                                      text: "   ",
                                    ),
                                    TextSpan(
                                      text: "steps",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70001,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 150.v),
                      Padding(
                        padding: EdgeInsets.only(left: 162.h),
                        child: buildPlayIconButton(
                            radius: 22.adaptSize, onPressed: () {}),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
