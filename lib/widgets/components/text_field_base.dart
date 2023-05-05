import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario_validaciones_flutter/common/enums.dart';
import 'package:formulario_validaciones_flutter/common/validate.dart';

import '../../utils/UpperCaseTextFormatter.dart';

class TextFieldBase extends StatelessWidget {
  String text;
  TextEditingController controller;
  ValidateText? validateText;
  bool notRequired;
  TextFieldBase(this.text, this.controller,
      {this.validateText, this.notRequired = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        TextFormField(
          controller: controller,
          maxLength: ValidateMaxLegth(),
          inputFormatters: [ValidateInputFormatters()],
          validator: (String? value) {
            return ValidateStructure(value);
          },
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

  ValidateInputFormatters() {
    switch (validateText) {
      case ValidateText.rfc:
        return UpperCaseTextFormatter();
      case ValidateText.phoneNumber:
        return FilteringTextInputFormatter.digitsOnly;
      case ValidateText.zipCode:
        return FilteringTextInputFormatter.digitsOnly;
      default:
        return FilteringTextInputFormatter.singleLineFormatter;
    }
  }

  ValidateStructure(String? value) {
    if (!notRequired && value!.isEmpty) {
      return "El campo $text es requerido";
    } else {
      switch (validateText) {
        case ValidateText.rfc:
          return validateRFC(value!) ? null : message("RFC");
        case ValidateText.phoneNumber:
          return validatePhoneNumber(value!)
              ? null
              : message("número de teléfono");
        case ValidateText.email:
          return validateEmail(value!) ? null : message("email");
        default:
          return null;
      }
    }
  }

  message(String type) => "La estructura del $type es incorrecta";
}
