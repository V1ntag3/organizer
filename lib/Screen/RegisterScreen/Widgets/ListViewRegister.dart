// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizer/Screen/LoginScreen/LoginScreen.dart';

class ListViewRegister extends StatefulWidget {
  const ListViewRegister({Key? key}) : super(key: key);

  @override
  State<ListViewRegister> createState() => _ListViewRegisterState();
}

class _ListViewRegisterState extends State<ListViewRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _tName = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final _tPasswordTest = TextEditingController();
  final _tCell = TextEditingController();

  FocusNode fName = FocusNode();
  FocusNode fEmail = FocusNode();
  FocusNode fPassword = FocusNode();
  FocusNode fPasswordTest = FocusNode();
  FocusNode fCell = FocusNode();
  FocusNode submit = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(30),
            height: 700,
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
                    inputs(context, 'Name'),
                    const SizedBox(height: 30),
                    inputs(context, 'Email'),
                    const SizedBox(height: 30),
                    inputs(context, 'Password'),
                    const SizedBox(height: 30),
                    inputs(context, 'Confirm password'),
                    const SizedBox(height: 30),
                    inputs(context, 'Cell')
                  ],
                ))),
        inputContainer(context)
      ],
    );
  }

  Column inputContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        button(
          context,
          "Register",
        )
      ],
    );
  }

  Container button(BuildContext context, String type) {
    return Container(
        height: 60.0,
        width: 300,
        margin: const EdgeInsets.only(top: 20.0, bottom: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(25),
          color: Colors.black,
        ),
        child: TextButton(
          focusNode: submit,
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

  TextField inputs(BuildContext context, String text) {
    if (text == "Name") {
      return TextField(
          textInputAction: TextInputAction.next,
          autofocus: true,
          focusNode: fName,
          onSubmitted: (term) {
            fName.unfocus();
            FocusScope.of(context).requestFocus(fEmail);
          },
          controller: _tName,
          keyboardType: TextInputType.name,
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
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),
              hintText: text,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              )));
    } else if (text == "Email") {
      return TextField(
          textInputAction: TextInputAction.next,
          autofocus: true,
          focusNode: fEmail,
          onSubmitted: (term) {
            fEmail.unfocus();
            FocusScope.of(context).requestFocus(fPassword);
          },
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
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: text,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              )));
    } else if (text == "Password") {
      return TextField(
          textInputAction: TextInputAction.next,
          autofocus: true,
          focusNode: fPassword,
          onSubmitted: (term) {
            fPassword.unfocus();
            FocusScope.of(context).requestFocus(fPasswordTest);
          },
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
    } else if (text == "Confirm password") {
      return TextField(
          textInputAction: TextInputAction.next,
          focusNode: fPasswordTest,
          autofocus: true,
          onSubmitted: (term) {
            fPasswordTest.unfocus();
            FocusScope.of(context).requestFocus(submit);
          },
          controller: _tPasswordTest,
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
    } else {
      return TextField(
          onSubmitted: (term) {
            fCell.unfocus();
            FocusScope.of(context).requestFocus(submit);
          },
          focusNode: fCell,
          controller: _tCell,
          keyboardType: TextInputType.phone,
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

  _onClickLogin(BuildContext context) {
    final name = _tName.text;
    final email = _tEmail.text;
    final pass = _tPassword.text;
    final passTest = _tPasswordTest.text;
    final cel = _tCell.text;

    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (name.isEmpty ||
        email.isEmpty ||
        pass.isEmpty ||
        passTest.isEmpty ||
        cel.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Error",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              content: Text("Incomplete data",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              actions: <Widget>[
                TextButton(
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
      if (pass != passTest) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Error",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.black,
                      )),
                  content: Text("Passwords are different",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.black,
                      )),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.black,
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      } else {
        return navigateToLoginScreen(context);
      }
    }
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
