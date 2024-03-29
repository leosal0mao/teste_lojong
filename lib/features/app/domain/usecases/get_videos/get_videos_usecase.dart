import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/core/usecase/usecase.dart';
import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';

import '../../interfaces/get_videos/get_videos_interface.dart';

class ParamsGetVideosUsecase {
  final int? page;
  const ParamsGetVideosUsecase({this.page});
}

class GetVideosResult {
  final List<ListVideosEntity> response;

  GetVideosResult({required this.response});
}

class GetVideosUsecase
    extends UseCase<GetVideosResult, ParamsGetVideosUsecase> {
  GetVideosInterface repository;

  GetVideosUsecase({required this.repository});
  @override
  Future<Either<Failure, GetVideosResult>> call(
      ParamsGetVideosUsecase params) async {
    final response = await repository.getVideos(page: params.page);

    return response.fold((failure) => Left(failure),
        (right) => Right(GetVideosResult(response: right)));
  }
}
