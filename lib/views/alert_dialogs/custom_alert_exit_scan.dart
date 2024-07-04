import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/products/add_product/bloc/add_product_bloc.dart';

class CustomAlertExitScanCode extends StatelessWidget {
  const CustomAlertExitScanCode({
    super.key,
    required this.bloc,
  });

  final AddProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)).w),
        actionsPadding: EdgeInsets.only(bottom: 26.h, top: 8.h),
        actionsAlignment: MainAxisAlignment.center,
        shadowColor: Colors.white,
        titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        title: Text(
          "Are You Sure To Exit?",
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 22.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "No",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          FilledButton(
            onPressed: () {
              bloc.result = null;
              bloc.isScaned = false;
              Navigator.of(context).pop(true);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
