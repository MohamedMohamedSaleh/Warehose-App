import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/features/orders/orders_bloc.dart';
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
    setState(() {});
  }

  final bloc = KiwiContainer().resolve<OrdersBloc>()..add(GetOrdersEvent());
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              isOrder: true,
              title: 'Orders',
              bottom: CustomTabBar(
                controller: controller,
              ),
              height: 120,
            ),
            body: TabBarView(controller: controller, children: [
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetOrdersLoading || state is OrdersInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (bloc.putList.isEmpty) {
                    //TODO: this is handle empty list
                    return Center(
                      child: Text(
                        'no Data',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0).w,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => CustomItemOrder(
                          model: bloc.putList[index],
                        ),
                        itemCount: bloc.putList.length,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetOrdersLoading || state is OrdersInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (bloc.requestList.isEmpty) {
                    //TODO: this is handle empty list
                    return Center(
                      child: Text(
                        'no Data',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0).w,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => CustomItemOrder(
                          model: bloc.requestList[index],
                        ),
                        itemCount: bloc.requestList.length,
                      ),
                    );
                  }
                },
              ),
            ])),
      ),
    );
  }
}
