import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/data/datasources/article_content/get_article_content_datasource.dart';
import 'package:teste_lojong/features/app/data/datasources/article_content/get_article_content_datasource_impl.dart';
import 'package:teste_lojong/features/app/data/datasources/get_quotes/get_quotes_datasource.dart';
import 'package:teste_lojong/features/app/data/datasources/get_quotes/get_quotes_datasource_impl.dart';
import 'package:teste_lojong/features/app/data/datasources/get_videos/get_videos_datasource.dart';
import 'package:teste_lojong/features/app/data/datasources/get_videos/get_videos_datasource_impl.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource_impl.dart';
import 'package:teste_lojong/features/app/data/repositories/article_content/get_article_content_interface_impl.dart';
import 'package:teste_lojong/features/app/data/repositories/get_videos/get_videos_interface_impl.dart';
import 'package:teste_lojong/features/app/data/repositories/list_articles/list_articles_interface_impl.dart';
import 'package:teste_lojong/features/app/domain/interfaces/article_content/get_article_content_interface.dart';
import 'package:teste_lojong/features/app/domain/interfaces/get_quotes/get_quotes_interface.dart';
import 'package:teste_lojong/features/app/domain/interfaces/get_videos/get_videos_interface.dart';
import 'package:teste_lojong/features/app/domain/interfaces/list_articles/list_articles_interface.dart';
import 'package:teste_lojong/features/app/domain/usecases/article_content/get_article_content_usecase.dart';
import 'package:teste_lojong/features/app/domain/usecases/get_quotes/get_quotes_usecase.dart';
import 'package:teste_lojong/features/app/domain/usecases/get_videos/get_videos_usecase.dart';
import 'package:teste_lojong/features/app/domain/usecases/list_articles/get_articles_list_usecase.dart';

import '../data/repositories/get_quotes/get_quotes_interface_impl.dart';

Future<void> initApp() async {
  //ArticlesList injections
  getIt.registerLazySingleton(() => GetArticleListUsecase(repository: getIt()));

  getIt.registerLazySingleton<ListArticlesDatasource>(
      () => ListArticlesDatasourceImpl(serverAdapter: getIt()));

  getIt.registerLazySingleton<ListArticlesInterface>(
      () => ListArticlesInterfaceImpl(datasource: getIt()));
  //

  //ArticleDetails injections
  getIt.registerLazySingleton(
      () => GetArticleContentUsecase(repository: getIt()));

  getIt.registerLazySingleton<GetArticleContentDatasource>(
      () => GetArticleContentDatasourceImpl(serverAdapter: getIt()));

  getIt.registerLazySingleton<GetArticleContentInterface>(
      () => GetArticleContentInterfaceImpl(datasource: getIt()));
  //

  //GetQuotes injections
  getIt.registerLazySingleton(() => GetQuotesUsecase(repository: getIt()));

  getIt.registerLazySingleton<GetQuotesDatasource>(
      () => GetQuotesDatasourceImpl(serverAdapter: getIt()));

  getIt.registerLazySingleton<GetQuotesInterface>(
      () => GetQuotesInterfaceImpl(datasource: getIt()));
  //

  //GetVideos injections
  getIt.registerLazySingleton(() => GetVideosUsecase(repository: getIt()));

  getIt.registerLazySingleton<GetVideosDatasource>(
      () => GetVideosDatasourceImpl(serverAdapter: getIt()));

  getIt.registerLazySingleton<GetVideosInterface>(
      () => GetVideosInterfaceImpl(datasource: getIt()));
}
