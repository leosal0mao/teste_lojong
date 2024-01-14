import 'package:dartz/dartz.dart';
import 'package:teste_lojong/features/app/domain/entities/list_quotes_entity.dart';

import '../../../../../core/network/errors/failure.dart';

abstract interface class GetQuotesInterface {
  Future<Either<Failure, ListQuotesEntity>> getQuotes();
}
