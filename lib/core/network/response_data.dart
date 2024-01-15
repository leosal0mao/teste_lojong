import 'package:dio/dio.dart';

class ResponseData {
  final String statusCode;
  final dynamic data;
  final RequestOptions? options;

  ResponseData({
    required this.statusCode,
    required this.data,
    this.options,
  });
}
