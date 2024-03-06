import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Orders',
      ),
      body: Center(
        child: Text("OrdersPage"),
      ),
    );
  }
}
