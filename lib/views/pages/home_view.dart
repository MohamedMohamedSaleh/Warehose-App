import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/add_product/add_product_view.dart';
import 'package:warehouse/views/pages/main/main_view.dart';
import 'package:warehouse/views/pages/notification/notification_view.dart';
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
    const NotificationsPage(),
  ];

  List<String> icons = [
    'main',
    'add_product',
    'take_product',
    'account',
  ];

  List<String> leble = [
    'main',
    'add product',
    'take product',
    'my account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
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
    );
  }
}
