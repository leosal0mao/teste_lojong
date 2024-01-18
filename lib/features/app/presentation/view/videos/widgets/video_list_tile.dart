import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_button.dart';
import 'package:teste_lojong/features/app/presentation/widgets/video_player_widget.dart';

import '../../../widgets/custom_loading.dart';

class VideoListTile extends StatefulWidget {
  final String videoTitle;
  final String videoImg;
  final String videoText;
  final String videoUrl;
  const VideoListTile({
    super.key,
    required this.videoTitle,
    required this.videoImg,
    required this.videoText,
    required this.videoUrl,
  });

  @override
  State<VideoListTile> createState() => _VideoListTileState();
}

class _VideoListTileState extends State<VideoListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          widget.videoTitle.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.titleColor, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: AspectRatio(
                aspectRatio: 21 / 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: VideoPlayerWidget(
                    videoImg: widget.videoImg,
                    videoUrl: widget.videoUrl,
                  ),
                  // CachedNetworkImage(
                  //   imageUrl: widget.videoImg,
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: imageProvider,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //   placeholder: (context, url) => const CustomLoading(),
                  //   errorWidget: (context, url, error) => Center(
                  //     child: Icon(
                  //       Icons.error,
                  //       color: AppColors.mainColor,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.videoText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.titleColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          CustomButton(
            buttonTextColor: AppColors.titleColor,
            buttonColor: AppColors.greyBackground,
            buttonIcon: Icons.share,
            iconColor: AppColors.titleColor,
            buttonText: 'Compartilhar',
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: widget.videoUrl))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Link copiado para a área de transferência'),
                  ),
                );
              });
            },
          ),
          const SizedBox(height: 5),
          Divider(
            color: AppColors.shadowColor,
            thickness: 1,
          )
        ]),
      ),
    );
  }
}
