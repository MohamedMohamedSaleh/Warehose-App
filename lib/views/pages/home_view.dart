import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/account/account_view.dart';
import 'package:warehouse/views/pages/add_product/add_product_view.dart';
import 'package:warehouse/views/pages/main/main_view.dart';
import 'package:warehouse/views/pages/settings_view/settings_view.dart';
import 'package:warehouse/views/pages/take_product/take_product_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const AddProductPage(),
    const TakeProductPage(),
    const SettingsPage(),
    const AccountPage(),
  ];

  List<String> icons = [
    'main',
    'add_product',
    'take_product',
    'settings',
    'account',
  ];

  List<String> leble = [
    'main',
    'add',
    'take',
    'settings',
    'account',
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ZoomIn(
        duration: const Duration(milliseconds: 1500),
        child: Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: SafeArea(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color.fromARGB(140, 255, 255, 255),
                currentIndex: currentIndex,
                elevation: 10,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                items: List.generate(
                  pages.length,
                  (index) => BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/${icons[index]}.png',
                      height: (currentIndex == index) ? 24 : 22,
                      color: (currentIndex == index)
                          ? Colors.white
                          : const Color.fromARGB(140, 255, 255, 255),
                    ),
                    label: leble[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
