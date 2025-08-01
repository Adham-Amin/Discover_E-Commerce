import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: Image.network(
            product.imageUrl,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            width: 160,
            height: 174,
            fit: BoxFit.fill,
          ),
        ),
        HeightSized(height: 8),
        Text(
          product.name,
          maxLines: 1,
          style: AppStyles.textRegular16.copyWith(fontWeight: FontWeight.w600),
        ),
        HeightSized(height: 4),
        Text(
          '\$ ${product.priceProduct}',
          style: AppStyles.textMedium12.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
