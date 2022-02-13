import 'package:flutter/material.dart';

Widget iconButton(
    {required IconData icon,
    required Color color,
    required Function onPressed}) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          icon,
          size: 40,
          color: Colors.white,
        )),
  );
}
