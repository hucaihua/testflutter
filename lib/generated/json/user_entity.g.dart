import 'package:testflutter/generated/json/base/json_convert_content.dart';
import 'package:testflutter/model/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userEntity.name = name;
	}
	final int? age = jsonConvert.convert<int>(json['age']);
	if (age != null) {
		userEntity.age = age;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['age'] = entity.age;
	return data;
}