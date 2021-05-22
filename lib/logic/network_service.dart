import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService{

  static Future<dynamic> httpGetRequest(String url) async{
    try{
      print(1);
      http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return data;
      }else{
        return false;
      }
    }catch(e){
      print(e);
      return false;
    }
  }

}