import 'package:flutter/material.dart';

class BarraTab extends StatelessWidget {
  final int _listaJpg = 15;
  final int _listaPng = 19;
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Expanded(
          child: Column(children: [
            TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorColor: Colors.yellow[900],
              tabs: <Widget>[
                Tab(text: "Lista 1"),
                Tab(text: "Lista 2"),
                Tab(text: "La Liga"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  GridView.builder(
                    itemCount: _listaJpg,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder:(context,position){
                      position+=1;
                      return Padding(
                        padding:EdgeInsets.all(12.0),
                        child: Image.asset("assets/img ($position).jpg",height:75.0),
                      );
                    }
                  ),
                  ListView.builder(
                    itemCount: _listaPng,
                    itemBuilder: (context,position){
                      position+=1;
                      return Padding(
                        padding:EdgeInsets.all(12.0),
                        child: Image.asset("assets/img ($position).png"),
                      );
                    }
                  ),
                  Container(
                    child: Image.asset("assets/img (1).bmp"),
                  )
                  ],
              ),
            )
          ]),
        ));
  }
}
