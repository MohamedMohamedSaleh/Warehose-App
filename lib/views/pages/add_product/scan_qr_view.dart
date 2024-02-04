import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';
import 'package:warehouse/views/pages/add_product/cubit/add_product_cubit.dart';

import 'models/qr_code_model.dart';

class ScanQRCodeView extends StatefulWidget {
  const ScanQRCodeView({
    super.key,
  });

  @override
  State<ScanQRCodeView> createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends State<ScanQRCodeView> {
  bool isD = false;
  late AddProductCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      cubit.controller!.pauseCamera();
    } else if (Platform.isIOS) {
      cubit.controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (cubit.result != null) {
          bool exit = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                actionsPadding: const EdgeInsets.only(bottom: 26, top: 8),
                actionsAlignment: MainAxisAlignment.center,
                shadowColor: Colors.white,
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                title: const Text(
                  "Are You Sure To Exit?",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
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
                      cubit.result = null;
                      cubit.isScaned = false;
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
              );
            },
          );

          return exit;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: QRView(
                overlay: QrScannerOverlayShape(
                  cutOutSize: 250,
                  borderWidth: 5,
                  borderLength: 30,
                  borderColor: Colors.green,
                ),
                key: cubit.qrKey,
                onQRViewCreated: onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 2,
              child: BlocBuilder<AddProductCubit, AddProductStates>(
                builder: (context, state) {
                  return Center(
                    child: cubit.result != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Scan QR Code Successfully",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                state is AddProductLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: CustomFilledButton(
                                          onPressed: () async {
                                            await cubit.addProduct(
                                                isTextfield: false);
                                            cubit.isScaned = false;
                                            cubit.result = null;
                                            if (!context.mounted) return;
                                            Navigator.pop(context);
                                          },
                                          title: "Add Product",
                                        ),
                                      ),
                                TextButton(
                                  child: const Text(
                                    "Clear Product Data",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    cubit.result = null;
                                    cubit.isScaned = false;
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
                                fontSize: 24,
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

  void onQRViewCreated(QRViewController controller) {
    cubit.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        if (!cubit.isScaned) {
          cubit.result = scanData;
          cubit.jsonData = jsonDecode(cubit.result!.code ?? "{}");
          cubit.model = ProductData.fromJson(cubit.jsonData);
          cubit.isScaned = true;

          setState(() {});
//navigate
        }
      },
    );
  }

  @override
  void dispose() {
    cubit.controller?.dispose();
    super.dispose();
  }
}
