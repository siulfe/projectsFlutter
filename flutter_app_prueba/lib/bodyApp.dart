import 'package:flutter/material.dart';
import 'barraTab.dart';
import 'lista.dart';

class BodyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
              "Los errores son la revelacion de la verdad, no te averguenzes de ellos",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              )),
        ),
        Lista(),
        BarraTab(),
      ],
    );
  }
}
