import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../general_widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "This app was developped as part of the first coursework of Embedded Systems 2021/2022 of the group returnSuccess4."),
            const SizedBox(
              height: 8,
            ),
            const Text(
                "The app was programmed in Dart using the Flutter framework. It was developped and debugged using both a Pixel 5 and a Pixel 4 running Android 12 (virtual devices), and was tested using a Galaxy S8 running Android 9 (real device)."),
            const SizedBox(
              height: 8,
            ),
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text:
                      "Please report all bugs or feature requests to the GitHub page of the project: "),
              TextSpan(
                  style: const TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  //make link blue and underline
                  text: "GitHub repository",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String url =
                          "https://github.com/tlp19/return_success_4_app";
                      var urllaunchable = await canLaunch(url);
                      if (urllaunchable) {
                        await launch(url);
                      } else {
                        print("URL can't be launched.");
                      }
                    }),
            ]))
          ],
        ),
      ),
    );
  }
}
