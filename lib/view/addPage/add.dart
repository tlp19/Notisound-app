import 'package:flutter/material.dart';

import '../general_widgets.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: Center(
        child: Text("add"),
      ),
    );
  }
}
