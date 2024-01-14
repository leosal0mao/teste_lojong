import 'dart:convert';

import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:teste_lojong/features/app/data/datasources/get_quotes/get_quotes_datasource.dart';
import 'package:teste_lojong/features/app/data/models/list_quote_model.dart';

import '../../../../../core/network/helpers/endpoints.dart';

class GetQuotesDatasourceImpl implements GetQuotesDatasource {
  final ServerAdapter serverAdapter;

  GetQuotesDatasourceImpl({required this.serverAdapter});
  @override
  Future<ListQuoteModel> getQuotes() async {
    final response = await serverAdapter
        .get(queries: {}, url: '${Endpoints.baseUrl}quotes2');
    return ListQuoteModel.fromJson(jsonDecode(response.data));
  }
}
