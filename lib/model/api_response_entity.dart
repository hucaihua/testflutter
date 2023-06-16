import 'dart:convert';

import 'package:dio/dio.dart';

import '../generated/json/base/json_convert_content.dart';
///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-11 11:13
///* @Comment: ApiResponseEntity , a model to represent the data from server
/// ```dart
/// eg:{
///       "code": 200,
///       "message": "success",
///       "headers": xxxx
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
	Headers? headers;

	ApiResponseEntity();

	factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);
	factory ApiResponseEntity.fromJsonString(String jsonInput) => $ApiResponseEntityFromJson<T>(jsonDecode(jsonInput));

	Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

	ApiResponseEntity copyWith({int? code, String? message, T? data , Headers? headers}) {
		return ApiResponseEntity()
			..code= code ?? this.code
			..message= message ?? this.message
			..data= data ?? this.data
			..headers= headers ?? this.headers;
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

	if(json.containsKey('headers') && json['headers'] != null){
		final Headers headers = Headers.fromMap(json['headers']);
		if (data != null) {
			apiResponseEntity.headers = headers;
		}
	}

	return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	data['headers'] = entity.headers?.value;
	return data;
}

