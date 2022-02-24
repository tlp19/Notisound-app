import 'package:flutter/material.dart';

import '../general_widgets.dart';
import 'bar_char.dart';
import 'confusion_matrix.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({required this.isar, Key? key}) : super(key: key);

  final isar;

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
              analyticsChart(isar),
            ],
          ),
        ),
      ),
    );
  }
}
