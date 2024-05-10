import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key, required this.controller,
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
      padding: const EdgeInsetsDirectional.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF3F3F3),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: TabBar(
            controller: widget.controller,
            padding: const EdgeInsets.only(bottom: 6, top: 6),
            indicatorPadding: const EdgeInsets.fromLTRB(-45, 0, -45, 0),
            unselectedLabelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xffA2A1A4),
            // indicatorPadding: EdgeInsets.,
            labelStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: mainColor),
            tabs: const [
              Tab(
                height: 40,
                child: Text('Add'),
              ),
              Tab(
                height: 40,
                child: Text('Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
