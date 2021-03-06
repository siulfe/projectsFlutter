
import 'package:flutter/material.dart';
import 'Connection.dart';


class ListaApiRetornable extends StatefulWidget{
   createState() => _listApiState();
}


class _listApiState extends State<ListaApiRetornable>{
  Connection c=Connection();

  void initState() {
    c.getJsonData();
  }


  Widget build(BuildContext context){
    return FutureBuilder<List>(
      future: Connection().getJsonData(),
      builder: (context,snapshot){
        return Scaffold(
          appBar: AppBar(
            title: Text("RESULTADOS"),
          ),
          body: Container(
            color: Colors.yellow[500],
            child: ListView.builder(
              itemCount: c.getJsonLength(),
              itemBuilder: (context,position){

                _datos title=_datos.fromJson(c.getJson()[position]);

                return Card(
                    color: Colors.yellow[800],
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Title: ${title.title}", style: TextStyle(fontSize: 16.0),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Cuerpo: ${title.body}", style: TextStyle(fontSize: 16.0),),
                        ),
                      ],
                    )
                );
              },
            ),
          ),
        );
      },
    );
  }

}



class _datos{
  final int userId;
  final int id;
  final String title;
  final String body;

  _datos({this.userId, this.id, this.title, this.body});

  factory _datos.fromJson(Map <String,dynamic> json) {

    return _datos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }


}