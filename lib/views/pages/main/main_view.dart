import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/views/auth/logout/logout_bloc.dart';

import '../../../core/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Warehouse',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
          const SizedBox(
            height: 26,
          ),
          FadeIn(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(seconds: 1),
            child: SizedBox(
              height: 45,
              width: 250,
              child: FilledButton(
                  onPressed: () {
                    KiwiContainer().resolve<LogoutBloc>().add(LogoutEvent());
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
