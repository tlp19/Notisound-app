import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../general_widgets.dart';
import 'bar_char.dart';
import 'confusion_matrix.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Text(
                  "Confusion matrix:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              confusionMatrix(),
              const SizedBox(
                height: 48,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Text(
                  "Analytics:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              AnalyticsBarChart(
                label: "Doorbell alerts in the past months:",
                category: "Doorbell",
                isar: isar,
                colorProfile: const [
                  Colors.lightBlueAccent,
                  Colors.greenAccent
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              AnalyticsBarChart(
                  label: "Fire Alarm alerts in the past months:",
                  category: "Fire Alarm",
                  isar: isar,
                  colorProfile: const [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
