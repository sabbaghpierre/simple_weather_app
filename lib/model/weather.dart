class Weather{
  double temperature;
  String mainCondition;
  String country;
  String cityName;

  Weather({this.temperature,this.mainCondition,this.cityName,this.country});

  Weather.fromJson(Map<String,dynamic> json){
    temperature= json['main']['temp'];
    mainCondition = json['weather'][0]['main'];
    country = json['sys']['country'];
    cityName = json['name'];
  }
}