import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulario_validaciones_flutter/common/enums.dart';

class TextFieldBase extends StatelessWidget {
  String text;
  TextEditingController controller;
  ValidateText? validateText;
  TextFieldBase(this.text, this.controller, {this.validateText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        TextFormField(
          controller: controller,
          maxLength: ValidateMaxLegth(),
        )
      ],
    );
  }

  ValidateMaxLegth() {
    switch (validateText) {
      case ValidateText.rfc:
        return 13;
      case ValidateText.phoneNumber:
        return 15;
      case ValidateText.email:
        return 64;
      case ValidateText.zipCode:
        return 5;
      default:
        return null;
    }
  }
}
