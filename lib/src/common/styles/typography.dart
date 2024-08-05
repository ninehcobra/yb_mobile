import 'package:yb_mobile/common_libs.dart';

class AppTypography {
  static const String fontRegular = 'Poppins-Regular';
  static const String fontMedium = 'Poppins-Medium';
  static const String fontBold = 'Poppins-Bold';

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle(fontFamily: fontBold, fontSize: 48),
    headlineMedium: TextStyle(
        fontFamily: fontBold, fontSize: 32, color: AppColors.neutralColor950),
    headlineSmall: const TextStyle(fontFamily: fontBold, fontSize: 18),
    bodyLarge: const TextStyle(fontFamily: fontBold, fontSize: 14),
    bodyMedium: const TextStyle(fontFamily: fontMedium, fontSize: 14),
    bodySmall: const TextStyle(fontFamily: fontRegular, fontSize: 14),
    labelLarge: TextStyle(
        fontFamily: fontBold, fontSize: 32, color: AppColors.neutralColor50),
    labelSmall: TextStyle(
        fontFamily: fontMedium, fontSize: 16, color: AppColors.neutralColor50),
  );
}
