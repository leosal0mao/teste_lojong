import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/presentation/view/article_page/widgets/author_card.dart';
import 'package:teste_lojong/features/app/presentation/view/article_page/widgets/share_button.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_error.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';

import '../../../../../core/constants/colors.dart';
import '../../viewmodel/article_content/bloc/article_content_bloc.dart';

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                              child: CachedNetworkImage(
                                imageUrl: state.article.imageUrl,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CustomLoading(),
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
                        const SizedBox(height: 10),
                        Text(
                          state.article.title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Html(
                          data: state.article.fullText,
                          style: {
                            'p': Style(
                              color: AppColors.titleColor,
                              alignment: Alignment.center,
                              textAlign: TextAlign.justify,
                              fontWeight: FontWeight.w500,
                            )
                          },
                        ),
                        const SizedBox(height: 15),
                        AuthorCard(
                          authorDescription: state.article.authorDescription,
                          authorImg: state.article.authorImage,
                          authorName: state.article.authorName,
                        ),
                        const SizedBox(height: 15),
                        ShareButton(onTap: () async {
                          await Clipboard.setData(
                                  ClipboardData(text: state.article.url))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text(
                                    'Link copiado para a área de transferência'),
                              ),
                            );
                          });
                        }),
                      ],
                    ),
                  ),
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
