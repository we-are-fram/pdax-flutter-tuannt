import 'package:json_annotation/json_annotation.dart';
import 'package:persons_exam/data/model/repo/model.dart';
part 'people_response.g.dart';
@JsonSerializable()
class PeopleResponse {
  List<People> users;

  PeopleResponse(this.users);

  factory PeopleResponse.fromJson(Map<String, dynamic> json) => _$PeopleResponseFromJson(json);


  Map<String, dynamic> toJson()=> _$PeopleResponseToJson(this);
}