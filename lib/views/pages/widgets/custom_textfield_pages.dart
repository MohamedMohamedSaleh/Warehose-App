import 'package:flutter/material.dart';

class CustomTextFieldWithTitle extends StatefulWidget {
  const CustomTextFieldWithTitle({
    super.key,
    required this.labelText,
    this.controller,
    this.maxLins = 1,
    this.isCategory = false,
    this.validator,
    this.titelText,
    this.isText = true,
  });

  final String labelText;
  final TextEditingController? controller;
  final int maxLins;
  final bool isCategory;
  final String? Function(String?)? validator;
  final String? titelText;
  final bool isText;
  @override
  State<CustomTextFieldWithTitle> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isText
              ? Text(
                  widget.titelText ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
           const SizedBox(height: 2,),
          TextFormField(
             keyboardType:
             widget.isText ? TextInputType.text : TextInputType.phone,
            validator: widget.isCategory
                ? widget.validator
                : (value) {
                    if (value?.isEmpty ?? true) {
                      return "field is required!";
                    } else {
                      return null;
                    }
                  },
            controller: widget.controller,
            maxLines: widget.maxLins,
            cursorHeight: 20,
            style: const TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              fillColor: const Color(0xfff1f1f5),
              filled: true,
              hintText: widget.labelText,
              hintStyle: widget.isCategory && widget.labelText != "product type"
                  ? const TextStyle(
                      color: Colors.black,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(color: Color(0xffe5e6f2), width: 2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
