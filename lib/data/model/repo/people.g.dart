// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      json['firstName'] as String,
      json['lastName'] as String,
      json['maidenName'] as String,
      json['age'] as int,
      json['gender'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['username'] as String,
      json['password'] as String,
      json['birthDate'] as String,
      json['image'] as String,
      json['bloodGroup'] as String,
      json['height'] as int,
      (json['weight'] as num).toDouble(),
      json['eyeColor'] as String,
      json['domain'] as String,
      json['ip'] as String,
      json['macAddress'] as String,
      json['university'] as String,
      json['ein'] as String,
      json['ssn'] as String,
      json['userAgent'] as String,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'domain': instance.domain,
      'ip': instance.ip,
      'macAddress': instance.macAddress,
      'university': instance.university,
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
    };
