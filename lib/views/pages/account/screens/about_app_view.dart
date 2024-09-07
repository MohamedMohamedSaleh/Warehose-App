import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: const Scaffold(
          appBar: CustomAppBar(title: "About App"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppImage(
                    "assets/images/robot.png",
                    height: 150,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    "This Mobile Application is a part of our graduation project ( Warehouse Automation Through Mobile Robotics ).We use the application to request a product from the warehouse or to request a product to supply to the warehouse. Also , We have the feature of real time tracking of the robots in the warehouse executing the orders and status of each request done to the robots. Me , Mohammed Saleh I developed this application using Flutter Connected to the cloud server and IoT Technology done by Mahmoud Sherif and Esraa Elmekawy.Which In order communicates with the Embedded System of the  robot done by Moner Mohammed, Hisham Yonis and Abdullah Salah Where the robot mechanical parts and structure assembled and done by Noor Galal and Osama Gamal.Special Thanks to my team for their time and effort.",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600, height: 1.6),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
