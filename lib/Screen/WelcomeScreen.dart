// ignore_for_file: file_names, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizer/Screen/LoginScreen/LoginScreen.dart';
import 'package:organizer/Screen/RegisterScreen/RegisterScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    _changeOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(microseconds: 150),
          child: logo(context),
        ),
        containerButtons(context),
        textBottom(context),
      ],
    )));
  }

  Container containerButtons(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20),
        color: Colors.white12,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          const SizedBox(height: 100),
          button(context, "Login"),
          button(context, "Register")
        ])));
  }

  Container button(BuildContext context, String type) {
    return Container(
        height: 60.0,
        width: 200,
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]), // changes position of shadow),
        child: TextButton(
          child: Text(type,
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            if (type == "Login") {
              navigateToLoginScreen(context);
            } else {
              navigateToRegisterScreen(context);
            }
          },
        ));
  }

  Container textBottom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Text('by V1ntag3',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.grey,
            )),
        onTap: () async {
          var myGit = Uri(
            scheme: 'https',
            host: 'github.com',
            path: '/V1ntag3',
          );
          if (await canLaunchUrl(myGit)) {
            await launchUrl(myGit);
          } else {
            throw 'Could not launch $myGit';
          }
        },
      ),
    );
  }

  Container logo(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 100),
        child: const Text(
          "Organizer",
          style: TextStyle(
            fontFamily: 'Brittany',
            fontSize: 80,
          ),
        ));
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  void navigateToRegisterScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }
}
