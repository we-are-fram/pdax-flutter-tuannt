import 'package:json_annotation/json_annotation.dart';
part 'people.g.dart';
@JsonSerializable()
class People {

  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  int height;
  double weight;
  String eyeColor;
  String domain;
  String ip;
  String macAddress;
  String university;
  String ein;
  String ssn;
  String userAgent;

  People( this.firstName, this.lastName, this.maidenName, this.age, this.gender, this.email, this.phone, this.username, this.password, this.birthDate, this.image, this.bloodGroup
      , this.height, this.weight, this.eyeColor, this.domain, this.ip, this.macAddress, this.university, this.ein, this.ssn, this.userAgent);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);


  Map<String, dynamic> toJson()=> _$PeopleToJson(this);
}