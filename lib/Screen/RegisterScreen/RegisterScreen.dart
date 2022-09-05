// ignore_for_file: deprecated_member_use, file_names, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:organizer/Screen/RegisterScreen/Widgets/ListViewRegister.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: ListViewRegister());
  }

  String? validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String? validatePassword(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }
}
