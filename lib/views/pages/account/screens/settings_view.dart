import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/views/alert_dialogs/select_supply_view.dart';
import 'package:warehouse/views/pages/account/widgets/custom_item_acount.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
        isAcount: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            InkWell(
              onTap: () async => await showDialog(
                context: context,
                builder: (context) => const SelectSupplyView(
                  title: 'Save',
                  isLogin: false,
                ),
              ).then((value) {
                if (value == true) {
                  setState(() {});
                }
              }),
              child: CustomItemMyAccount(
                isAcount: false,
                title: 'Sellect Supplier',
                mainIcon: Icon(
                  Icons.check_box_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
