import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_loading.dart';
import 'package:discover/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:discover/features/cart/presentation/widgets/cart_item.dart';
import 'package:discover/features/cart/presentation/widgets/chechout_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {

  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 300.h),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16.h,
                      children:
                          state.cart.product
                              .map((product) => CartItem(product: product))
                              .toList(),
                    ),
                  ),
                ),
                CheckoutSection(
                  countProducts: state.cart.countProducts.toString(),
                  countQuantity: state.cart.countQuantity.toString(),
                  price: state.cart.totalPrice.toString(),
                  discountedTotal: state.cart.discount.toString(),
                ),
              ],
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message, style: AppStyles.textRegular16),
          );
        } else {
          return CustomLoading();
        }
      },
    );
  }
}
