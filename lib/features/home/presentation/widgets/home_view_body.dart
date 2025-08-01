import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_loading.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/home/presentation/cubit/home_cubit.dart';
import 'package:discover/features/home/presentation/widgets/categories_list.dart';
import 'package:discover/features/home/presentation/widgets/custom_text_field.dart';
import 'package:discover/features/home/presentation/widgets/product_item.dart';
import 'package:discover/features/home/presentation/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }

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
                CustomTextField(onChanged: (q) => context.read<HomeCubit>().search(q: q),),
                HeightSized(height: 16),
                CategoriesList(),
                HeightSized(height: 24),
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: state.products.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              ProductView.routeName,
                              arguments: state.products[index],
                            ),
                        child: ProductItem(product: state.products[index]),
                      ),
                );
              } else if (state is HomeError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.message, style: AppStyles.textMedium16),
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: CustomLoading());
              }
            },
          ),
        ],
      ),
    );
  }
}
