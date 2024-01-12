import 'dart:convert';

import 'package:teste_lojong/core/network/helpers/endpoints.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource.dart';
import 'package:teste_lojong/features/app/data/models/articles_list_model.dart';

class ListArticlesDatasourceImpl implements ListArticlesDatasource {
  final ServerAdapter serverAdapter;

  ListArticlesDatasourceImpl({required this.serverAdapter});
  @override
  Future<ArticlesListModel> getArticles() async {
    final response = await serverAdapter
        .get(queries: {}, url: '${Endpoints.baseUrl}/articles2');
    return ArticlesListModel.fromJson(jsonDecode(response.data));
  }
}
