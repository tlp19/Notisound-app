import 'package:flutter/material.dart';

Widget confusionMatrix() {
  return Container(
    margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(25, 0, 0, 0),
          offset: Offset(0, 2),
          blurRadius: 8,
        ),
      ],
    ),
    child: Table(
      border: null,
      children: [
        // 1st row
        TableRow(children: [
          cell(text: ""),
          cell(text: "Doorbell", weight: FontWeight.bold),
          cell(text: "Fire Alarm", weight: FontWeight.bold),
          cell(text: "Noise", weight: FontWeight.bold),
        ]),

        // 2nd row
        TableRow(children: [
          cell(text: "Doorbell", weight: FontWeight.bold),
          cell(text: "cell"),
          cell(text: "cell", color: Colors.grey),
          cell(text: "cell", color: Colors.grey),
        ]),

        // 3rd row
        TableRow(children: [
          cell(text: "Fire Alarm", weight: FontWeight.bold),
          cell(text: "cell", color: Colors.grey),
          cell(text: "cell"),
          cell(text: "cell", color: Colors.grey),
        ]),

        // 4th row
        TableRow(children: [
          cell(text: "Noise", weight: FontWeight.bold),
          cell(text: "cell", color: Colors.grey),
          cell(text: "cell", color: Colors.grey),
          cell(text: "cell"),
        ]),
      ],
    ),
  );
}

Widget cell({required String text, FontWeight? weight, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: weight, color: color),
    ),
  );
}
