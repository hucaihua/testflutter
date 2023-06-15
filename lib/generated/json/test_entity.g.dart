import 'package:testflutter/generated/json/base/json_convert_content.dart';
import 'package:testflutter/model/test_entity.dart';

TestEntity $TestEntityFromJson(Map<String, dynamic> json) {
	final TestEntity testEntity = TestEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		testEntity.name = name;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		testEntity.address = address;
	}
	return testEntity;
}

Map<String, dynamic> $TestEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['address'] = entity.address;
	return data;
}