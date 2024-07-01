import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/views/pages/orders/errors_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.thereIsIcon = true,
    this.bottom,
    this.height = 60,
    this.isAcount = false,
    this.isOrder = false,
  });
  final String title;
  final bool thereIsIcon;
  final PreferredSizeWidget? bottom;
  final double height;
  final bool isAcount;
  final bool isOrder;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: mainColor, ),
            forceMaterialTransparency: true,
            iconTheme: const IconThemeData(color: mainColor, size: 22),
            // elevation: 2,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                title,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: isOrder
                ? [
                    GestureDetector(
                      onTap: () {
                        navigateTo(toPage: const ErrorsView());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16, top: 14, bottom: 0),
                        child: Icon(
                          Icons.error_outlined,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                    ),
                  ]
                : null,
            bottom: bottom,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
