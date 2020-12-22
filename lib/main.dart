import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/bloc/home_page_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/home_page_sstles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomePageSsles.id,
      routes: {
        HomePageSsles.id : (context) => BlocProvider.value(
          value: HomePageCubit(),
          child: HomePageSsles(),
        ),
        HomePage.id: (context) => HomePage(),
//        HomePage.id : (context) => HomePage(),
//        HomePageSsles.id : (context) => HomePageSsles(),
      },
    );
  }
}