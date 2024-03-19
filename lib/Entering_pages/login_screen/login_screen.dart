import 'package:Relife/widgets/custom_text_form_field.dart';
import 'package:Relife/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:Relife/core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: 43.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 61.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgLogoPrimary,
                      height: 51.adaptSize,
                      width: 51.adaptSize,
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "os.Relife",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 38.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.h),
                      child: CustomTextFormField(
                        textStyle: CustomTextStyles.bodySmallBlack900,
                        controller: userNameController,
                        hintText: "Enter your username",
                        borderDecoration:
                            TextFormFieldStyleHelper.outlineIndigo,
                        fillColor: appTheme.gray50,
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.h),
                      child: CustomTextFormField(
                        textStyle: CustomTextStyles.bodySmallBlack900,
                        controller: passwordController,
                        hintText: "Enter your password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 17.v, 16.h, 17.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgFluenteye20filled,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 56.v,
                        ),
                        obscureText: true,
                        contentPadding: EdgeInsets.only(
                          left: 18.h,
                          top: 18.v,
                          bottom: 18.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 22.h),
                        child: Text(
                          "Forgot Password?",
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.v),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.challengeContainerScreen);
                      },
                      text: "Login",
                      margin: EdgeInsets.symmetric(horizontal: 22.h),
                    ),
                    SizedBox(height: 47.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.registarScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: CustomTextStyles.titleSmallff090808,
                            ),
                            TextSpan(
                              text: "Register Now",
                              style:
                                  CustomTextStyles.titleSmallfff58220.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
