import 'package:dartz/dartz.dart';

import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource.dart';
import 'package:teste_lojong/features/app/domain/entities/articles_list_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/list_articles/list_articles_interface.dart';

class ListArticlesInterfaceImpl implements ListArticlesInterface {
  final ListArticlesDatasource datasource;

  ListArticlesInterfaceImpl({required this.datasource});
  @override
  Future<Either<Failure, ArticlesListEntity>> getArticles({int? page}) async {
    try {
      final response = await datasource.getArticles(page: page ?? 1);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
