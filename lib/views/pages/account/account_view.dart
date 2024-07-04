import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/views/pages/account/screens/settings_view.dart';

import '../../auth/logout/logout_bloc.dart';
import 'widgets/custom_alert_dialog.dart';
import 'widgets/custom_item_acount.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const PageScrollPhysics(),
        children: [
          const _CustomAppBarAccount(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22).r,
            child: Column(
              children: [
                const CustomItemMyAccount(
                    title: 'Personal Info', icon: 'account'),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () => navigateTo(toPage: const SettingsPage()),
                  child: const CustomItemMyAccount(
                      title: 'Settings', icon: 'settings'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(
                      
                      context: context,
                      builder: (context) => const CustomAlertDialog(),
                    ).then(
                      (value) => setState(() {}),
                    );
                    setState(() {});
                  },
                  child:
                      const CustomItemMyAccount(title: 'Theme', icon: 'theme'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    KiwiContainer().resolve<LogoutBloc>().add(LogoutEvent());
                  },
                  child: const CustomItemMyAccount(
                    title: 'Logout',
                    icon: 'logout',
                    isLogout: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarAccount extends StatefulWidget
    implements PreferredSizeWidget {
  const _CustomAppBarAccount();

  @override
  State<_CustomAppBarAccount> createState() => _CustomAppBarAccountState();

  @override
  Size get preferredSize => const Size.fromHeight(210);
}

class _CustomAppBarAccountState extends State<_CustomAppBarAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(40).w,
            bottomRight: const Radius.circular(40).w),
        child: Stack(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 210,
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              title: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'my account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15).w,
                    child: AppImage(
                      'assets/images/man.jpg',
                      height: 70.w,
                      width: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${CacheHelper.getUsername()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -55,
              right: -100,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: -70,
              left: -110,
              child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -80,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              bottom: -40,
              right: -60,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
