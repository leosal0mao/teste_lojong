import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/presentation/view/videos/widgets/video_list_tile.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_error.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_page_body.dart';

import '../../viewmodel/get_videos/bloc/get_videos_bloc.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  var videosBloc = getIt.get<GetVideosBloc>();
  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      child: BlocProvider(
        create: (context) {
          videosBloc.add(GetVideosListEvent(page: 1));
          return videosBloc;
        },
        child: BlocConsumer<GetVideosBloc, GetVideosState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetVideosLoading) {
              return const CustomLoading();
            }
            if (state is GetVideosFailure) {
              return const CustomErrorWidget();
            }
            if (state is GetVideosSuccess) {
              var videoList = state.videos;
              return ListView.builder(
                  itemCount: state.videos.length,
                  itemBuilder: (context, index) {
                    final video = videoList[index];
                    return VideoListTile(
                      videoTitle: video.name,
                      videoImg: video.imageUrl,
                      videoText: video.description,
                      videoUrl: video.awsUrl,
                      // videoUrl: video.url ?? video.url2 ?? video.awsUrl,
                    );
                  });
            }
            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
