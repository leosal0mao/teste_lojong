import 'package:dartz/dartz.dart';

import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/data/datasources/get_videos/get_videos_datasource.dart';
import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';
import 'package:teste_lojong/features/app/domain/interfaces/get_videos/get_videos_interface.dart';

class GetVideosInterfaceImpl implements GetVideosInterface {
  final GetVideosDatasource datasource;

  GetVideosInterfaceImpl({required this.datasource});

  @override
  Future<Either<Failure, ListVideosEntity>> getVideos() async {
    try {
      final response = await datasource.getVideos();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
