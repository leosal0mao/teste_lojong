import 'package:teste_lojong/core/network/errors/exception.dart';
import 'package:teste_lojong/core/network/response_data.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:dio/dio.dart';

class ServerAdapterImpl implements ServerAdapter {
  final Dio dio;

  ServerAdapterImpl({required this.dio});

  @override
  Future<ResponseData> get(
      {required Map<String, dynamic>? queries, required String url}) async {
    try {
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
