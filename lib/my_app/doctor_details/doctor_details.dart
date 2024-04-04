import 'package:Relife/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:Relife/widgets/custom_elevated_button.dart';
import 'package:confetti/confetti.dart';

class Iphone13MiniTwentythreeScreen extends StatefulWidget {
  final int creditScore;

  Iphone13MiniTwentythreeScreen({Key? key, required this.creditScore})
      : super(key: key);

  @override
  State<Iphone13MiniTwentythreeScreen> createState() =>
      _Iphone13MiniTwentythreeScreenState();
}

class _Iphone13MiniTwentythreeScreenState
    extends State<Iphone13MiniTwentythreeScreen> {
  late SnackBar snackBar;
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SizedBox(
                    height: SizeUtils.height,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: 811.v,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(0, 0),
                                      end: Alignment(1, 1.02),
                                      colors: [
                                    appTheme.deepOrange400,
                                    appTheme.red700
                                  ])))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgGroup5),
                                      fit: BoxFit.cover)),
                              child: Container(
                                  height: SizeUtils.height,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: appTheme.gray900E5)))),
                      _buildStackOne(context),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 550.v,
                              padding: EdgeInsets.symmetric(vertical: 6.v),
                              decoration: AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL24),
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                              width: 60.h, child: Divider())),
                                      SizedBox(height: 18.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.h, right: 100.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Specialist",
                                                          style: theme.textTheme
                                                              .titleLarge),
                                                      SizedBox(height: 8.v),
                                                      Text("Surgeon",
                                                          style: theme.textTheme
                                                              .titleMedium)
                                                    ]),
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgImage2,
                                                    height: 43.adaptSize,
                                                    width: 43.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        bottom: 7.v))
                                              ])),
                                      SizedBox(height: 17.v),
                                      _buildStackTwo(context),
                                      SizedBox(height: 6.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 20.h),
                                          child: Text("Available Services",
                                              style:
                                                  theme.textTheme.titleLarge)),
                                      SizedBox(height: 11.v),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: 333.h,
                                              margin: EdgeInsets.only(
                                                  left: 20.h, right: 21.h),
                                              child: Text(
                                                  "General Surgery, Orthopedic Surgery Cardiothoracic Surgery, Neurosurgery , Plastic and Reconstructive Surgery, Gynecological Surgery",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.labelLarge!
                                                      .copyWith(
                                                          height: 1.50,
                                                          color:
                                                              Colors.black)))),
                                      SizedBox(height: 14.v),
                                      _buildAvailableServicesStack(context),
                                      SizedBox(height: 26.h),
                                      CustomElevatedButton(
                                        height: 36.v,
                                        buttonStyle: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) {
                                            return Colors.deepOrange;
                                          }),
                                        ),
                                        onPressed: () async {
                                          try {
                                            final String response =
                                                await DBMSHelper.redeemTokens(
                                                    widget.creditScore);
                                            snackBar = SnackBar(
                                              elevation: 20.v,
                                              content: Text(
                                                '$response',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "new",
                                                    fontSize: 16.fSize),
                                              ),
                                              backgroundColor:
                                                  Colors.deepOrange,
                                            );
                                            _controller.play();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            await Future.delayed(
                                                Duration(seconds: 3));
                                            Navigator.pushNamed(
                                                context,
                                                AppRoutes
                                                    .iphone13MiniTwentyScreen);
                                          } catch (error) {
                                            final errorMessage = error;
                                            snackBar = SnackBar(
                                              elevation: 20.v,
                                              content: Row(
                                                children: [
                                                  SizedBox(width: 5.h),
                                                  Icon(
                                                    Icons.error_outline,
                                                    size: 35.adaptSize,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5.h),
                                                  Text(
                                                    '$errorMessage',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                              backgroundColor:
                                                  Colors.deepOrange,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        text: "Buy",
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 22.h),
                                      ),
                                      SizedBox(height: 70.v),
                                    ]),
                              )))
                    ])))),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
          ),
        ),
      ],
    ));
  }

  ///Section Widget
  Widget _buildAvailableServicesStack(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 400.v,
        width: 355.h,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 29.v,
                width: 201.h,
                margin: EdgeInsets.only(
                  left: 11.h,
                  top: 50.v,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 97.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Plan",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "Unlock all features with Premium Plan",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 76.v),
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 300.v,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 14.v,
                        ),
                        decoration:
                            AppDecoration.gradientDeepOrangeToRed700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 113.h,
                              child: Text(
                                "Monthly telehealth visits",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5.v,
                                    bottom: 30.v,
                                  ),
                                  child: Text(
                                    "",
                                    style: CustomTextStyles.labelLargeWhiteA700,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text(
                                    "9",
                                    style:
                                        CustomTextStyles.displayMediumWhiteA700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.v),
                            Container(
                              width: 116.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.h,
                                vertical: 3.v,
                              ),
                              decoration: AppDecoration.fillWhiteA7001.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder12,
                              ),
                              child: Text(
                                "49 visits",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            SizedBox(height: 20.v),
                            SizedBox(
                              width: 115.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgCheck,
                                    height: 34.adaptSize,
                                    width: 34.adaptSize,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.v),
                                    child: Text(
                                      "Active Plan",
                                      style:
                                          CustomTextStyles.bodySmallwhiteA700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: OutlineGradientButton(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            top: 4.v,
                            right: 4.h,
                            bottom: 4.v,
                          ),
                          strokeWidth: 4.h,
                          gradient: LinearGradient(
                            begin: Alignment(0.5, 0),
                            end: Alignment(0.5, 1),
                            colors: [
                              appTheme.deepOrange700,
                              appTheme.red700,
                            ],
                          ),
                          corners: Corners(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 10.v,
                            ),
                            decoration: AppDecoration.outline.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 85.h,
                                  child: Text(
                                    "Monthly \nIn-Office \nvisits",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5.v,
                                        bottom: 30.v,
                                      ),
                                      child: Text(
                                        "",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.h),
                                      child: Text(
                                        "19",
                                        style: theme.textTheme.displayMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.v),
                                Container(
                                  width: 116.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.h,
                                    vertical: 3.v,
                                  ),
                                  decoration:
                                      AppDecoration.fillBlack90026.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder12,
                                  ),
                                  child: Text(
                                    "99 visits",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                                SizedBox(height: 17.v),
                                CustomElevatedButton(
                                  width: 116.h,
                                  text: "Subscribe",
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientDeepOrangeToRedDecoration,
                                ),
                                SizedBox(height: 6.v),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: OutlineGradientButton(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            top: 4.v,
                            right: 4.h,
                            bottom: 4.v,
                          ),
                          strokeWidth: 4.h,
                          gradient: LinearGradient(
                            begin: Alignment(0.5, 0),
                            end: Alignment(0.5, 1),
                            colors: [
                              appTheme.deepOrange700,
                              appTheme.red700,
                            ],
                          ),
                          corners: Corners(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 11.v,
                            ),
                            decoration: AppDecoration.outline.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Yearly visits",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                                SizedBox(height: 19.v),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 6.v,
                                        bottom: 29.v,
                                      ),
                                      child: Text(
                                        "",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.h),
                                      child: Text(
                                        "99",
                                        style: theme.textTheme.displayMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  width: 116.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.h),
                                  decoration:
                                      AppDecoration.fillBlack900.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder12,
                                  ),
                                  child: Text(
                                    "499 visits",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                                SizedBox(height: 17.v),
                                CustomElevatedButton(
                                  width: 116.h,
                                  text: "Subscribe",
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientDeepOrangeToRedDecoration,
                                ),
                                SizedBox(height: 5.v),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgImage5,
              height: 42.adaptSize,
              width: 42.adaptSize,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(
                top: 5.v,
                right: 22.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackTwo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 32.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Education/Degree",
                            style: theme.textTheme.titleLarge),
                        SizedBox(height: 8.v),
                        Text("MS - General Surgery, MBBS",
                            style: theme.textTheme.titleMedium)
                      ])),
              CustomImageView(
                  imagePath: ImageConstant.imgImage6,
                  height: 54.adaptSize,
                  width: 54.adaptSize,
                  margin: EdgeInsets.only(top: 8.v))
            ]));
  }

  /// Section Widget
  Widget _buildStackOne(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 341.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.topLeft, children: [
              Opacity(
                  opacity: 0.3,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgFrame63,
                      height: 341.v,
                      width: 375.h,
                      radius: BorderRadius.circular(39.h),
                      alignment: Alignment.center)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 18.h, top: 53.v, right: 93.h),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 80.h),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgFrame62130x130,
                                          height: 175.adaptSize,
                                          width: 175.adaptSize,
                                          radius: BorderRadius.circular(39.h))
                                    ])),
                          ])))
            ])));
  }
}
