import 'package:testflutter/generated/json/base/json_field.dart';
import 'package:testflutter/generated/json/test_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TestEntity {
	String? name = '';
	String? address = '';

	TestEntity();

	factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

	Map<String, dynamic> toJson() => $TestEntityToJson(this);

	TestEntity copyWith({String? name, String? address}) {
		return TestEntity()
			..name= name ?? this.name
			..address= address ?? this.address;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}