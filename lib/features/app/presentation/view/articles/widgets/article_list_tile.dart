import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_button.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';

class ArticleListTile extends StatelessWidget {
  final String articleTitle;
  final String articleImg;
  final String articleText;
  final Function() onTap;
  final String articleUrl;
  const ArticleListTile({
    super.key,
    required this.articleTitle,
    required this.articleImg,
    required this.articleText,
    required this.articleUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          articleTitle.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.titleColor, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(children: [
          InkWell(
            onTap: onTap,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AspectRatio(
                  aspectRatio: 21 / 10,
                  child: CachedNetworkImage(
                    imageUrl: articleImg,
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
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            articleText,
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
              await Clipboard.setData(ClipboardData(text: articleUrl))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Link copiado para a área de transferência'),
                  ),
                );
              });
              // copied successfully
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
