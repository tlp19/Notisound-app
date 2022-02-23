import 'package:flutter/material.dart';

import '../general_widgets.dart';
import 'analytics_widgets.dart';

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
              const Text(
                "Confusion matrix:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              confusionMatrix(),
              const SizedBox(
                height: 48,
              ),
              const Text(
                "Analytics:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              analyticsChart(isar),
            ],
          ),
        ),
      ),
    );
  }
}
