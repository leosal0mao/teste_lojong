import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_button.dart';

class ArticleListTile extends StatelessWidget {
  final String articleTitle;
  final String articleImg;
  final String articleText;
  final Function() onTap;
  const ArticleListTile({
    super.key,
    required this.articleTitle,
    required this.articleImg,
    required this.articleText,
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
                  child: Image.network(
                    articleImg,
                    fit: BoxFit.cover,
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
            buttonIcon: Icons.share,
            iconColor: AppColors.titleColor,
            buttonText: 'Compartilhar',
            onTap: () {},
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
