import 'dart:convert';

import '../generated/json/base/json_convert_content.dart';
///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-11 11:13
///* @Comment: ApiResponseEntity , a model to represent the data from server
/// ```dart
/// eg:{
///       "code": 200,
///       "message": "success",
///       "data":{
///         xxxx
///       }
///     }
///```

/// ### attention: need to hot restart when add a new entity.

class ApiResponseEntity<T> {
	int? code = 0;
	String? message = '';
	T? data;

	ApiResponseEntity();

	factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);
	factory ApiResponseEntity.fromJsonString(String jsonInput) => $ApiResponseEntityFromJson<T>(jsonDecode(jsonInput));

	Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

	ApiResponseEntity copyWith({int? code, String? message, T? data}) {
		return ApiResponseEntity()
			..code= code ?? this.code
			..message= message ?? this.message
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
	final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity<T>();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponseEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponseEntity.message = message;
	}
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		apiResponseEntity.data = data;
	}
	return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

