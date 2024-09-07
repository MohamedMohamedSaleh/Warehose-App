import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/views/alert_dialogs/select_supply_view.dart';
import 'package:warehouse/views/pages/account/widgets/custom_item_acount.dart';

import '../../../../core/logic/cache_helper.dart';
import '../../../../core/widgets/app_image.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeIn(
        duration: const Duration(milliseconds: 200),
        child: Scaffold(
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: AppImage(
                          CacheHelper.getIsDark() == true
                              ? "assets/images/smile_face_black.png"
                              : 'assets/images/smile_face.png',
                          width: 250,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Enter more settings',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
