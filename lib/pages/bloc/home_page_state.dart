part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState{}
class HomePageError extends HomePageState{}
class HomePageSuccess extends HomePageState{}