import 'dart:math';

import 'package:dio/dio.dart';
import 'package:persons_exam/data/model/repo/people_response.dart';

import '../../utils/my_const/my_const.dart';
import '../model/api/rest_client.dart';

class HomeRepository {
  final dio = Dio();

  Future<PeopleResponse> getHomeData(int pageNo) async {
    final client = RestClient(dio);
    final limit = UI_CONST.SIZE;
    final skip = max(0, pageNo * UI_CONST.SIZE - UI_CONST.SIZE);
    return client.getPeopleResponseData(limit, skip);
  }
}
