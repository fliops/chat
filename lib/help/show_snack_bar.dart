import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('weak password'),
    ),
  );
}
