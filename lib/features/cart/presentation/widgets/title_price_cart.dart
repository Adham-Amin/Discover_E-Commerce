import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitlePriceCart extends StatelessWidget {
  const TitlePriceCart({
    super.key,
    required this.title,
    required this.price,
    this.colorTitle,
  });

  final String title;
  final String price;
  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textRegular16.copyWith(
            color: colorTitle ?? AppColors.secondary,
          ),
        ),
        Text('\$ $price', style: AppStyles.textMedium16),
      ],
    );
  }
}
