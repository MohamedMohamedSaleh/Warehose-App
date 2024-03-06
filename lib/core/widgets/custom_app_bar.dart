import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.thereIsIcon = true,
    this.bottom,
    this.height = 55,
  });
  final String title;
  final bool thereIsIcon;
  final PreferredSizeWidget? bottom;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AppBar(
            iconTheme: const IconThemeData(color: mainColor, size: 22),
            elevation: 2,
            backgroundColor: Colors.white,
            // leading: const Icon(
            //   Icons.arrow_back_ios_rounded,
            //   color: mainColor,
            //   size: 22,
            // ),
            // automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                title,
                style: const TextStyle(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            bottom: bottom,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
