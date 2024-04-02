import 'package:flutter/material.dart';

class ScanQRCodeView extends StatelessWidget {
  const ScanQRCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kiwi/kiwi.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:warehouse/constants/my_colors.dart';
// import 'package:warehouse/core/widgets/custom_filled_button.dart';
// import 'package:warehouse/features/add_product/bloc/add_product_bloc.dart';

// import '../../../features/add_product/models/qr_code_model.dart';

// class ScanQRCodeView extends StatefulWidget {
//   const ScanQRCodeView({
//     super.key,
//   });

//   @override
//   State<ScanQRCodeView> createState() => _ScanQRCodeViewState();
// }

// class _ScanQRCodeViewState extends State<ScanQRCodeView> {
//   final bloc = KiwiContainer().resolve<AddProductBloc>();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       bloc.controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       bloc.controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (bloc.result != null) {
//           bool exit = await showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 actionsPadding: const EdgeInsets.only(bottom: 26, top: 8),
//                 actionsAlignment: MainAxisAlignment.center,
//                 shadowColor: Colors.white,
//                 titlePadding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//                 title: const Text(
//                   "Are You Sure To Exit?",
//                   style: TextStyle(
//                       color: mainColor,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 actions: [
//                   FilledButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(false);
//                     },
//                     child: const Text(
//                       "No",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   FilledButton(
//                     onPressed: () {
//                       bloc.result = null;
//                       bloc.isScaned = false;
//                       Navigator.of(context).pop(true);
//                     },
//                     child: const Text(
//                       "Yes",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );

//           return exit;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               flex: 6,
//               child: QRView(
//                 overlay: QrScannerOverlayShape(
//                   cutOutSize: 250,
//                   borderWidth: 5,
//                   borderLength: 30,
//                   borderColor: Colors.green,
//                 ),
//                 key: bloc.qrKey,
//                 onQRViewCreated: onQRViewCreated,
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: BlocBuilder(
//                 bloc: bloc,
//                 builder: (context, state) {
//                   return Center(
//                     child: bloc.result != null
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Scan QR Code Successfully",
//                                   style: TextStyle(
//                                       color: Theme.of(context).primaryColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(
//                                   height: 12,
//                                 ),
//                                 state is AddProductLoadingState
//                                     ? const Center(
//                                         child: CircularProgressIndicator(),
//                                       )
//                                     : SizedBox(
//                                         width: double.infinity,
//                                         child: CustomFilledButton(
//                                           onPressed: () {
//                                             bloc.add(AddProductEvent(isTextfield: false));
                                           
//                                           },
//                                           title: "Add Product",
//                                         ),
//                                       ),
//                                 TextButton(
//                                   child: const Text(
//                                     "Clean Product Data!",
//                                     style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   onPressed: () {
//                                     bloc.result = null;
//                                     bloc.isScaned = false;
//                                     setState(() {});
//                                   },
//                                 ),
//                               ],
//                             ),
//                           )
//                         : Text(
//                             "Scan a Code",
//                             style: TextStyle(
//                                 color: Theme.of(context).primaryColor,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void onQRViewCreated(QRViewController controller) {
//     bloc.controller = controller;
//     controller.scannedDataStream.listen(
//       (scanData) {
//         if (!bloc.isScaned) {
//           bloc.result = scanData;
//           bloc.jsonData = jsonDecode(bloc.result!.code ?? "{}");
//           bloc.model = ProductData.fromJson(bloc.jsonData);
//           bloc.isScaned = true;

//           setState(() {});
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     bloc.controller?.dispose();
//     super.dispose();
//   }
// }
