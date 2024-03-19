import 'package:flutter/material.dart';
import 'package:Relife/core/app_export.dart';
import 'package:Relife/Entering_pages/homepage.dart';
import 'package:Relife/widgets/custom_elevated_button.dart';
import 'package:Relife/widgets/custom_text_form_field.dart';

class RegistarScreen extends StatelessWidget {
  RegistarScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
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
                _buildUserName(context),
                SizedBox(height: 11.v),
                _buildPassword(context),
                SizedBox(height: 11.v),
                _buildConfirmPassword(context),
                SizedBox(height: 29.v),
                _buildRegister(context),
                SizedBox(height: 30.v),
                Text(
                  "You need to have a crypto wallet",
                  style: CustomTextStyles.titleSmallBlack900,
                ),
                SizedBox(height: 57.v),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.loginScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: CustomTextStyles.titleSmallff090808,
                        ),
                        TextSpan(
                          text: "Login Now",
                          style: CustomTextStyles.titleSmallfff58220.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 61.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: CustomTextFormField(
        textStyle: CustomTextStyles.bodySmallBlack900,
        controller: userNameController,
        hintText: "Username",
        borderDecoration: TextFormFieldStyleHelper.outlineIndigo,
        fillColor: appTheme.gray50,
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: CustomTextFormField(
        textStyle: CustomTextStyles.bodySmallBlack900,
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: CustomTextFormField(
        textStyle: CustomTextStyles.bodySmallBlack900,
        controller: confirmPasswordController,
        hintText: "Confirm password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildRegister(BuildContext context) {
    return CustomElevatedButton(
      text: "Register",
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String username = userNameController.text;
          String password = passwordController.text;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomePage(username: username, password: password),
            ),
          );
        }
      },
      margin: EdgeInsets.only(
        left: 27.h,
        right: 17.h,
      ),
    );
  }
}
