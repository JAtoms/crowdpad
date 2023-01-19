import 'package:crowdpad/ui/auth_screens/signin_screen.dart';
import 'package:crowdpad/ui/auth_screens/signup_screen.dart';
import 'package:crowdpad/ui/dashboard/domain/domain.dart';

import '../../index_exports.dart';
import 'global_routes.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.domain:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Domain());

      case Routes.homePage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());

      case Routes.signInScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
    }
  }
}
