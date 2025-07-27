import 'package:discover/core/utils/app_styles.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        return Navigator.pushReplacementNamed(context, MainView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Discover', style: AppStyles.textSemiBold32));
  }
}
