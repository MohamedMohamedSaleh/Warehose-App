import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/main_page/main_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainPage(),
    );
  }
}
