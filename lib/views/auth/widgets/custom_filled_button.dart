import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  const CustomFilledButton({super.key,required this.onPressed});
  final void Function()? onPressed;

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.onPressed,
      child: const Text(
        "Login",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
