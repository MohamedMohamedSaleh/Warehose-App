import 'package:flutter/material.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Notifications', isAcount: true,),
      body: Center(
        child: Text('NotificationsView'),
      ),
    );
  }
}
