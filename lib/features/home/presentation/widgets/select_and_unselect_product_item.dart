import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedAndUnSelectedCategoryItem extends StatelessWidget {
  const SelectedAndUnSelectedCategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedCategoryItem(title: title)
        : UnSelectedCategoryItem(title: title);
  }
}

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primary,
      ),
      child: Text(
        title,
        style: AppStyles.textMedium16.copyWith(color: AppColors.white),
      ),
    );
  }
}

class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gray),
      ),
      child: Text(title, style: AppStyles.textMedium16),
    );
  }
}
