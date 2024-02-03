import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/views/auth/widgets/custom_app_bar.dart';

import '../widgets/form_input_app.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ZoomIn(
        duration: const Duration(milliseconds: 1500),
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Warehouse',
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  "assets/images/test2.png",
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Login to continue using the app",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 18,
                ),
                const FormInputApp(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 202, 201, 201),
                        thickness: 1,
                        // Customize the divider thickness
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Login With",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: seColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 202, 201, 201),
                        thickness: 1,
                        // Customize the divider thickness
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f5),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffe5e6f2), // Outline color
                        width: 2.0, // Outline width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image.asset(
                        "assets/images/google_logo.png",
                        color: seColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(color: seColor, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
