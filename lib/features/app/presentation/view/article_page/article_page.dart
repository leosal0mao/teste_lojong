import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/presentation/view/article_page/widgets/artist_card.dart';
import 'package:teste_lojong/features/app/presentation/viewmodel/article_content/bloc/bloc/article_content_bloc.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_error.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';

import '../../../../../core/constants/colors.dart';

class ArticlePage extends StatefulWidget {
  final int articleId;
  String? articleImg;
  String? articleTitle;
  String? fullText;
  ArticlePage({
    super.key,
    this.articleImg,
    this.articleTitle,
    this.fullText,
    required this.articleId,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  var articleBloc = getIt.get<ArticleContentBloc>();

  @override
  void initState() {
    articleBloc.add(GetArticleContentEvent(id: widget.articleId));
    super.initState();
  }

  @override
  void dispose() {
    articleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final htmlData = widget.fullText;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      body: BlocProvider(
        create: (context) => articleBloc,
        child: BlocBuilder<ArticleContentBloc, ArticleContentState>(
          builder: (context, state) {
            if (state is ArticleContentLoading) {
              return const CustomLoading();
            }
            if (state is ArticleContentFailure) {
              return const CustomErrorWidget();
            }
            if (state is ArticleContentSuccess) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: AspectRatio(
                          aspectRatio: 21 / 10,
                          child: Image.network(
                            widget.articleImg!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.articleTitle!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Html(data: htmlData),
                    const SizedBox(height: 10),
                    const ArtistCard(),
                  ],
                ),
              );
            }
            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
