import 'package:dartz/dartz.dart';

import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/data/datasources/get_videos/get_videos_datasource.dart';
import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/get_videos/get_videos_interface.dart';

class GetVideosInterfaceImpl implements GetVideosInterface {
  final GetVideosDatasource datasource;

  GetVideosInterfaceImpl({required this.datasource});

  @override
  Future<Either<Failure, List<ListVideosEntity>>> getVideos({int? page}) async {
    try {
      final response = await datasource.getVideos(page: page);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
