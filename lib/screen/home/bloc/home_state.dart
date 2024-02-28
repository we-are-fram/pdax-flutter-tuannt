import 'package:equatable/equatable.dart';
import 'package:persons_exam/data/model/repo/model.dart';
import '../../../data/model/repo/people_response.dart';


abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<People> peoples;

  const HomeLoaded(this.peoples);

  @override
  List<Object> get props {
    return [peoples];
  }

  @override
  String toString() {
    return 'HomeLoaded{response: $peoples}';
  }
}

class HomeLoadedMore extends HomeState {
  final List<People> peoples;

  const HomeLoadedMore(this.peoples);

  @override
  List<Object> get props {
    return [peoples];
  }

  @override
  String toString() {
    return 'HomeLoadedMore{response: $peoples}';
  }
}


class HomeNotLoaded extends HomeState {
  final String e;

  const HomeNotLoaded(this.e);

  @override
  String toString() {
    return 'HomeNotLoaded{e: $e}';
  }
}
