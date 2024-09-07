import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        borderRadius: BorderRadius.circular(11).w,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.03), blurRadius: 11),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        child: Row(
          children: [
            isAcount
                ? AppImage(
                    'assets/images/$icon.png',
                    height: 18.w,
                    width: 18.w,
                    fit: BoxFit.scaleDown,
                    color: Theme.of(context).primaryColor,
                  )
                : mainIcon!,
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
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
                        color: Theme.of(context).primaryColor.withOpacity(.7),
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
                height: 18.w,
                width: 18.w,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
