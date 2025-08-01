import 'package:discover/features/account/presentation/views/account_view.dart';
import 'package:discover/features/cart/presentation/views/cart_view.dart';
import 'package:discover/features/home/presentation/views/home_view.dart';
import 'package:discover/features/main/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  List<Widget> views = [
    const HomeView(),
    const CartView(),
    const AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}
