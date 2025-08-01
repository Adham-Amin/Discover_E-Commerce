import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/width_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final String icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          WidthSized(width: 24.w),
          Image.asset(icon, width: 24.h, height: 24.h),
          WidthSized(width: 16),
          Text(title, style: AppStyles.textRegular16),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.secondary,
          ),
          WidthSized(width: 24.w),
        ],
      ),
    );
  }
}
