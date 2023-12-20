import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/views/auth/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Warehouse',
      ),
      body: Center(
        child: FadeIn(
          delay: const Duration(milliseconds: 800),
          duration: const Duration(seconds: 1),
          child: Text(
            'Welcome to main page',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
