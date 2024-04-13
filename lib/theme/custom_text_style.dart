import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmallBlack900 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.black900);
  static get bodySmallwhiteA700 => theme.textTheme.bodySmall!.copyWith(
      color: appTheme.whiteA700,
      fontWeight: FontWeight.bold,
      fontSize: 12.fSize);
  // Display text style
  static get displayMediumWhiteA700 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPoppinsOnSecondaryContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallff090808 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF090808),
      );
  static get titleSmallfff58220 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFF58220),
        fontWeight: FontWeight.w700,
      );
  // Headline text style
  static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 19.fSize,
      );
  // Label text style
  static get labelLarge12 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 12.fSize,
      );
  static get labelLargeSpaceGroteskGray900 =>
      theme.textTheme.labelLarge!.spaceGrotesk.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeTealA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.tealA700,
        fontSize: 12.fSize,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelLargeYellow800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.yellow800,
        fontSize: 12.fSize,
      );
  static get labelMediumDeeporange500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepOrange500,
      );
  // Space text style
  static get spaceGroteskWhiteA700 => TextStyle(
        color: appTheme.whiteA700.withOpacity(0.44),
        fontSize: 128.fSize,
        fontWeight: FontWeight.w700,
      ).spaceGrotesk;
  static get spaceGroteskWhiteA700Bold => TextStyle(
        color: appTheme.whiteA700.withOpacity(0.55),
        fontSize: 128.fSize,
        fontWeight: FontWeight.w700,
      ).spaceGrotesk;
  // Title text style
  static get titleLargeSpaceGrotesk =>
      theme.textTheme.titleLarge!.spaceGrotesk.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSpaceGroteskGray900 =>
      theme.textTheme.titleMedium!.spaceGrotesk.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallDeeporangeA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.deepOrangeA200,
      );
  static get titleSmallSpaceGrotesk =>
      theme.textTheme.titleSmall!.spaceGrotesk.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get displaySmallBlack90001 => theme.textTheme.displaySmall!.copyWith(
        color: Colors.blueGrey,
      );
  static get displaySmallBlack90001_1 => theme.textTheme.displaySmall!.copyWith(
        color: const Color.fromARGB(255, 7, 7, 7),
      );
  static get displaySmallWhiteA70001 => theme.textTheme.displaySmall!.copyWith(
        color: const Color.fromARGB(255, 243, 232, 232),
      );
// Title text style
  static get titleMediumDeeporangeA200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepOrangeA200,
      );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
        fontSize: 30.fSize,
      );
  static get titleMediumWhiteA70001 => theme.textTheme.titleMedium!.copyWith(
        color: const Color.fromARGB(255, 243, 232, 232),
        fontSize: 30.fSize,
      );
  static get titleSmallPink100 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.pink100,
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get abhayaLibreExtraBold {
    return copyWith(
      fontFamily: 'Abhaya Libre ExtraBold',
    );
  }

  TextStyle get spaceGrotesk {
    return copyWith(
      fontFamily: 'Space Grotesk',
    );
  }
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get kavoon {
    return copyWith(
      fontFamily: 'Kavoon',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
