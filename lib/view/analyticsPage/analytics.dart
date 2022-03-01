import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../general_widgets.dart';
import 'bar_char.dart';
import 'confusion_matrix.dart';

/// A page that displays detailed information about the usage of the app,
/// as well as the confusion matrix of the NN model used by the devices.
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
              // // Title
              // const Padding(
              //   padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
              //   child: Text(
              //     "Confusion matrix:",
              //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // // Confusion matrix card of the NN model
              // confusionMatrixCard(),
              // const SizedBox(
              //   height: 48,
              // ),
              // Title
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Text(
                  "Analytics:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Bar chart for 'Doorbell' messages analytics
              AnalyticsBarChart(
                label: "Doorbell alerts in the past months:",
                category: "Doorbell",
                isar: isar,
                colorProfile: const [
                  Colors.lightBlueAccent,
                  Colors.greenAccent
                ],
              ),
              // Bar chart for 'Fire Alarm' messages analytics
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
