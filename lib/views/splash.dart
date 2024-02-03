import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/main.dart';
import 'package:warehouse/views/auth/login/login_view.dart';
import 'package:warehouse/views/pages/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  CircleAvatar blur() {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(.04),
      radius: 25,
    );
  }

  @override
  void initState() {
    super.initState();
    moveTo();
  }

  void moveTo() async {
    Timer(
      const Duration(seconds: 4),
      () {
        navigateTo(
          toPage: ((prefs.getString('token') ?? "").isEmpty)
              ? const LoginView()
              : const HomePage(),
          dontRemove: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          top: screenHeight / 2 - 130,
          child: JelloIn(
            delay: const Duration(seconds: 2),
            duration: const Duration(seconds: 1),
            child: FadeIn(
              delay: const Duration(seconds: 2),
              duration: const Duration(seconds: 1),
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                          toPage: ((prefs.getString('token') ?? "").isEmpty)
                              ? const LoginView()
                              : const HomePage(),
                          dontRemove: true,
                        );
                      },
                      child: Text(
                        "Welcome to Warehouse",
                        style: TextStyle(
                            fontSize: 26,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(top: 344, right: 166, child: blur()),
        Positioned(top: 300, right: 100, child: blur()),
        Center(
          child: JelloIn(
            delay: const Duration(seconds: 1),
            duration: const Duration(seconds: 2),
            child: FadeIn(
              delay: const Duration(seconds: 1),
              duration: const Duration(seconds: 2),
              child: ZoomIn(
                delay: const Duration(seconds: 1),
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/robot.png',
                  height: 225,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ),
        Positioned(top: 10, bottom: 200, child: blur()),
        Positioned(top: 250, right: 35, child: blur()),
        Positioned(top: 55, right: 50, child: blur()),
        Positioned(top: 60, right: 200, child: blur()),
        Positioned(top: 12, right: 100, child: blur()),
        Positioned(top: 100, right: 120, child: blur()),
        Positioned(top: 200, right: 100, child: blur()),
        Positioned(top: 150, right: 200, child: blur()),
        Positioned(top: 100, left: -20, child: blur()),
        Positioned(top: 110, right: -15, child: blur()),
        Positioned(top: 180, right: 10, child: blur()),
        Positioned(top: 220, left: 100, child: blur()),
        Positioned(top: 20, left: 5, child: blur()),
        Positioned(bottom: 12, right: 100, child: blur()),
        Positioned(bottom: 100, right: 100, child: blur()),
        Positioned(bottom: 200, right: 100, child: blur()),
        Positioned(bottom: 150, right: 200, child: blur()),
        Positioned(bottom: 100, left: -20, child: blur()),
        Positioned(bottom: 110, right: -15, child: blur()),
        Positioned(bottom: 180, right: 10, child: blur()),
        Positioned(bottom: 220, left: 100, child: blur()),
        Positioned(bottom: 20, left: 5, child: blur()),
        Positioned(bottom: 250, left: 5, child: blur()),
        Positioned(bottom: 30, left: 250, child: blur()),
        Positioned(bottom: 340, left: -15, child: blur()),
        Positioned(bottom: 270, left: 255, child: blur()),
        Positioned(bottom: 80, left: 70, child: blur()),
      ]),
    );
  }
}
