import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/data/datasources/article_content/get_article_content_datasource.dart';
import 'package:teste_lojong/features/app/domain/entities/article_content_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/article_content/get_article_content_interface.dart';

class GetArticleContentInterfaceImpl implements GetArticleContentInterface {
  final GetArticleContentDatasource datasource;

  GetArticleContentInterfaceImpl({required this.datasource});
  @override
  Future<Either<Failure, ArticleContentEntity>> getArticleContent(
      int articleId) async {
    try {
      final response = await datasource.getArticleContent(articleId);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
