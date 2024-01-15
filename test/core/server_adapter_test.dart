import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/core/network/errors/exception.dart';
import 'package:teste_lojong/core/network/response_data.dart';
import 'package:teste_lojong/core/network/server_adapter_impl.dart';

class DioMock extends Mock implements Dio {}

class ServerErrorMock extends Mock implements ServerException {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  late DioMock dio;
  late ServerAdapterImpl server;
  late String endpoint;
  late Map<String, dynamic> queries;
  late RequestOptionsMock requestOptions;

  setUpAll(() {
    dio = DioMock();
    server = ServerAdapterImpl(dio: dio);
    endpoint = faker.internet.httpUrl();
    queries = {};
    requestOptions = RequestOptionsMock();
  });

  test('Teste status code 200', () async {
    when(() => dio.get(endpoint, queryParameters: queries)).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await server.get(queries: queries, url: endpoint);

    expect(result, isA<Response>());

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(ServerErrorMock());

    expect(
        () async => await server.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<ServerException>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro generico dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(Exception());

    expect(
        () async => await server.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<Exception>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });
}
