import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/features/app/domain/entities/article_content_entity.dart';
import 'package:teste_lojong/features/app/domain/usecases/article_content/get_article_content_usecase.dart';

part 'article_content_event.dart';
part 'article_content_state.dart';

class ArticleContentBloc
    extends Bloc<ArticleContentEvent, ArticleContentState> {
  GetArticleContentUsecase getArticleContentUsecase;

  ArticleContentBloc({required this.getArticleContentUsecase})
      : super(ArticleContentInitial()) {
    on<GetArticleContentEvent>((event, emit) async {
      emit(await getArticleContent(event: event, emit: emit));
    });
  }

  Future<ArticleContentState> getArticleContent({
    required GetArticleContentEvent event,
    required Emitter<ArticleContentState> emit,
  }) async {
    final result = await getArticleContentUsecase(
      ParamsGetArticleContentUsecase(articleId: event.id),
    );

    return result.fold((l) {
      emit(ArticleContentFailure(message: l.toString()));
      return const ArticleContentFailure(message: 'Failure');
    }, (r) {
      emit(ArticleContentSuccess(article: r.response));
      return ArticleContentSuccess(article: r.response);
    });
  }
}
