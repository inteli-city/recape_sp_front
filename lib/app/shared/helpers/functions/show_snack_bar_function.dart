import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {Duration duration = const Duration(seconds: 3)}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: duration,
    ),
  );
}
