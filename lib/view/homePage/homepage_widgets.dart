import 'package:flutter/material.dart';

Widget iconButton({required IconData icon, required Function onPressed}) {
  return Container(
    height: 60,
    width: 60,
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 188, 194, 209),
        borderRadius: BorderRadius.all(Radius.circular(50))),
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
