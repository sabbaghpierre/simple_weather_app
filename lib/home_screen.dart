import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/logic/cubit/weather_cubit.dart';
import 'package:weather_app_flutter/logic/repository.dart';
import 'package:weather_app_flutter/model/weather.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                BlocProvider.of<WeatherCubit>(context).getWeather();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (state is WeatherLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                  (state is WeatherError)
                      ? Center(
                          child: Text("ERROR"),
                        )
                      : Container(),
                  (state is WeatherSuccess)
                      ? Expanded(child: _buildList(state.response))
                      : Container(),
                ],
              );
            },
          )),
    );
  }

  Widget _buildList(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "${weather.mainCondition}",
              style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${weather.cityName} , ${weather.country}",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Container(
            height: 200,
            child: FlareActor(
              'assets/flare/sun_cloud.flr',
              isPaused: false,
              animation: "sun_cloud",
            )),
        Text(
          "${weather.temperature} °C",
          style: GoogleFonts.lato(fontSize: 50, color: Colors.white),
        ),
      ],
    );
  }
}
