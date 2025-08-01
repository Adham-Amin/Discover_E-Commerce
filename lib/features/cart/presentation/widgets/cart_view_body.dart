import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/cart/presentation/widgets/cart_item.dart';
import 'package:discover/features/cart/presentation/widgets/chechout_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 300.h),
            child: SingleChildScrollView(
              child: Column(
                children: [HeightSized(height: 10), CartItem(), CartItem()],
              ),
            ),
          ),
          CheckoutSection(),
        ],
      ),
    );
  }
}
