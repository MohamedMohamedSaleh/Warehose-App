import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/features/notiffications/notifications_cubit.dart';
import 'package:warehouse/views/pages/account/account_view.dart';
import 'package:warehouse/views/pages/add_product/add_product_view.dart';
import 'package:warehouse/views/pages/main/main_view.dart';
import 'package:warehouse/views/pages/notifications_view.dart';
import 'package:warehouse/views/pages/orders/orders_view.dart';
import 'package:warehouse/views/pages/request_product/request_product_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = KiwiContainer().resolve<NotificationsCubit>();

  int currentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const AddProductPage(),
    const RequestProductPage(),
    const OrdersPage(),
    const AccountPage(),
  ];

  List<String> icons = [
    'main.png',
    'add_product.png',
    'take_product.png',
    'svg/my_orders.svg',
    'account.png',
  ];

  List<String> leble = [
    'main',
    'add',
    'Request',
    'orders',
    'account',
  ];

  @override
  void initState() {
    super.initState();
    onMessageOpenedApp();
  }

  void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        KiwiContainer().resolve<NotificationsCubit>().addNoti(
            title: message.notification!.title!,
            body: message.notification!.body!);
        if (message.notification != null) {
          navigateTo(toPage: const NotificationsView());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (currentIndex != 0) {
            currentIndex = 0;
            setState(() {});
          } else {
            SystemNavigator.pop();
          }
        }
      },
      canPop: false,
      child: ColoredBox(
        color: Colors.white,
        child: ZoomIn(
          duration: const Duration(milliseconds: 1500),
          child: Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(140, 255, 255, 255),
                  currentIndex: currentIndex,
                  elevation: 10,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    currentIndex = value;
                    if (!mounted) return;
                    setState(() {});
                  },
                  items: List.generate(
                    pages.length,
                    (index) => BottomNavigationBarItem(
                      icon: AppImage(
                        'assets/images/${icons[index]}',
                        height: (currentIndex == index) ? 24 : 22,
                        color: (currentIndex == index)
                            ? Colors.white
                            : const Color.fromARGB(140, 255, 255, 255),
                      ),
                      label: leble[index],
                    ),
                  ),
                ),
              ),
            ),
            // there are error when i navigate from tab bar screens
            floatingActionButton: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetNotificationSuccessState ||
                    state is OpenedNotificationSuccessState) {
                  return Badge(
                    isLabelVisible: !bloc.isOpen,
                    largeSize: 15,
                    smallSize: 15,
                    label: Text(bloc.numNoti.toString()),
                    backgroundColor: Colors.red,
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                        onPressed: () {
                          navigateTo(toPage: const NotificationsView());
                        },
                        child: const AppImage(
                          'assets/images/notifications.png',
                          height: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
                return Badge(
                  isLabelVisible: !bloc.isOpen,
                  largeSize: 15,
                  smallSize: 15,
                  label: Text(bloc.numNoti.toString()),
                  backgroundColor: Colors.red,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: FloatingActionButton(
                      onPressed: () {
                        navigateTo(toPage: const NotificationsView());
                      },
                      child: const AppImage(
                        'assets/images/notifications.png',
                        height: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
