import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'bloc/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  HomePageCubit _homePageCubit;
  static final String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _timeString;
  String _cityName = '123';
  int _windSpeed;
  var _weatherCode;
  int _temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('kk:mm').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  void _getWeatherData(String city) async {
    var data = await Weather.getCityWeather(city);
    _temp = data['main']['temp'];
    _windSpeed = data['wind']['speed'];
    _weatherCode = data['weather'][0]['id'];
    print('Temp: ${_temp}');
    print('Speed: $_windSpeed');
    print('Code: $_weatherCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      widget._homePageCubit.requestWeatherData('Vladivostok');
                    },
                    color: Colors.orange,
                    child: Text(
                      '$_cityName',
                    ),
                  ),
                  Text(
                    _timeString.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 300,
                      child: Image.asset('assets/pictures/light.png'),
                    ),
                    Text(
                      'Strong Rain',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/pictures/001-rain-3.png'),
                          ),
                          SizedBox( width: 20,),
                          Text(
                            '11 km/h',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/pictures/020-wind-2.png'),
                          ),
                          SizedBox( width: 20,),
                          Text(
                            'wind speed',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/pictures/006-sun.png'),
                          ),
                          SizedBox( width: 20,),
                          Text(
                            'sun rise',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          },
      ),
    );
  }
}
