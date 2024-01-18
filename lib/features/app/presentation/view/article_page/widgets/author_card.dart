import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';

import '../../../widgets/custom_loading.dart';

class AuthorCard extends StatelessWidget {
  final String authorImg;
  final String authorName;
  final String authorDescription;

  const AuthorCard({
    super.key,
    required this.authorImg,
    required this.authorName,
    required this.authorDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              child: authorImg != ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: authorImg,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const CustomLoading(),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            Icons.error,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    )
                  : Image.asset('assets/images/placeholder_user.png'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: TextStyle(
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    authorDescription,
                    style: TextStyle(
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
