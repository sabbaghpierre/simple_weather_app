import 'package:weather_app_flutter/logic/network_service.dart';
import 'package:weather_app_flutter/model/weather.dart';

class Repository{

  static Future<dynamic> getWeather() async{
    String url = 'http://api.openweathermap.org/data/2.5/weather?q=beirut&units=metric&appid=b680792b191669462ee6918c8797681d';
    try{
      var response = await NetworkService.httpGetRequest(url);
      if(response == false){
        return false;
      }
      var responseModel = Weather.fromJson(response);
      return responseModel;
    }catch(e){
      print(e);
      return false;
    }
  }

}