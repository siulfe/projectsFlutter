import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Connection {
  /*  Para hacer pruebas de conexion, la respuesta es un json con Title, Body ...
    final String url = 'https://jsonplaceholder.typicode.com/posts';
  */
  static  String token;
  static  String type;

  final String loginUrl = 'http://10.0.2.2/api/auth/login';

  static Future<_datos> login(user,password) async {

    var body =jsonEncode({
      "email":user,
      "password":password,
      "remember_me":true
    });

    var response = await http.post("http://10.0.2.2/api/auth/login",
        headers: { "accept":"application/json","content-type": "application/json","X-Requested-With":"XMLHttpRequest"},
        body: body);

    if(response.statusCode==200){
      _datos d=_datos.fromJson(json.decode(response.body));

      token=d.access;
      type=d.type;

     return d;

    }else{
      return null;
    }
  }


  static Future <bool> close() async{

    var response = await http.get("http://10.0.2.2/api/auth/logout",headers: {'Authorization':'$type $token'});

    if(response.statusCode==200){
      print(response.body);
      return true;
    }

    return false;

  }


}


class _datos{
  final String access;
  final String type;

  _datos({this.access,this.type}); //contructor de la clase, los parametros deben estar entre {}

  factory _datos.fromJson(Map<String,dynamic> json){
      return _datos(
          access:json['access_token'],
          type:json['token_type']
      );
  }
}




