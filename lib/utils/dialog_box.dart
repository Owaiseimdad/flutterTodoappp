import 'package:flutter/material.dart';
import 'package:todo_hive/utils/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  // Save method

  // Cancel method

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 44, 214, 237),
      content: Container(
        height: 140,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add a new task"),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(text: "Save", onPressed: onSave),
                  AppButton(text: "Cancel", onPressed: onCancel)
                ],
              ))
        ]),
      ),
    );
  }
}
