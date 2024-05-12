import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';
import 'package:warehouse/features/products/add_product/bloc/add_product_bloc.dart';

import '../../../features/products/add_product/models/qr_code_model.dart';
import '../../alert_dialogs/custom_alert_exit_scan.dart';
import 'widget/qr_scanner_overlay_shape.dart';

class ScanQRCodeView extends StatefulWidget {
  const ScanQRCodeView({
    super.key,
  });

  @override
  State<ScanQRCodeView> createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends State<ScanQRCodeView> {
  final bloc = KiwiContainer().resolve<AddProductBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (bloc.result != null) {
            bool? exit = await showDialog(
              context: context,
              builder: (context) {
                return CustomAlertExitScanCode(bloc: bloc);
              },
            );

            if (exit ?? false) {
              if (!context.mounted) return;
              Navigator.pop(context);
            }
          } else {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  MobileScanner(
                    // fit: BoxFit.contain,
                    controller: bloc.cameraController,
                    onDetect: (barcodes) {
                      if (!bloc.isScaned) {
                        bloc.result = barcodes.barcodes.first;
                        bloc.jsonData =
                            jsonDecode(bloc.result!.rawValue ?? "{}");
                        bloc.model = ProductData.fromJson(bloc.jsonData);
                        bloc.isScaned = true;
                        setState(() {});
                      }
                    },
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: QrScannerOverlayShape(
                          borderColor: Colors.green,
                          borderRadius: 0,
                          borderLength: 25.w,
                          borderWidth: 2,
                          cutOutSize: 250.w,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16).w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () =>
                                bloc.cameraController.toggleTorch(),
                            icon: ValueListenableBuilder(
                              valueListenable: bloc.cameraController.torchState,
                              builder: (context, value, child) {
                                switch (value) {
                                  case TorchState.off:
                                    return const Icon(
                                      Icons.flash_off,
                                      color: Colors.grey,
                                    );
                                  case TorchState.on:
                                    return const Icon(
                                      Icons.flash_on,
                                      color: Colors.yellow,
                                    );
                                }
                              },
                            ),
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () =>
                                bloc.cameraController.switchCamera(),
                            icon: ValueListenableBuilder(
                              valueListenable:
                                  bloc.cameraController.cameraFacingState,
                              builder: (context, value, child) {
                                switch (value) {
                                  case CameraFacing.front:
                                    return const Icon(
                                      Icons.photo_camera_front_outlined,
                                      color: mainColor,
                                    );
                                  case CameraFacing.back:
                                    return const Icon(
                                      Icons.photo_camera_back_outlined,
                                      color: Colors.grey,
                                    );
                                }
                              },
                            ),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  return Center(
                    child: bloc.result != null
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Scan QR Code Successfully",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                state is AddProductLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: CustomFilledButton(
                                          onPressed: () {
                                            bloc.add(AddProductEvent(
                                                isTextfield: false));
                                          },
                                          title: "Add Product",
                                        ),
                                      ),
                                TextButton(
                                  child: Text(
                                    "Clean Product Data!",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                    bloc.result = null;
                                    bloc.isScaned = false;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          )
                        : Text(
                            "Scan a Code",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
