import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';

import '../../entities/articles_list_entity.dart';

abstract class ListArticlesInterface {
  Future<Either<Failure, ArticlesListEntity>> getArticles();
}
