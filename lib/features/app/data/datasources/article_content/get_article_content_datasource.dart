import 'package:teste_lojong/features/app/data/models/article_content_model.dart';

abstract class GetArticleContentDatasource {
  Future<ArticleContentModel> getArticleContent(int articleId);
}
