import 'package:discover/features/home/presentation/cubit/home_cubit.dart';
import 'package:discover/features/home/presentation/widgets/select_and_unselect_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(context).getProducts();
              setState(() {
                currentIndex = 0;
              });
            },
            title: 'all',
            isSelected: currentIndex == 0,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'beauty');
              setState(() {
                currentIndex = 1;
              });
            },
            title: 'beauty',
            isSelected: currentIndex == 1,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'fragrances');
              setState(() {
                currentIndex = 2;
              });
            },
            title: 'fragrances',
            isSelected: currentIndex == 2,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'furniture');
              setState(() {
                currentIndex = 3;
              });
            },
            title: 'furniture',
            isSelected: currentIndex == 3,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'groceries');
              setState(() {
                currentIndex = 4;
              });
            },
            title: 'groceries',
            isSelected: currentIndex == 4,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'home-decoration');
              setState(() {
                currentIndex = 5;
              });
            },
            title: 'home-decoration',
            isSelected: currentIndex == 5,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'kitchen-accessories');
              setState(() {
                currentIndex = 6;
              });
            },
            title: 'kitchen-accessories',
            isSelected: currentIndex == 6,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'laptops');
              setState(() {
                currentIndex = 7;
              });
            },
            title: 'laptops',
            isSelected: currentIndex == 7,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'mens-shoes');
              setState(() {
                currentIndex = 8;
              });
            },
            title: 'mens-shoes',
            isSelected: currentIndex == 8,
          ),
          SelectedAndUnSelectedCategoryItem(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).getProductsCategory(category: 'mens-watches');
              setState(() {
                currentIndex = 9;
              });
            },
            title: 'mens-watches',
            isSelected: currentIndex == 9,
          ),
        ],
      ),
    );
  }
}
