import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/core/usecase/usecase.dart';
import 'package:teste_lojong/features/app/domain/entities/articles_list_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/list_articles/list_articles_interface.dart';

class ParamsGetArticlesListUsecase {
  const ParamsGetArticlesListUsecase();
}

class GetArticlesListResult {
  final ArticlesListEntity response;

  GetArticlesListResult({required this.response});
}

class GetArticleListUsecase
    extends UseCase<GetArticlesListResult, ParamsGetArticlesListUsecase> {
  ListArticlesInterface repository;

  GetArticleListUsecase({required this.repository});
  @override
  Future<Either<Failure, GetArticlesListResult>> call(
      ParamsGetArticlesListUsecase params) async {
    final result = await repository.getArticles();

    return result.fold(
      (failure) => Left(failure),
      (result) => Right(GetArticlesListResult(response: result)),
    );
  }
}
