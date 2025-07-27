import 'package:discover/features/home/presentation/widgets/select_and_unselect_product_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SelectedAndUnSelectedCategoryItem(title: 'All', isSelected: false),
          SelectedAndUnSelectedCategoryItem(title: 'Tshirts', isSelected: true),
          SelectedAndUnSelectedCategoryItem(title: 'Shoes', isSelected: false),
          SelectedAndUnSelectedCategoryItem(title: 'Jeans', isSelected: false),
          SelectedAndUnSelectedCategoryItem(
            title: 'Jackets',
            isSelected: false,
          ),
          SelectedAndUnSelectedCategoryItem(
            title: 'Accessories',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
