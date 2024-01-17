import 'package:dio/dio.dart';
import 'package:teste_lojong/core/network/response_data.dart';

abstract class ServerAdapter {
  Future<ResponseData> get({
    required Map<String, dynamic> queries,
    required String url,
    RequestOptions options,
  });
}
