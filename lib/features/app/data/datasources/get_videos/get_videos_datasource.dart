import 'package:teste_lojong/features/app/data/models/list_videos_model.dart';

abstract class GetVideosDatasource {
  Future<ListVideosModel> getVideos({int? page});
}
