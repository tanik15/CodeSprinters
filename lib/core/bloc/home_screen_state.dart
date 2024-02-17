part of 'home_screen_bloc.dart';


sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoadingState extends HomeScreenState {}

final class HomeScreenLoadedState extends HomeScreenState {}
