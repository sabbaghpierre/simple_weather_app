part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherError extends WeatherState {}
class WeatherSuccess extends WeatherState {
  final dynamic response;

  WeatherSuccess({this.response});

}
