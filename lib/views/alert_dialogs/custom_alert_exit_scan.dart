
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../features/add_product/bloc/add_product_bloc.dart';

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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        actionsPadding: const EdgeInsets.only(bottom: 26, top: 8),
        actionsAlignment: MainAxisAlignment.center,
        shadowColor: Colors.white,
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        title: const Text(
          "Are You Sure To Exit?",
          style: TextStyle(
              color: mainColor, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "No",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          FilledButton(
            onPressed: () {
              bloc.result = null;
              bloc.isScaned = false;
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
