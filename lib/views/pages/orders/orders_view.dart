import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/orders/widgets/custom_item_order.dart';
import 'package:warehouse/views/pages/orders/widgets/custom_tab_bar.dart';

import '../../../core/widgets/custom_app_bar.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.index = 0;
    setState(() {
      
    });
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: 'Orders',
            bottom: CustomTabBar(
              controller: controller,
            ),
            height: 120,
          ),
          body: TabBarView(controller: controller, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const CustomItemOrder(),
                itemCount: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const CustomItemOrder(),
                itemCount: 5,
              ),
            ),
          ])),
    );
  }
}
