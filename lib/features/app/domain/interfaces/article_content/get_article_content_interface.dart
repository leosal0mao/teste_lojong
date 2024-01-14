import 'package:dartz/dartz.dart';
import 'package:teste_lojong/features/app/domain/entities/article_content_entity.dart';
import '../../../../../core/network/errors/failure.dart';

abstract interface class GetArticleContentInterface {
  Future<Either<Failure, ArticleContentEntity>> getArticleContent(
      int articleId);
}
