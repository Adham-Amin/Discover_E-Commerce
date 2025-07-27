import 'package:discover/core/utils/app_assets.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: Image.asset(
            AppAssets.imagesProductTest,
            width: 161,
            height: 174,
            fit: BoxFit.cover,
          ),
        ),
        HeightSized(height: 8),
        Text(
          'Fit Polo T Shirt',
          style: AppStyles.textRegular16.copyWith(fontWeight: FontWeight.w600),
        ),
        HeightSized(height: 4),
        Text(
          '\$ 1,100',
          style: AppStyles.textMedium12.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
