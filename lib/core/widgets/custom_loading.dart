import 'package:discover/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(AppAssets.lottieLoadingLottie, width: 200,),
    );
  }
}