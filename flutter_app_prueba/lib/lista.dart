import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              width: 200.0,
              height: 150.0,
              child: Image.asset("assets/img (1).png",
                  height: 150.0, width: 200.0)),
          Container(
              width: 200.0,
              height: 150.0,
              child: Image.asset("assets/img (3).png",
                  height: 150.0, width: 200.0)),
          Container(
              width: 200.0,
              height: 150.0,
              child: Image.asset("assets/img (9).jpg",
                  height: 150.0, width: 200.0)),
          Container(
              width: 200.0,
              height: 150.0,
              child: Image.asset("assets/img (11).jpg",
                  height: 150.0, width: 200.0)),
          Container(
              width: 200.0,
              height: 150.0,
              child: Image.asset("assets/img (13).jpg",
                  height: 150.0, width: 200.0))
        ],
      ),
    );
  }
}
