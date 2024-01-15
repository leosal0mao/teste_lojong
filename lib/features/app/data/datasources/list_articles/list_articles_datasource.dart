import 'package:teste_lojong/features/app/data/models/articles_list_model.dart';

abstract class ListArticlesDatasource {
  Future<ArticlesListModel> getArticles({int? page});
}
