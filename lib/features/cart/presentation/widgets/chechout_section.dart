import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/cart/presentation/widgets/title_price_cart.dart';
import 'package:flutter/material.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

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
            TitlePriceCart(title: 'Sub-total', price: '5,870'),
            HeightSized(height: 16),
            TitlePriceCart(title: 'VAT (%)', price: '0,000'),
            HeightSized(height: 16),
            TitlePriceCart(title: 'Shipping fee', price: '80'),
            Divider(color: AppColors.gray, height: 32),
            TitlePriceCart(
              colorTitle: AppColors.black,
              title: 'Total',
              price: '5,950',
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
