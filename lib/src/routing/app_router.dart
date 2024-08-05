import 'package:yb_mobile/src/features/authentication/forgot_password/forgot_password_screen.dart';
import 'package:yb_mobile/src/features/authentication/sign_in/sign_in_options/sign_in_options_screen.dart';
import 'package:yb_mobile/src/features/authentication/sign_in/sign_in_screen.dart';
import 'package:yb_mobile/src/features/authentication/sign_in/sign_in_with_email/sign_in_with_email_screen.dart';
import 'package:yb_mobile/src/features/authentication/sign_up/sign_up_screen.dart';
import 'package:yb_mobile/src/features/authentication/sign_up/sign_up_with_email/sign_up_with_email_screen.dart';
import 'package:yb_mobile/src/features/home/home_screen.dart';
import 'package:yb_mobile/src/features/home/onboarding/onboarding_screen.dart';
import 'package:yb_mobile/src/features/home/splash/splash_screen.dart';
import 'package:yb_mobile/src/features/home/terms_and_conditions_screen.dart';

import '../../common_libs.dart';
import '../features/authentication/confirm_otp/confirm_otp_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouterConstants.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouterConstants.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouterConstants.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouterConstants.confirmOtp:
        return MaterialPageRoute(builder: (_) => const ConfirmOtpScreen());
      case RouterConstants.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouterConstants.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RouterConstants.signInOptions:
        return MaterialPageRoute(builder: (_) => const SignInOptionsScreen());
      case RouterConstants.signInWithEmail:
        return MaterialPageRoute(builder: (_) => const SignInWithEmailScreen());
      case RouterConstants.signUpWithEmail:
        return MaterialPageRoute(builder: (_) => const SignUpWithEmailScreen());
      case RouterConstants.termsAndConditions:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsScreen());
      // Add more cases for other routes
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
