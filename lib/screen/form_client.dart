import 'package:flutter/material.dart';
import 'package:formulario_validaciones_flutter/common/enums.dart';
import 'package:formulario_validaciones_flutter/widgets/components/text_field_base.dart';

// ignore: must_be_immutable
class FormClientScreen extends StatelessWidget {
  TextEditingController ctrlRFC = TextEditingController();
  TextEditingController ctrlNumberPhone = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlZipCode = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  FormClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Cliente"),
      ),
      body: Form(
        key: keyForm,
        child: ListView(
          children: [
            TextFieldBase(
              "RFC",
              ctrlRFC,
              validateText: ValidateText.rfc,
            ),
            TextFieldBase(
              "Email",
              ctrlEmail,
              validateText: ValidateText.email,
            ),
            TextFieldBase(
              "Código postal",
              ctrlZipCode,
              validateText: ValidateText.zipCode,
              notRequired: true,
            ),
            TextFieldBase(
              "Numero teléfono",
              ctrlNumberPhone,
              validateText: ValidateText.phoneNumber,
            ),
            TextButton(
              onPressed: save,
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }

  save() {
    if (keyForm.currentState!.validate()) {}
  }
}
