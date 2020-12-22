import 'package:weather_app/services/location.dart';

import 'network_helper.dart';

const apiKey = '79ab925ad5beea3f1600bb1279bca6a8';
const apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

class Weather {
  static Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$apiUrl?q=$cityName&appid=$apiKey&units=metric'
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static Future<dynamic> getLocationWeather(Location location) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$apiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


}