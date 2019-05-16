import 'package:flutter/material.dart';
import 'barTitle.dart';
import 'bodyApp.dart';
import 'listApi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Memes e Imagenes ",
      theme:ThemeData(
        primaryColor: Colors.yellow[400]
      ),
      home: Vista(),
    );
  }
}

class Vista extends StatelessWidget{
  Widget build(BuildContext context){
      return Scaffold(
        endDrawer: Drawer(
          child: listaApi(),
        ),
        appBar: BarTitle(),
        body: BodyApp(),
      );
  }

}