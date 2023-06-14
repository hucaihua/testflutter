import 'package:testflutter/generated/json/base/json_field.dart';
import 'package:testflutter/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
	String? id = '';
	String? name = '';
	int? age = 0;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	UserEntity copyWith({String? id, String? name, int? age}) {
		return UserEntity()
			..id= id ?? this.id
			..name= name ?? this.name
			..age= age ?? this.age;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}