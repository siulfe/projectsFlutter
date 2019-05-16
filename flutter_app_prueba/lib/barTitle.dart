import 'package:flutter/material.dart';
import 'listaApiRetornable.dart';

class BarTitle extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Memes e imagenes de Anime y Programación",
      ),
      actions: <Widget>[
        InkWell(child: Icon(Icons.search), onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListaApiRetornable()),
          );
        }),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.dehaze)),
      ],
    );
  }

  Size get preferredSize {
    return new Size.fromHeight(40.0);
  }
}
