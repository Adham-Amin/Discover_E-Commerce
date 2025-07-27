import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/home/presentation/widgets/categories_list.dart';
import 'package:discover/features/home/presentation/widgets/custom_text_field.dart';
import 'package:discover/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSized(height: 60),
                Text('Discover', style: AppStyles.textSemiBold32),
                HeightSized(height: 16),
                CustomTextField(),
                HeightSized(height: 16),
                CategoriesList(),
                HeightSized(height: 24),
              ],
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemBuilder: (context, index) => ProductItem(),
          ),
        ],
      ),
    );
  }
}