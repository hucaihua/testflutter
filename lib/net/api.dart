import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testflutter/model/http_bin_entity.dart';
import 'package:testflutter/model/user_entity.dart';
import 'package:testflutter/net/interceptors/token_interceptor.dart';

import 'interceptors/log_interceptor.dart';
import 'interceptors/network_interceptor.dart';
import 'interceptors/request_option_interceptor.dart';
import 'interceptors/response_interceptor.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: Api
///* use follow to generate code.
/// ```dart
/// flutter pub run build_runner build --delete-conflicting-outputs
///```

part 'api.g.dart';

class Api {
  static final _dio = Dio();
  static final client = Retrofit(_dio);

  Api() {
    _dio.interceptors.add(RequestOptionInterceptors());

    _dio.interceptors.add(TokenInterceptors());

    _dio.interceptors.add(LogsInterceptors());

    _dio.interceptors.add(NetworkInterceptors());

    _dio.interceptors.add(ResponseInterceptors());
  }
}

@RestApi(baseUrl: "http://httpbin.org")
abstract class Retrofit {
  factory Retrofit(Dio dio, {String baseUrl}) = _Retrofit;

  @POST("http://httpbin.org/post")
  Future<void> createNewTaskFromFile(@Part() File file);

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(@Field() String hello);

  @GET("/get")
  Future<HttpBinEntity> queryTest(@Query("apikey") String apiKey, @Query("scope") String scope, @Query("type") String type, @Query("from") int from);

  @GET("/get")
  Future<HttpBinEntity> testHeader(@Header("Content-Type") String contentType);

  @POST("/post")
  Future<HttpBinEntity> testPostUser(@Body() UserEntity user);
}

// abstract class Net {
//   @GET("/get/{id}")
//   Future<HttpBinEntity> testGet(@Path("id") String id);
//
//   @POST("http://httpbin.org/post")
//   Future<void> createNewTaskFromFile(@Part() File file);
//
//   @POST("http://httpbin.org/post")
//   @FormUrlEncoded()
//   Future<String> postUrlEncodedFormData(@Field() String hello);
//
//   @GET("/get")
//   Future<String> queryTest(@Query("apikey") String apiKey, @Query("scope") String scope, @Query("type") String type, @Query("from") int from);
//
//   @GET("/get")
//   Future<HttpBinEntity> testHeader(@Header("Content-Type") String contentType);
//
//   @POST("/post")
//   Future<HttpBinEntity> createTask(@Body() UserEntity user);
// }
