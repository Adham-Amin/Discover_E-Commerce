import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/cart/presentation/widgets/title_price_cart.dart';
import 'package:flutter/material.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key, required this.countProducts, required this.countQuantity, required this.price, required this.discountedTotal});

  final String countProducts;
  final String countQuantity;
  final String price;
  final String discountedTotal;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: AppColors.gray),
            HeightSized(height: 16),
            TitlePriceCart(title: 'Total Products', price: countProducts),
            HeightSized(height: 16),
            TitlePriceCart(title: 'Total Quantity', price: countQuantity),
            HeightSized(height: 16),
            TitlePriceCart(title: 'Total', price: '\$$price'),
            Divider(color: AppColors.gray, height: 32),
            TitlePriceCart(
              colorTitle: AppColors.black,
              title: 'Discounted Total',
              price: '\$$discountedTotal',
            ),
            HeightSized(height: 24),
            CustomButton(title: 'Go To Checkout', onPressed: () {}),
            HeightSized(height: 24),
          ],
        ),
      ),
    );
  }
}
