import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:return_success_4_app/controller/notificationService.dart';
import 'package:return_success_4_app/view/editPage/edit_widgets.dart';

import '../../controller/deviceDatabaseService.dart';
import '../general_widgets.dart';

class EditPage extends StatelessWidget {
  const EditPage({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SubscriptionForm(isar: isar),
            const SizedBox(
              height: 16,
            ),
            SubscribedList(isar: isar),
          ],
        ),
      ),
    );
  }
}

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  late TextEditingController textController1;
  late TextEditingController textController2;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  String? formValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (RegExp(r'^[a-zA-Z0-9-_.~%]{1,900}$').hasMatch(value)) {
      return null;
    }
    return 'Not a valid input';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            offset: Offset(1, 1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Flexible(
                flex: 4,
                child: TextFormField(
                  validator: formValidator,
                  controller: textController1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text("Device ID"),
                  ),
                ),
              ),
              const Text(
                "  /  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                flex: 5,
                child: TextFormField(
                  validator: formValidator,
                  controller: textController2,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text("Topic"),
                    hintText: 'doorbell, fire_alarm, ...',
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            iconButton(
              size: 30,
              label: "Add device and/or topic",
              icon: Icons.add,
              color: const Color.fromARGB(255, 5, 107, 190),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  DeviceDatabaseService().addTopicToDevicesDB(
                      widget.isar, textController1.text, textController2.text);
                  final newTopic =
                      textController1.text + "_" + textController2.text;
                  NotificationService().subscribeToTopics([newTopic]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
