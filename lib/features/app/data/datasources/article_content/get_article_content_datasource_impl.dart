import 'dart:convert';

import 'package:teste_lojong/core/network/helpers/endpoints.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:teste_lojong/features/app/data/datasources/article_content/get_article_content_datasource.dart';
import 'package:teste_lojong/features/app/data/models/article_content_model.dart';

class GetArticleContentDatasourceImpl implements GetArticleContentDatasource {
  final ServerAdapter serverAdapter;

  GetArticleContentDatasourceImpl({required this.serverAdapter});

  @override
  Future<ArticleContentModel> getArticleContent(int articleId) async {
    final response = await serverAdapter.get(
        queries: {},
        url: '${Endpoints.baseUrl}article-content?articleid=$articleId');

    return ArticleContentModel.fromJson(jsonDecode(response.data));
  }
}
