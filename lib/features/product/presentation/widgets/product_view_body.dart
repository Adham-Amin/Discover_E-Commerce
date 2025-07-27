import 'package:discover/core/utils/app_assets.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSized(height: 20),
          Container(
            width: double.infinity,
            height: 386.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(AppAssets.imagesProductTest, fit: BoxFit.cover),
          ),
          HeightSized(height: 12),
          Text(
            'Fit Polo T Shirt',
            style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
          ),
          HeightSized(height: 12),
          Row(
            spacing: 6.w,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text(
                '4.0/5',
                style: AppStyles.textMedium16.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '(45 reviews)',
                style: AppStyles.textMedium16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          HeightSized(height: 12),
          Text(
            'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
            style: AppStyles.textRegular16.copyWith(color: AppColors.secondary),
          ),
          Spacer(),
          Divider(color: AppColors.gray, height: 20.h),
          Row(
            spacing: 16.w,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: AppStyles.textRegular16.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    '\$ 1,100',
                    style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
                  ),
                ],
              ),
              Expanded(child: CustomButton(title: 'Add to Cart', onPressed: () {})),
            ],
          ),
          HeightSized(height: 8)
        ],
      ),
    );
  }
}
