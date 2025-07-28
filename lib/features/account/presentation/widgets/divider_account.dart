import 'package:discover/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerAcount extends StatelessWidget {
  const DividerAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 48.h,
      color: AppColors.gray,
      indent: 64.w,
      endIndent: 24.w,
    );
  }
}
