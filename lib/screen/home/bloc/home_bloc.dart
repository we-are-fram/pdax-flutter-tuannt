import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_exam/data/model/repo/model.dart';
import '../../../data/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../../utils/my_const/my_const.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  List<People> myList =[];
  int initPage = 1;
  int loadMoreCount = 0;
  int loadedLastIndex = UI_CONST.SIZE;
  HomeBloc({required this.homeRepository}) : super(HomeLoading());

  @override
  HomeState get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    } else if (event is LoadMoreHome) {
      yield* _mapLoadHomeToState();
    } else if (event is RefreshHome) {
      initPage = 1;
      yield HomeLoading();
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    try {

      if(initPage == 1) {
        final response = await homeRepository.getHomeData(initPage);
        myList = response.users;
        loadMoreCount = initPage*UI_CONST.SIZE;
        initPage++;
        yield HomeLoaded(myList);
      } else {
        loadedLastIndex += loadMoreCount;
        final response = await homeRepository.getHomeData((loadedLastIndex/UI_CONST.SIZE).toInt());
        myList += response.users;
        yield HomeLoaded(myList);
      }
    } catch (e) {

      yield HomeNotLoaded(e.toString());
    }
  }
}