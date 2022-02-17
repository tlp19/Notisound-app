import 'package:flutter/material.dart';

/// Custom transparent AppBar used in Scaffolds throughout the app
AppBar transparentAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 26,
    ),
  );
}
