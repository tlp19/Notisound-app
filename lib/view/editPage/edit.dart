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

  String? selectedValue;

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
            // DeviceID Text Field
            TextFormField(
              validator: formValidator,
              controller: textController1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                label: Text("Device ID:"),
              ),
            ),
            // Topic DropDown Menu
            Row(
              children: [
                const Text(
                  "Detection mode:  ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton(
                    value: selectedValue,
                    hint: const Text("Choose one    "),
                    items: const [
                      DropdownMenuItem(
                        child: Text("Doorbell"),
                        value: "doorbell",
                      ),
                      DropdownMenuItem(
                        child: Text("Fire Alarm"),
                        value: "fire_alarm",
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Add to devices button
            iconButton(
              size: 30,
              label: "Add new device and/or mode",
              icon: Icons.add,
              color: const Color.fromARGB(255, 5, 107, 190),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (selectedValue != null) {
                    DeviceDatabaseService().addTopicToDevicesDB(
                        widget.isar, textController1.text, selectedValue!);
                    final newTopic =
                        textController1.text + "_" + selectedValue!;
                    NotificationService().subscribeToTopics([newTopic]);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
