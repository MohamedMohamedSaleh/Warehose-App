import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/logic/cache_helper.dart';

import '../../../../core/widgets/app_image.dart';

class CustomItemMyAccount extends StatelessWidget {
  const CustomItemMyAccount(
      {super.key,
      required this.title,
      this.icon,
      this.isLogout = false,
      this.isAcount = true,
      this.mainIcon});
  final String title;
  final String? icon;
  final bool isLogout;
  final bool isAcount;
  final Icon? mainIcon;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.03), blurRadius: 11),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Row(
          children: [
            isAcount
                ? AppImage(
                    'assets/images/$icon.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.scaleDown,
                    color: !isLogout
                        ? Colors.black.withOpacity(.5)
                        : Colors.black.withOpacity(.35),
                  )
                : mainIcon!,
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14, color: mainColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 3,
            ),
            !isAcount
                ? Text(
                    CacheHelper.getSupply() == '1'
                        ? "(supply 1)"
                        : "(supply 2)",
                    style: TextStyle(
                        fontSize: 12,
                        color: mainColor.withOpacity(.7),
                        fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppImage(
                !isLogout
                    ? 'assets/images/svg/line_arrow_acount.svg'
                    : 'assets/images/svg/line_arrow_acount.svg',
                height: 18,
                width: 18,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
