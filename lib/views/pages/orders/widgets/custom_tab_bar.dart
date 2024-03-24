import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
  });

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
            padding: const EdgeInsets.all(6),
            indicatorPadding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            unselectedLabelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xffA2A1A4),
            // indicatorPadding: EdgeInsets.,
            labelStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor),
            tabs: const [
              Tab(
                height: 40,
                child: Text('add'),
              ),
              Tab(
                height: 40,
                child: Text('take'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
