import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.product});

  final ProductEntity product;

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
            child: Image.network(
              product.imageUrl,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          HeightSized(height: 12),
          Text(
            product.name.substring(0, 10),
            style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
          ),
          HeightSized(height: 12),
          Row(
            spacing: 6.w,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text(
                '${product.rate}/5',
                style: AppStyles.textMedium16.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '(${product.count} reviews)',
                style: AppStyles.textMedium16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          HeightSized(height: 12),
          Text(
            product.overview,
            maxLines: 5,
            overflow: TextOverflow.clip,
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
                    '\$ ${product.priceProduct}',
                    style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
                  ),
                ],
              ),
              Expanded(
                child: CustomButton(title: 'Add to Cart', onPressed: () {}),
              ),
            ],
          ),
          HeightSized(height: 8),
        ],
      ),
    );
  }
}
