import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'connection.dart';



class busquedas {
  List _data;



  Future<String>  buscarGet(String url,headers) async{
    var response;

      response = await http.get(url, headers: headers);

      if(response.statusCode==200){
        return response.body;
      }else{
        return null;
      }
  }

  Future <List> obtenerClientes() async{
    var url='http://10.0.2.2/api/auth/clients';


    var headers= {"content-type": "application/json","Authorization":Connection.type+" "+Connection.token};


    await buscarGet(url,headers).then((respuesta){
        _data= jsonDecode(respuesta)['clients'];
    }).catchError((error){return null;});


    return _data;

  }



}

