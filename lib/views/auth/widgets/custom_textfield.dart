import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.passwordIcon,
    required this.prefixIcon,
    this.controller,
  });

  final bool isPassword;
  final String labelText;
  final IconData? passwordIcon;
  final IconData prefixIcon;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHiden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType:
      // widget.isPassword ? TextInputType.text : TextInputType.number,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required!";
        } else {
          return null;
        }
      },

      controller: widget.controller,
      obscureText: isHiden && widget.isPassword,
      cursorHeight: 15,
      style: TextStyle(
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isHiden ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                onPressed: () {
                  isHiden = !isHiden;
                  setState(() {});
                },
              )
            : null,
        fillColor: const Color(0xfff1f1f5),
        filled: true,
        labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w100),
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11).w,
            borderSide: const BorderSide(color: Color(0xffe5e6f2), width: 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11).w,
        ),
      ),
    );
  }
}
