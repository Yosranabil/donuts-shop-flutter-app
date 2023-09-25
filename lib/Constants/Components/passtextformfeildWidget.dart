import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class passformfieldWidget extends StatefulWidget {
  passformfieldWidget(
      {required this.textController,
        required this.visible,
        required this.textExp,
      });

  var textController = TextEditingController();
  bool visible;
  RegExp textExp;

  @override
  State<passformfieldWidget> createState() => _passformfieldWidgetState(v: visible);
}

class _passformfieldWidgetState extends State<passformfieldWidget> {

  _passformfieldWidgetState({required this.v});
  bool v;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: (value) {
        if (value!.isEmpty ||
            !widget.textExp.hasMatch(
                widget.textController.text.toString())) {
          return 'A valid password should be between 8-30 characters must\n contain at least one lowercase, at least one uppercase, \n at least one number and at least one special character.';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: v,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              v = !v;
            });
          },
          icon:  Icon(v? MdiIcons.eye :MdiIcons.eyeOff,),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }


}
