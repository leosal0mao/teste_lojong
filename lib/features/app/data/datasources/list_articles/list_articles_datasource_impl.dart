import 'dart:convert';

import 'package:teste_lojong/core/network/helpers/endpoints.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource.dart';
import 'package:teste_lojong/features/app/data/models/articles_list_model.dart';

class ListArticlesDatasourceImpl implements ListArticlesDatasource {
  final ServerAdapter serverAdapter;

  ListArticlesDatasourceImpl({required this.serverAdapter});
  @override
  Future<ArticlesListModel> getArticles({int? page}) async {
    final queries = <String, dynamic>{
      if (page != null) 'page': page,
    };
    final response = await serverAdapter.get(
        queries: queries, url: '${Endpoints.baseUrl}articles2');

    final jsonResponse = jsonEncode(response.data);

    return ArticlesListModel.fromJson(jsonDecode(jsonResponse));
  }
}
