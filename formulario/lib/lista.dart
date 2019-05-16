import 'package:flutter/material.dart';
import 'busquedas.dart';
import 'connection.dart';


class Lista extends StatelessWidget {
  busquedas b;
  List clientes;

  Lista(){
      b=new busquedas();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Lista de Clientes"),
          actions: <Widget>[
            InkWell(
              child: Icon(
                Icons.exit_to_app
              ), 
              onTap: (){
                Connection.close().then((value){
                  if(value)
                    Navigator.pop(context);
                  else
                    print("No se ha podido cerrar la sesion");

                }).catchError((error){
                  print("A ocurrido un error");
                });

              } ,
            )
          ],
        ),
        body: FutureBuilder(
        future: b.obtenerClientes().then((respuesta){
          clientes=respuesta;
        }),
        builder: (context, text) {
          return ListView.builder(
            itemCount: clientes==null?0:clientes.length,
            itemBuilder: (context, position) {

              _clients c=_clients.fromJson(clientes[position]);

              return ListTile(
                contentPadding: EdgeInsets.all(12.0),
                title: Text("${c.name}"),
                subtitle: Text("${c.rif}"),

              );

          });
        }));
  }
}


class _clients{
  final String name;
  final String rif;

  _clients({this.name,this.rif});

  factory _clients.fromJson(Map<String,dynamic> json){
    return _clients(
      name: json['business_name'],
      rif: json['rif'],
    );
  }


}
