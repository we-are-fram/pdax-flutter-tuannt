import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../repo/people_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/users")
  Future<PeopleResponse> getPeopleResponseData(@Query("limit") int limit,@Query("skip") int skip);

}
