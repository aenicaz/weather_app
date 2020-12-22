import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/pages/bloc/home_page_cubit.dart';
import 'package:weather_app/pages/home_page.dart';

class HomePageSsles extends StatelessWidget {
  static const String id = 'HomePageSsles';
  HomePageCubit _homePageCubit;

  @override
  Widget build(BuildContext context) {
    _homePageCubit = BlocProvider.of<HomePageCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state){
              if (state is HomePageInitial) {
                return HomePage();
              }
              if (state is HomePageLoading) {
                return CircularProgressIndicator();
              }
              if (state is HomePageSuccess) {
                Future.delayed(Duration.zero, (){Navigator.pushNamed(context, '${HomePageSsles.id}');});
                _homePageCubit.emit(HomePageInitial());
                return buildCenterLoading();
              }
              return buildCenterLoading();
            },
          ),
        ),
      ),
    );
  }

  Center buildCenterLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumn() {
    return Column(
          children: [
            RaisedButton(
              onPressed: () {
                _homePageCubit.requestWeatherData('Vladivostok');
              },
              child: Icon(
                Icons.search),
              ),
            Text('Temp'),
            Text('Wind'),
            Text('Code'),
            Text('City name'),
          ],
        );
  }
}
