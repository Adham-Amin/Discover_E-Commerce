import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/core/widgets/width_sized.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:discover/features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocListener<AddToCartCubit, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartLoaded) {
            customSnackBar(
              context: context,
              message:
                  '${state.product.name} x ${state.product.count} added to cart',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is AddToCartError) {
            customSnackBar(
              context: context,
              message: state.message,
              type: AnimatedSnackBarType.error,
            );
          }
        },
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
                widget.product.imageUrl,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            HeightSized(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.product.name,
                    maxLines: 1,
                    style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  style: IconButton.styleFrom(
                    minimumSize: Size(16, 16),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  icon: Icon(Icons.remove, size: 16, color: AppColors.black),
                ),
                WidthSized(width: 8),
                Text(quantity.toString(), style: AppStyles.textMedium16),
                WidthSized(width: 8),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
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
            HeightSized(height: 12),
            Row(
              spacing: 6.w,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(
                  '${widget.product.rate}/5',
                  style: AppStyles.textMedium16.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  '(${widget.product.count} reviews)',
                  style: AppStyles.textMedium16.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            HeightSized(height: 12),
            Text(
              widget.product.overview,
              maxLines: 5,
              overflow: TextOverflow.clip,
              style: AppStyles.textRegular16.copyWith(
                color: AppColors.secondary,
              ),
            ),
            Spacer(),
            Divider(color: AppColors.gray, height: 20.h),
            Row(
              spacing: 16.w,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: AppStyles.textRegular16.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      Text(
                        '\$ ${widget.product.priceProduct * quantity}',
                        maxLines: 1,
                        style: AppStyles.textSemiBold32.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    title: 'Add to Cart',
                    onPressed: () {
                      context.read<AddToCartCubit>().addToCart(
                        id: widget.product.idProduct,
                        quantity: quantity,
                      );
                    },
                  ),
                ),
              ],
            ),
            HeightSized(height: 8),
          ],
        ),
      ),
    );
  }
}
