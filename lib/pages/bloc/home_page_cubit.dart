import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:weather_app/services/weather.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  String _cityName;
  int _windSpeed;
  var _weatherCode;
  int _temp;

  void requestWeatherData(String city) async {
    emit(HomePageLoading());
    var data = await Weather.getCityWeather(city);
    _temp = data['main']['temp'];
    _windSpeed = data['wind']['speed'];
    _weatherCode = data['weather'][0]['id'];
    _cityName = city;

    print('Temp $_temp}');
    print('Wind speed $_windSpeed');
    print('Weather code $_weatherCode');
    if (_cityName != null) {
      emit(HomePageSuccess());
    } else {
      emit(HomePageError());
    }
  }

  HomePageCubit() : super(HomePageInitial());
}
