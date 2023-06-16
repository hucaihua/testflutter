import 'package:testflutter/generated/json/base/json_field.dart';
import 'package:testflutter/generated/json/profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProfileEntity {
	String? user = '';
	String? token = '';
	int theme = 0;
	String? cache = '';
	String? lastLogin = '';
	String? locale = '';
	bool isDarkMode = false;

	ProfileEntity();

	factory ProfileEntity.fromJson(Map<String, dynamic> json) => $ProfileEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProfileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}