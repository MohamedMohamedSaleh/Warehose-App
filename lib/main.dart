import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/core/kiwi.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/views/splash.dart';

import 'constants/my_colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Warehouse',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
            primarySwatch: getMaterialColor(),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                fixedSize: const Size(double.infinity, 50),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            fontFamily: 'Merriweather',
            appBarTheme: AppBarTheme(
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness:
                    Brightness.light, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              centerTitle: true,
              color: getMaterialColor(),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merriweather',
              ),
            )),
        home: const SplashView());
  }
}

MaterialColor getMaterialColor() {
  Color myColor = mainColor;
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
