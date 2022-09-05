// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizer/Screen/PrincipalScreen/PrincipalScreen.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(30),
                height: 450,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Organizer",
                          style: TextStyle(
                              fontFamily: 'Brittany',
                              fontSize: 70,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 90),
                        inputs(context, 'Email'),
                        const SizedBox(height: 30),
                        inputs(context, 'Password'),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: Text(
                            'Forgot password?',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    ))),
            inputContainer(context)
          ],
        ));
  }

  TextField inputs(BuildContext context, String text) {
    if (text == "Email") {
      return TextField(
          controller: _tEmail,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(20.0),
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: text,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              )));
    } else {
      return TextField(
          controller: _tPassword,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(20.0),
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: text,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              )));
    }
  }

  Column inputContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        button(
          context,
          "Login",
        )
      ],
    );
  }

  Container button(BuildContext context, String type) {
    return Container(
        height: 60.0,
        width: 300,
        margin: const EdgeInsets.only(top: 60.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        child: TextButton(
          child: Text(type,
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            _onClickLogin(context);
          },
        ));
  }

  _onClickLogin(BuildContext context) {
    final login = _tEmail.text;
    final senha = _tPassword.text;
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (login.isEmpty ||
        senha.isEmpty ||
        login != "marcos" ||
        senha != "marcos") {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Error",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              content: Text("Email and/or Password invalid(s)",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PrincipalScreen()));
    }
  }
}
