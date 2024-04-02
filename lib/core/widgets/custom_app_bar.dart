import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.thereIsIcon = true,
    this.bottom,
    this.height = 55,
    this.isAcount = false,
  });
  final String title;
  final bool thereIsIcon;
  final PreferredSizeWidget? bottom;
  final double height;
  final bool isAcount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Hero(
            tag: isAcount ? 'hero' : 'not',
            child: AppBar(
              forceMaterialTransparency: true,
              iconTheme: const IconThemeData(color: mainColor, size: 22),
              // elevation: 2,
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              bottom: bottom,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
