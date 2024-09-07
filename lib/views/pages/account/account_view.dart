import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/views/pages/account/screens/about_app_view.dart';
import 'package:warehouse/views/pages/account/screens/personal_info.dart';
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
  final bloc = KiwiContainer().resolve<LogoutBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            physics: const PageScrollPhysics(),
            children: [
              const _CustomAppBarAccount(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        navigateTo(toPage: const PersonalInfoView());
                      },
                      child: const CustomItemMyAccount(
                          title: 'Personal Info', icon: 'account'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () => navigateTo(toPage: const SettingsPage()),
                      child: const CustomItemMyAccount(
                          title: 'Settings', icon: 'settings'),
                    ),
                    const SizedBox(
                      height: 16,
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
                      child: const CustomItemMyAccount(
                          title: 'Theme', icon: 'theme'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => navigateTo(toPage: const AboutAppView()),
                      child: const CustomItemMyAccount(
                        title: "About App",
                        icon: "about_app",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        bloc.add(LogoutEvent());
                      },
                      child: BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (state is LogoutLoading) {
                            return const Center(
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          return const CustomItemMyAccount(
                            title: 'Logout',
                            icon: 'logout',
                            isLogout: true,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} /* 

Our Mobile Application was part of my bacheloer degree graduation project. The application works as 
the interface for the project 

*/
//

class _CustomAppBarAccount extends StatefulWidget {
  const _CustomAppBarAccount();

  @override
  State<_CustomAppBarAccount> createState() => _CustomAppBarAccountState();
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
            ColoredBox(
              color: Theme.of(context).primaryColor,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      'my account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15).w,
                        child: Hero(
                          tag: "11",
                          child: GestureDetector(
                            onTap: () =>
                                navigateTo(toPage: const PersonalInfoView()),
                            child: AppImage(
                              CacheHelper.getUserId() == "1" ? "assets/images/my_image.jpg":
                                  "assets/images/image_man.png",
                              height: 70,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${CacheHelper.getUsername()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
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
