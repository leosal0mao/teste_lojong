import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:teste_lojong/core/network/errors/exception.dart';
import 'package:teste_lojong/core/network/helpers/constants.dart';
import 'package:teste_lojong/core/network/response_data.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:dio/dio.dart';

class ServerAdapterImpl implements ServerAdapter {
  final Dio dio;

  ServerAdapterImpl({required this.dio});

  @override
  Future<ResponseData> get(
      {required Map<String, dynamic>? queries,
      required String url,
      RequestOptions? options}) async {
    try {
      const token = Constants.bearerToken;
      dio.interceptors.add(ChuckerDioInterceptor());
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(url, queryParameters: queries);

      return ResponseData(
          statusCode: response.statusCode.toString(), data: response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.response!.data['message'],
      );
    }
  }
}
