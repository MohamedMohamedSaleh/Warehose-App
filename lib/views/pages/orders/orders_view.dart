import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/orders/widgets/custom_item_order.dart';
import 'package:warehouse/views/pages/orders/widgets/custom_tab_bar.dart';

import '../../../core/widgets/custom_app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const CustomAppBar(
            title: 'Orders',
            bottom: CustomTabBar(),
            height: 120,
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const CustomItemOrder(),
                itemCount: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => CustomItemOrder(),
                itemCount: 15,
              ),
            ),
          ])),
    );
  }
}
