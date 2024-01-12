part of 'list_article_bloc.dart';

sealed class ListArticleState extends Equatable {
  const ListArticleState();

  @override
  List<Object> get props => [];
}

final class ListArticleInitial extends ListArticleState {}

final class ListArticleLoading extends ListArticleState {
  const ListArticleLoading();

  @override
  List<Object> get props => [];
}

final class ListArticleFailure extends ListArticleState {
  final String message;

  const ListArticleFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class ListArticleSuccess extends ListArticleState {
  final ArticlesListEntity articles;

  const ListArticleSuccess({required this.articles});

  @override
  List<Object> get props => [articles];
}
