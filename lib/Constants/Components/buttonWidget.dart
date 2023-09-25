import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.text, required this.onClick});

  String text;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(380, 60),
          backgroundColor: Color(0xFFAB72C0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
        ),
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
