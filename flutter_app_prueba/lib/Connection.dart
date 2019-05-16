import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;




class Connection {
  List _data;
  final String url = 'https://jsonplaceholder.typicode.com/posts';



  Future<List> getJsonData() async {

    var response = await http.get(url);

    if(response.statusCode==200){
      _data=json.decode(response.body);
      return _data;
    }else{
      return null;
    }
  }

  List getJson(){
    return _data;
  }

  int getJsonLength(){
    if(_data==null)
      return 0;

    return _data.length;
  }

}

/*



* */