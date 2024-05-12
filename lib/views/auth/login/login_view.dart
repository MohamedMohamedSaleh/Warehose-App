import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/constants/my_colors.dart';

import '../../../core/widgets/custom_app_bar.dart';
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
                const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16)
                    .r,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Image.asset(
                    "assets/images/test2.png",
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Login to continue using the app",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  const FormInputApp(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 202, 201, 201),
                          thickness: 1,
                          // Customize the divider thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: seColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 202, 201, 201),
                          thickness: 1,
                          // Customize the divider thickness
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: const Color(0xfff1f1f5),
                        borderRadius: BorderRadius.circular(25).w,
                        border: Border.all(
                          color: const Color(0xffe5e6f2), // Outline color
                          width: 2.0, // Outline width
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Image.asset(
                          "assets/images/google_logo.png",
                          color: seColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(color: seColor, fontSize: 15.sp),
                      ),
                    ],
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
