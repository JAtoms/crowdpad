import '../../index_exports.dart';
import 'global_routes.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
    }
  }
}
