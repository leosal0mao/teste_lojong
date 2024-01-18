import 'package:flutter/material.dart';
import 'package:teste_lojong/features/app/presentation/view/article_page/article_page.dart';
import 'package:teste_lojong/features/app/presentation/view/home/home_page.dart';

final routes = {
  '/': (context) => const HomePage(),
  '/article': (context) {
    final articleId = ModalRoute.of(context)?.settings.arguments as int;
    return ArticlePage(articleId: articleId);
  },
};
