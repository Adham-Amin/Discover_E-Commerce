import 'package:discover/core/utils/app_assets.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/core/widgets/width_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset(AppAssets.imagesProductTest, width: 83.w),
          WidthSized(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Fit Polo T Shirt',
                      style: AppStyles.textSemiBold32.copyWith(fontSize: 14),
                    ),
                    Spacer(),
                    Icon(Icons.delete_outline, color: Colors.red),
                  ],
                ),
                HeightSized(height: 24),
                Row(
                  children: [
                    Text(
                      '\$ 1,190',
                      style: AppStyles.textSemiBold32.copyWith(fontSize: 14),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        minimumSize: Size(16, 16),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      icon: Icon(
                        Icons.remove,
                        size: 16,
                        color: AppColors.black,
                      ),
                    ),
                    WidthSized(width: 8),
                    Text('1', style: AppStyles.textMedium16),
                    WidthSized(width: 8),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        minimumSize: Size(16, 16),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      icon: Icon(Icons.add, size: 16, color: AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
