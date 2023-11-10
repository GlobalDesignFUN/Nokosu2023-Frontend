// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class UserLogin {
  String? username;
  String? password;

  UserLogin({
    this.username,
    this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}

@JsonSerializable()
class UserReg {
  int? id;
  String? username;
  String? email;
  String? first_name;
  String? last_name;
  String? password1;
  String? password2;

  UserReg({
    this.id,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.password1,
    this.password2,
  });

  factory UserReg.fromJson(Map<String, dynamic> json) =>
      _$UserRegFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegToJson(this);
}

@JsonSerializable()
class FormErrResponse {
  String? message;
  String? code;

  FormErrResponse({
    this.message,
    this.code,
  });

  factory FormErrResponse.fromJson(Map<String, dynamic> json) =>
      _$FormErrResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FormErrResponseToJson(this);
}

@JsonSerializable()
class UserRegResponse {
  FormErrResponse? username;
  FormErrResponse? email;
  FormErrResponse? first_name;
  FormErrResponse? last_name;
  FormErrResponse? password1;
  FormErrResponse? password2;

  UserRegResponse({
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.password1,
    this.password2,
  });

  factory UserRegResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegResponseToJson(this);
}

@JsonSerializable()
class User {
  int? id;
  String? username;
  String? email;
  String? first_name;
  String? last_name;
  bool? is_active;
  bool? is_staff;
  bool? is_superuser;
  DateTime? date_joined;
  DateTime? last_login;

  User({
    this.id,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.is_active,
    this.is_staff,
    this.is_superuser,
    this.date_joined,
    this.last_login,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Profile {
  int? id;
  String? photo;
  String? url;
  User? user;

  Profile({this.id, this.photo, this.url, this.user});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Group {
  int? id;
  String? name;
  int? createdBy;
  DateTime? created;

  Group({this.id, this.name, this.createdBy, this.created});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class Info {
  int? id;
  String? topic;
  String? description;
  DateTime? created;
  String? photo;
  String? url;
  int? group;
  int? createdBy;
  bool? positive;
  bool? emotion;
  bool? cultural;
  bool? physical;
  String? location;
  double? latitude;
  double? longitude;
  String? address;

  Info({
    this.id,
    this.topic,
    this.description,
    this.created,
    this.photo,
    this.url,
    this.group,
    this.createdBy,
    this.positive,
    this.emotion,
    this.cultural,
    this.physical,
    this.location,
    this.latitude,
    this.longitude,
    this.address,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
