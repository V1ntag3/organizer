import 'package:flutter/material.dart';
//import 'package:organizer/Screen/PrincipalScreen/PrincipalScreen.dart';
import 'package:organizer/Screen/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WelcomeScreen());
  }
}
