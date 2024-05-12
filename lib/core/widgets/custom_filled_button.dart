import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.fontSize = 18,
    this.radias = 12,
    this.paddingBottom = 15,
  });
  final void Function()? onPressed;
  final String title;
  final double fontSize;
  final double radias;
  final double paddingBottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
          fixedSize: Size(double.infinity, 45.h),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radias).w,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
