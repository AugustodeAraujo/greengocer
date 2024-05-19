import 'package:flutter/material.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/views/cart/cart_tab.dart';
import 'package:greengrocer/src/views/home/home_tab.dart';
import 'package:greengrocer/src/views/order/order_tab.dart';
import 'package:greengrocer/src/views/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          CartTab(),
          OrderTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              label: "Carrinho"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pedidos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
        ],
      ),
    );
  }
}
