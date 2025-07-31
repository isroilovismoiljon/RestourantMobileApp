import 'package:dio/dio.dart';

class DioClient{
  static final dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.10.205:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );

}