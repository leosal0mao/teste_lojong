import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/core/usecase/usecase.dart';
import 'package:teste_lojong/features/app/domain/entities/list_quotes_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/get_quotes/get_quotes_interface.dart';

class ParamsGetQuotesUsecase {
  const ParamsGetQuotesUsecase();
}

class GetQuotesResult {
  final ListQuotesEntity response;

  GetQuotesResult({required this.response});
}

class GetQuotesUsecase
    extends UseCase<GetQuotesResult, ParamsGetQuotesUsecase> {
  GetQuotesInterface repository;

  GetQuotesUsecase({required this.repository});
  @override
  Future<Either<Failure, GetQuotesResult>> call(
      ParamsGetQuotesUsecase params) async {
    final response = await repository.getQuotes();

    return response.fold((failure) => Left(failure),
        (right) => Right(GetQuotesResult(response: right)));
  }
}
