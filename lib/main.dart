import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/home_screen.dart';
import 'package:weather_app_flutter/logic/cubit/weather_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create: (context)=>WeatherCubit()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
