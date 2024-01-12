part of 'list_article_bloc.dart';

sealed class ListArticleEvent extends Equatable {
  const ListArticleEvent();

  @override
  List<Object> get props => [];
}

final class GetListArticleEvent extends ListArticleEvent {
  final int page;
  const GetListArticleEvent({required this.page});

  @override
  List<Object> get props => [];
}
