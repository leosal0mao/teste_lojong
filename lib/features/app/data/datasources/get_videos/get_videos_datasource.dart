import 'package:teste_lojong/features/app/data/models/list_videos_model.dart';

abstract class GetVideosDatasource {
  Future<List<ListVideosModel>> getVideos({int? page});
}
