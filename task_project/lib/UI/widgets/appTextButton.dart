import 'package:flutter/material.dart';

class AppTextButtonStyle extends StatelessWidget {
  const AppTextButtonStyle({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.green),
        )),
      ],
    );
  }
}