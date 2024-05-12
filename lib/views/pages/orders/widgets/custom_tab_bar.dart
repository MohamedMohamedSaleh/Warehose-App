import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/constants/my_colors.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.controller,
  });
  final TabController controller;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(40);
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 15.h),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 4).r,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF3F3F3),
              ),
              borderRadius: BorderRadius.circular(10).w),
          child: TabBar(
            controller: widget.controller,
            padding: const EdgeInsets.only(bottom: 6, top: 6).r,
            indicatorPadding: const EdgeInsets.fromLTRB(-45, 0, -45, 0).r,
            unselectedLabelStyle:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xffA2A1A4),
            // indicatorPadding: EdgeInsets.,
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12).w, color: mainColor),
            tabs: [
              Tab(
                height: 40.h,
                child: const Text('Add'),
              ),
              Tab(
                height: 40.h,
                child: const Text('Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
