import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadHome extends HomeEvent {}
class LoadMoreHome extends HomeEvent {}
class RefreshHome extends HomeEvent {}
