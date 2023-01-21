import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/ui/dashboard/domain/domain.dart';
import 'package:tiktok_flutter/ui/dashboard/upload_video/preview_screen.dart';

import 'global_routes.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.domain:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Domain());

      case Routes.previewScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                PreviewScreen(videoPath: settings.arguments as File));

      // case Routes.homePage:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const HomePage());
      //
      // case Routes.signInScreen:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const SignInScreen());
      //
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const SignUpScreen());
    }
  }
}
