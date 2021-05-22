import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_flutter/logic/repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<dynamic> getWeather() async{
    emit(WeatherLoading());
    try{
      var response = await Repository.getWeather();
      if(response == false){
        emit(WeatherError());
        return false;
      }
      emit(WeatherSuccess(response: response));
    }catch(e){
      emit(WeatherError());
      print(e);
      return false;
    }
  }
}
