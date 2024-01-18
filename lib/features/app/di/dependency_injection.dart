import 'package:teste_lojong/features/app/presentation/viewmodel/article_content/bloc/bloc/article_content_bloc.dart';
import 'package:teste_lojong/features/app/presentation/viewmodel/get_videos/bloc/bloc/get_videos_bloc.dart';

import '../../../core/injection/injection_container.dart';
import '../data/datasources/article_content/get_article_content_datasource.dart';
import '../data/datasources/article_content/get_article_content_datasource_impl.dart';
import '../data/datasources/get_quotes/get_quotes_datasource.dart';
import '../data/datasources/get_quotes/get_quotes_datasource_impl.dart';
import '../data/datasources/get_videos/get_videos_datasource.dart';
import '../data/datasources/get_videos/get_videos_datasource_impl.dart';
import '../data/datasources/list_articles/list_articles_datasource.dart';
import '../data/datasources/list_articles/list_articles_datasource_impl.dart';
import '../data/repositories/article_content/get_article_content_interface_impl.dart';
import '../data/repositories/get_videos/get_videos_interface_impl.dart';
import '../data/repositories/list_articles/list_articles_interface_impl.dart';
import '../domain/interfaces/article_content/get_article_content_interface.dart';
import '../domain/interfaces/get_quotes/get_quotes_interface.dart';
import '../domain/interfaces/get_videos/get_videos_interface.dart';
import '../domain/interfaces/list_articles/list_articles_interface.dart';
import '../domain/usecases/article_content/get_article_content_usecase.dart';
import '../domain/usecases/get_quotes/get_quotes_usecase.dart';
import '../domain/usecases/get_videos/get_videos_usecase.dart';
import '../domain/usecases/list_articles/get_articles_list_usecase.dart';

import '../data/repositories/get_quotes/get_quotes_interface_impl.dart';
import '../presentation/viewmodel/list_articles/bloc/list_article_bloc.dart';

Future<void> initApp() async {
  //ArticlesList injections
  getIt.registerLazySingleton(
      () => GetArticleListUsecase(repository: getIt.get()));

  getIt.registerLazySingleton<ListArticlesDatasource>(
      () => ListArticlesDatasourceImpl(serverAdapter: getIt.get()));

  getIt.registerLazySingleton<ListArticlesInterface>(
      () => ListArticlesInterfaceImpl(datasource: getIt.get()));

  getIt.registerFactory<ListArticleBloc>(
      () => ListArticleBloc(getArticleListUsecase: getIt.get()));
  //

  //ArticleDetails injections
  getIt.registerLazySingleton(
      () => GetArticleContentUsecase(repository: getIt.get()));

  getIt.registerLazySingleton<GetArticleContentDatasource>(
      () => GetArticleContentDatasourceImpl(serverAdapter: getIt.get()));

  getIt.registerLazySingleton<GetArticleContentInterface>(
      () => GetArticleContentInterfaceImpl(datasource: getIt.get()));

  getIt.registerFactory<ArticleContentBloc>(
      () => ArticleContentBloc(getArticleContentUsecase: getIt.get()));
  //

  //GetQuotes injections
  getIt.registerLazySingleton(() => GetQuotesUsecase(repository: getIt.get()));

  getIt.registerLazySingleton<GetQuotesDatasource>(
      () => GetQuotesDatasourceImpl(serverAdapter: getIt.get()));

  getIt.registerLazySingleton<GetQuotesInterface>(
      () => GetQuotesInterfaceImpl(datasource: getIt.get()));
  //

  //GetVideos injections
  getIt.registerLazySingleton(() => GetVideosUsecase(repository: getIt.get()));

  getIt.registerLazySingleton<GetVideosDatasource>(
      () => GetVideosDatasourceImpl(serverAdapter: getIt.get()));

  getIt.registerLazySingleton<GetVideosInterface>(
      () => GetVideosInterfaceImpl(datasource: getIt.get()));

  getIt.registerFactory<GetVideosBloc>(
      () => GetVideosBloc(getVideosUsecase: getIt.get()));
}
