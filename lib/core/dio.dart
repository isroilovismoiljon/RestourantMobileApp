import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.11.40:8888/api/v1",
    validateStatus: (status) => true,
  ),
);
