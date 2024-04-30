import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.child = const Icon(
      Icons.arrow_back_ios_rounded,
      size: 20,
      textDirection: TextDirection.rtl,
      color: Color(0xff4C8613),
    ),
    this.isBack = true,
    this.height = 30,
    this.width = 30,
    this.color,
    this.onTap,
  });
  final Widget child;
  final bool isBack;
  final double height;
  final double width;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isBack
          ? () {
              Navigator.pop(context, true);
            }
          : onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isBack ? 9 : 7),
          color: color ?? const Color(0xff4C8613).withOpacity(0.13),
        ),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
