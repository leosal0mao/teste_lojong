import 'package:dartz/dartz.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';

abstract class GetVideosInterface {
  Future<Either<Failure, ListVideosEntity>> getVideos();
}
