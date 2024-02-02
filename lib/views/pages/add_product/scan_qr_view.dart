import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_mothods.dart';
import '../../../main.dart';
import 'models/qr_code_model.dart';

class ScanQRCodeView extends StatefulWidget {
  const ScanQRCodeView({super.key});

  @override
  State<ScanQRCodeView> createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends State<ScanQRCodeView> {
  late Map<String, dynamic> jsonData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isScaned = false;
  late ProductData model;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  final idUser = prefs.getInt('id');
  final tokenUser = prefs.getString('token');
  bool isLoading = false;
  void addProduct() async {
    isLoading = true;
    setState(() {});
    DioHelper controller = DioHelper();
    var message = await controller.sendData(
      endPoint: 'MP_AddProducts',
      data: {
        'token': tokenUser,
        'userid': idUser,
        'ProductID': model.id,
        'Name': model.name,
        'Description': model.description,
        'Category': model.category,
        'Weight': model.weight,
        'Dimensions': model.dimensions,
      },
    );
    if (message.isSuccess) {
      showMessage(message: message.message, type: MessageType.success);
    } else {
      showMessage(
        message: message.message,
      );
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: result != null
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
                          SizedBox(
                            width: double.infinity,
                            child: CustomFilledButton(
                                onPressed: () {
                                  addProduct();
                                  Navigator.pop(context);
                                },
                                title: "Add Product"),
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
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        if (!_isScaned) {
          result = scanData;
          jsonData = jsonDecode(result!.code ?? "{}");
          model = ProductData.fromJson(jsonData);
          _isScaned = true;
          setState(() {});
//navigate
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
