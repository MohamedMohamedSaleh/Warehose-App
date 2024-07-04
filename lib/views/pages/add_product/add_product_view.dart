import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/views/pages/add_product/form_add_product_view.dart';
import 'package:warehouse/views/pages/add_product/scan_qr_view.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Add Product',
      ),
      body: ListView(
        children: const [
          _ItemQRCodeSend(
            isTextField: false,
          ),
          _ItemQRCodeSend(
            isTextField: true,
          ),
        ],
      ),
    );
  }
}

class _ItemQRCodeSend extends StatelessWidget {
  const _ItemQRCodeSend({required this.isTextField});
  final bool isTextField;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isTextField
            ? navigateTo(toPage: const FormAddProduct())
            : navigateTo(toPage: const ScanQRCodeView());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 26),
        padding: EdgeInsets.symmetric(vertical: 22.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20).w, color: Theme.of(context).primaryColor),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(
                isTextField
                    ? "assets/images/text_field.jpg"
                    : "assets/images/scan_code.png",
                fit: BoxFit.fill,
                height: 150.w,
                width: 150.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              isTextField
                  ? "Use Textfield To Add Product"
                  : "Scan QR Code To Add Product",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white /* Theme.of(context).primaryColor */,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
