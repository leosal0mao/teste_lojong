import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/core/usecase/usecase.dart';
import 'package:teste_lojong/features/app/domain/entities/article_content_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/article_content/get_article_content_interface.dart';

class ParamsGetArticleContentUsecase {
  final int articleId;
  const ParamsGetArticleContentUsecase({required this.articleId});
}

class GetArticleContentResult {
  final ArticleContentEntity response;

  GetArticleContentResult({required this.response});
}

class GetArticleContentUsecase
    extends UseCase<GetArticleContentResult, ParamsGetArticleContentUsecase> {
  GetArticleContentInterface repository;

  GetArticleContentUsecase({required this.repository});
  @override
  Future<Either<Failure, GetArticleContentResult>> call(
      ParamsGetArticleContentUsecase params) async {
    final response = await repository.getArticleContent(params.articleId);

    return response.fold((failure) => Left(failure),
        (right) => Right(GetArticleContentResult(response: right)));
  }
}
