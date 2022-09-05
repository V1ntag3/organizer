// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:organizer/Screen/PrincipalScreen/Widgets/NavDrawer.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(shrinkWrap: true, children: <Widget>[
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000"),
              card("Manga", "5000"),
              card("Eletronicos", "7000")
            ]),
          ),
          Container(
            child: button(),
          ),
        ],
      ),
    );
  }

  Card card(String type, String valor) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () {},
            leading: Icon(Icons.album, size: 45),
            title: Text(type),
            subtitle: Text('Valor total: R\$$valor'),
          ),
        ],
      ),
    );
  }

  Container button() {
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.bottomRight,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.verified_user)));
  }
}
