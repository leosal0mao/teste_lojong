import 'dart:convert';

import 'package:teste_lojong/core/network/helpers/endpoints.dart';
import 'package:teste_lojong/core/network/server_adapter.dart';
import 'package:teste_lojong/features/app/data/datasources/get_videos/get_videos_datasource.dart';
import 'package:teste_lojong/features/app/data/models/list_videos_model.dart';

class GetVideosDatasourceImpl implements GetVideosDatasource {
  final ServerAdapter serverAdapter;

  GetVideosDatasourceImpl({required this.serverAdapter});
  @override
  Future<ListVideosModel> getVideos({int? page}) async {
    final queries = <String, dynamic>{
      if (page != null) 'page': page,
    };

    final response = await serverAdapter.get(
        queries: queries, url: '${Endpoints.baseUrl}videos');
    return ListVideosModel.fromJson(jsonDecode(response.data));
  }
}
