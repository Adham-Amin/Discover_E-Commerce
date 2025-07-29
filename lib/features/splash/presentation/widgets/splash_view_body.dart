import 'package:discover/core/services/secure_storage.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/features/auth/presentation/views/login_view.dart';
import 'package:discover/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }

  void _checkAuthStatus(context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final token = await SecureStorage.read(key: 'token');

    if (token == null) {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, MainView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Discover', style: AppStyles.textSemiBold32));
  }
}
