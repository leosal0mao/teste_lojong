import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_error.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_page_body.dart';

import '../../viewmodel/list_articles/bloc/list_article_bloc.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  var listArticleBloc = getIt.get<ListArticleBloc>();
  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      child: BlocProvider(
        create: (context) {
          listArticleBloc.add(GetListArticleEvent(page: 1));
          return listArticleBloc;
        },
        child: BlocConsumer<ListArticleBloc, ListArticleState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ListArticleLoading) {
              return const CustomLoading();
            }
            if (state is ListArticleFailure) {
              return const CustomErrorWidget();
            }
            if (state is ListArticleSuccess) {
              return const Center(
                child: Text('deu'),
              );
            }
            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
