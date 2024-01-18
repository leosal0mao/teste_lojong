import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:teste_lojong/core/network/errors/exception.dart';
import 'package:teste_lojong/core/network/helpers/constants.dart';
import 'package:teste_lojong/core/network/response_data.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ServerAdapterImpl implements ServerAdapter {
  Dio dio;

  ServerAdapterImpl({required this.dio});

  @override
  Future<ResponseData> get(
      {required Map<String, dynamic>? queries,
      required String url,
      RequestOptions? options}) async {
    var cacheDir = await getTemporaryDirectory();
    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: 'lojong_cache',
    );

    //request options to save cache for API calls
    const token = Constants.bearerToken;

    final requestOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      priority: CachePriority.high,
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
      hitCacheOnErrorExcept: [401, 403, 404],
    );

    dio = Dio(
      BaseOptions(headers: {
        'Authorization': 'Bearer $token',
      }),
    )..interceptors.addAll([
        ChuckerDioInterceptor(),
        DioCacheInterceptor(options: requestOptions),
      ]);

    try {
      final response = await dio.get(
        url,
        queryParameters: queries,
      );

      return ResponseData(
          statusCode: response.statusCode.toString(), data: response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.response!.data['message'],
      );
    }
  }
}
