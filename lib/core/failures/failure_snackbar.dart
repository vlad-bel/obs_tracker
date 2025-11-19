import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obs_tracker/core/failures/failures.dart';

void showErrorSnackbar({
  required Failure? error,
  required BuildContext context,
}) {
  if (error != null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final msg = error.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            msg,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
