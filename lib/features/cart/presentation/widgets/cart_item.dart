import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/core/widgets/width_sized.dart';
import 'package:discover/features/cart/domain/entities/products_cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final ProductsCartEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.network(
            product.image,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            width: 83.w,
          ),
          WidthSized(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: AppStyles.textSemiBold32.copyWith(fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.delete_outline, color: Colors.red),
                  ],
                ),
                HeightSized(height: 24),
                Row(
                  children: [
                    Text(
                      '\$ ${product.priceProduct}',
                      style: AppStyles.textSemiBold32.copyWith(fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      '${product.count} pcs',
                      style: AppStyles.textRegular16,
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
