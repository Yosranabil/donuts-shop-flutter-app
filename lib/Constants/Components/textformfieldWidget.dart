import 'package:flutter/material.dart';

class formfieldWidget extends StatelessWidget {
  formfieldWidget(
      {required this.textController,
      required this.textExp,
      required this.errortext,
      required this.labeltext,
      required this.texttype});

  var textController = TextEditingController();
  RegExp textExp;
  String labeltext;
  String errortext;
  TextInputType texttype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: texttype,
      validator: (value) {
        if (value!.isEmpty ||
            !textExp.hasMatch(textController.text.toString())) {
          return errortext;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
