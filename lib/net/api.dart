import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testflutter/model/http_bin_entity.dart';
import 'package:testflutter/model/user_entity.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: Api
///* use follow to generate code.
/// ```dart
/// flutter pub run build_runner build --delete-conflicting-outputs
///```

part 'api.g.dart';

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
