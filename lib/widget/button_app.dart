import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const ButtonApp({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.blue,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
