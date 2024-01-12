import 'package:teste_lojong/core/injection/injection_container.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource.dart';
import 'package:teste_lojong/features/app/data/datasources/list_articles/list_articles_datasource_impl.dart';
import 'package:teste_lojong/features/app/data/repositories/list_articles/list_articles_impl.dart';
import 'package:teste_lojong/features/app/domain/interfaces/list_articles/list_articles_interface.dart';
import 'package:teste_lojong/features/app/domain/usecases/list_articles/get_articles_list.dart';

Future<void> initApp() async {
  //ArticlesList injections
  getIt.registerLazySingleton(() => GetArticleListUsecase(repository: getIt()));

  getIt.registerLazySingleton<ListArticlesDatasource>(
      () => ListArticlesDatasourceImpl(serverAdapter: getIt()));

  getIt.registerLazySingleton<ListArticlesInterface>(
      () => ListArticlesInterfaceImpl(datasource: getIt()));
  //
}
