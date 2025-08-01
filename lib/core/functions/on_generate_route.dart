import 'package:discover/features/auth/presentation/views/login_view.dart';
import 'package:discover/features/auth/presentation/views/sign_up_view.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:discover/features/main/presentation/views/main_view.dart';
import 'package:discover/features/home/presentation/views/product_view.dart';
import 'package:discover/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ProductView.routeName:
      return MaterialPageRoute(
        builder:
            (context) =>
                ProductView(product: settings.arguments as ProductEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
