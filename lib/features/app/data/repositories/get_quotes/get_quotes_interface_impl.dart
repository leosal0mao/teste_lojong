import 'package:dartz/dartz.dart';

import 'package:teste_lojong/core/network/errors/failure.dart';

import '../../../domain/entities/list_quotes_entity.dart';
import '../../../domain/interfaces/get_quotes/get_quotes_interface.dart';
import '../../datasources/get_quotes/get_quotes_datasource.dart';

class GetQuotesInterfaceImpl implements GetQuotesInterface {
  final GetQuotesDatasource datasource;

  GetQuotesInterfaceImpl({required this.datasource});

  @override
  Future<Either<Failure, ListQuotesEntity>> getQuotes() async {
    try {
      final response = await datasource.getQuotes();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
