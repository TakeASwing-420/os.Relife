import 'package:Relife/core/app_export.dart';
import 'package:Relife/widgets/app_bar/appbar_leading_image.dart';
import 'package:Relife/widgets/app_bar/appbar_subtitle.dart';
import 'package:Relife/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailPageChallengeScreen extends StatefulWidget {
  final int creditScore;
  final Color mycolor;
  final String mytext;
  final int challengeIndex;
  DetailPageChallengeScreen(
      {Key? key,
      required this.creditScore,
      required this.challengeIndex,
      required this.mycolor,
      required this.mytext})
      : super(
          key: key,
        );

  @override
  State<DetailPageChallengeScreen> createState() =>
      _DetailPageChallengeScreenState();
}

class _DetailPageChallengeScreenState extends State<DetailPageChallengeScreen> {
  bool _working = false;

  Future<void> begar_khata1() async {
    await DBMSHelper.fetchTokens(widget.creditScore);
    await DBMSHelper.setChallenges(widget.challengeIndex, false);
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushNamed(context, AppRoutes.challengePage);
  }

  Future<void> begar_khata2() async {
    await DBMSHelper.setChallenges(widget.challengeIndex, true);
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushNamed(context, AppRoutes.challengePage);
  }

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
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.gray400,
                appTheme.gray50001,
              ],
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 764.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 571.v,
                        width: double.maxFinite,
                        decoration: AppDecoration.gradientRedToRed,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.img1669Logo385x375,
                              height: 385.v,
                              width: 375.h,
                              alignment: Alignment.bottomCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgRectangle6,
                              height: 126.v,
                              width: 58.h,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(bottom: 71.v),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 20.v,
                                width: 80.h,
                                margin: EdgeInsets.only(right: 134.h),
                                decoration: BoxDecoration(
                                  color: appTheme.gray900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Opacity(
                        opacity: 0.55,
                        child: Text(
                          "Delhi 200KM",
                          style: CustomTextStyles.spaceGroteskWhiteA700Bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Opacity(
                        opacity: 0.25,
                        child: Padding(
                          padding: EdgeInsets.only(top: 31.v),
                          child: Text(
                            "Delhi 200 KM",
                            style: CustomTextStyles.spaceGroteskWhiteA700,
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMaskGroup,
                      height: 341.v,
                      width: 375.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 171.v),
                    ),
                    _buildAppBar(context),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                          vertical: 12.v,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20.v),
                            Container(
                              width: 235.h,
                              margin: EdgeInsets.only(
                                left: 53.h,
                                right: 38.h,
                              ),
                              child: Text(
                                "Delhi 200KM Ride Challenge",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headlineSmall,
                              ),
                            ),
                            SizedBox(height: 4.v),
                            Center(
                              child: Text(
                                "Ends on June 2024",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(height: 24.v),
                            SizedBox(
                              width: 326.h,
                              child: ReadMoreText(
                                "Join us for the Delhi 200KM Bike Challenge! This grueling event tests the limits of endurance as participants cycle 200 kilometers through the bustling streets of Delhi. With challenging terrain  ",
                                trimLines: 4,
                                colorClickableText: appTheme.deepOrange500,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Read more...",
                                moreStyle: CustomTextStyles.bodySmallBlack900,
                                lessStyle: CustomTextStyles.bodySmallBlack900,
                              ),
                            ),
                            SizedBox(height: 21.v),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _working = true;
                                  if (widget.mycolor == Colors.green) {
                                    begar_khata1();
                                  } else {
                                    begar_khata2();
                                  }
                                });
                              },
                              child: _working
                                  ? CircularProgressIndicator()
                                  : buildchallengeButton(),
                            ),
                            SizedBox(height: 24.v),
                            SizedBox(
                              width: 156.h,
                              child: Divider(
                                color: appTheme.gray900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildchallengeButton() {
    return Container(
      height: 42.v,
      width: 140.h,
      decoration: BoxDecoration(
        color: widget.mycolor,
        borderRadius: BorderRadius.circular(8.v),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.mytext,
        style: CustomTextStyles.titleSmallSpaceGrotesk.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDownGray900,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 25.v,
          bottom: 1.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Delhi 200KM Ride Challenge",
        margin: EdgeInsets.only(top: 28.v),
      ),
    );
  }
}
