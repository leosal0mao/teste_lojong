import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_lojong/features/app/domain/entities/articles_list_entity.dart';
import 'package:teste_lojong/features/app/domain/usecases/list_articles/get_articles_list_usecase.dart';

part 'list_article_event.dart';
part 'list_article_state.dart';

class ListArticleBloc extends Bloc<ListArticleEvent, ListArticleState> {
  final GetArticleListUsecase getArticleListUsecase;

  ListArticleBloc(this.getArticleListUsecase) : super(ListArticleInitial()) {
    on<ListArticleEvent>((event, emit) {});
  }

  Future<ListArticleState> getListArticles({
    required GetListArticleEvent event,
    required Emitter<ListArticleState> emit,
  }) async {
    final result = await getArticleListUsecase(
        ParamsGetArticlesListUsecase(page: event.page));

    return result.fold((l) {
      emit(ListArticleFailure(message: l.toString()));
      return const ListArticleFailure(message: 'Failure');
    }, (r) {
      emit(ListArticleSuccess(articles: r.response));
      return ListArticleSuccess(articles: r.response);
    });
  }
}
