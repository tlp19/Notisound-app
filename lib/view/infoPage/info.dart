import 'package:flutter/material.dart';

import '../general_widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: Center(
        child: Text("info"),
      ),
    );
  }
}
