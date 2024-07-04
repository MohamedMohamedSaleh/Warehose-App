import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/features/themes/themes_bloc.dart';

import '../../../../constants/my_colors.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final bloc = KiwiContainer().resolve<ThemesBloc>();
  late bool isDark;
  @override
  void initState() {
    super.initState();
    isDark = CacheHelper.getIsDark() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        title: const Align(
            alignment: Alignment.center, child: Text('Choose your Theme')),
        titleTextStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: () {
                  bloc.add(ChangeThemesEvent(isDark: true));
                  SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                    statusBarColor: mainColorBlack,
                    statusBarIconBrightness: Brightness.light,
                  ));
                  isDark = true;
                  setState(() {});
                },
                child: ItemColor(
                    color: mainColorBlack,
                    title: "Dark Mode.",
                    isDark: isDark ? true : false)),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                bloc.add(ChangeThemesEvent(isDark: false));
                SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                  statusBarColor: mainColorOrange,
                  statusBarIconBrightness: Brightness.light,
                ));
                isDark = false;
                setState(() {});
              },
              child: SizedBox(
                width: double.infinity,
                child: ItemColor(
                    color: mainColorOrange,
                    title: "Light Mode.",
                    isDark: isDark ? false : true),
              ),
            ),
          ],
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        actions: [
          SizedBox(
            height: 35,
            child: FilledButton(
                style: FilledButton.styleFrom(padding: const EdgeInsets.all(8)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class ColorState extends ChangeNotifier {
  Color _selectedColor = Colors.blue; // Initial color

  Color get selectedColor => _selectedColor;

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners(); // Notify all listeners of the change
  }
}

class ItemColor extends StatefulWidget {
  const ItemColor(
      {super.key,
      required this.color,
      required this.title,
      required this.isDark});
  final Color color;
  final String title;
  final bool isDark;

  @override
  State<ItemColor> createState() => _ItemColorState();
}

class _ItemColorState extends State<ItemColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AbsorbPointer(
          absorbing: true,
          child: Checkbox(
            visualDensity: const VisualDensity(horizontal: -4),
            focusColor: widget.color,
            hoverColor: widget.color,
            checkColor: Colors.white,
            activeColor: widget.color,
            value: widget.isDark,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: widget.color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
