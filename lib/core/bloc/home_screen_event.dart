part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent {}


class GetTopGainers extends HomeScreenEvent {}
class GetStockDetails extends HomeScreenEvent {}