import 'package:flutter/material.dart';
import 'package:Relife/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get tealA700 => BoxDecoration(
        color: appTheme.tealA700.withOpacity(0.6),
      );
  static BoxDecoration get fillBlack90026 => BoxDecoration(
        color: appTheme.black90026,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.8),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillorange => BoxDecoration(
        color: appTheme.deepOrange500..withOpacity(0.1),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );

  // Gradient decorations
  static BoxDecoration get gradientDeepOrangeToRed => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(1, 1.02),
          colors: [
            appTheme.deepOrange400,
            appTheme.red700,
          ],
        ),
      );
  static BoxDecoration get gradientDeepOrangeToRed700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.deepOrange700,
            appTheme.red700,
          ],
        ),
      );
  static BoxDecoration get gradientDeepOrangeToRed7001 => BoxDecoration(
        color: appTheme.black900,
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrange700.withOpacity(0.5),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(1, 1.03),
          colors: [
            appTheme.deepOrange40001,
            appTheme.red700,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.gray400,
            appTheme.gray50001,
          ],
        ),
      );
  static BoxDecoration get gradientRedToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.13, 0.05),
          end: Alignment(0.59, 0.99),
          colors: [
            appTheme.red300,
            appTheme.gray300,
          ],
        ),
      );
  static BoxDecoration get gradientRedToRed => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.4, -0.15),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.red500,
            appTheme.red200,
          ],
        ),
      );
  static BoxDecoration get gradientTealAToTeal => BoxDecoration(
        color: appTheme.black900,
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(0.97, 1.01),
          colors: [
            appTheme.tealA400,
            appTheme.teal500,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outline => BoxDecoration();
  static BoxDecoration get outlineDeepOrange => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrange700.withOpacity(0.5),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get circleBorder19 => BorderRadius.circular(
        19.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL24 => BorderRadius.vertical(
        bottom: Radius.circular(24.h),
      );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder39 => BorderRadius.circular(
        39.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
