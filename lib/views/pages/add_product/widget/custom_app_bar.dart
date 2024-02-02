import 'package:flutter/material.dart';

class CustomAppBarAddProduct extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      elevation: 2,
      backgroundColor: Colors.white,
      title: Text(
        "Add Product",
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
