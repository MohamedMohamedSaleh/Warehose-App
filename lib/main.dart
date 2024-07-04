import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/kiwi.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/notiffications/notifications_cubit.dart';
import 'package:warehouse/features/themes/themes_bloc.dart';
import 'package:warehouse/firebase_api.dart';
import 'package:warehouse/themes.dart';
import 'package:warehouse/views/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/my_colors.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseApi.initNOti();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(
          myColor: CacheHelper.getIsDark() == true
              ? mainColorBlack
              : mainColorOrange),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

//token app =>    7412ca7e-6f89-47fa-a8ca-c182e7ad78df

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? myToken;
  void getToken() async {
    await FirebaseMessaging.instance.getToken();
  }

  final bloc = KiwiContainer().resolve<ThemesBloc>();
  @override
  void initState() {
    super.initState();
    getToken();
    KiwiContainer().resolve<NotificationsCubit>().getNoti();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(330, 700),
      builder: (context, child) => BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Warehouse',
            themeMode: state as ThemeMode,
            darkTheme: MyThemes.dartTheme,
            theme: MyThemes.deepTheme,
            home: child,
          );
        },
      ),
      child: const SplashView(),
    );
  }
}

MaterialColor getMaterialColor({required Color myColor}) {
  // Color myColor = mainColor;
  return MaterialColor(
    myColor.value,
    {
      50: myColor.withOpacity(.1),
      100: myColor.withOpacity(.2),
      200: myColor.withOpacity(.3),
      300: myColor.withOpacity(.4),
      400: myColor.withOpacity(.5),
      500: myColor.withOpacity(.6),
      600: myColor.withOpacity(.7),
      700: myColor.withOpacity(.8),
      800: myColor.withOpacity(.9),
      900: myColor,
    },
  );
}

// d0pzeAnWRhC37Kqd-3KIUc:APA91bGyw_qtBgmp08BWo1wyfFwCFKKURdYMd1u4oEKq39OLqD-0nKBcD4gWWa0hj6ElCS8OitwzgqI1D-pvREYG8LMkaA40h-e5zr4x76_cvRKtqUIeLCwynaqJWRd9mxprpQu7xp28