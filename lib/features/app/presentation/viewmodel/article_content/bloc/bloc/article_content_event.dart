part of 'article_content_bloc.dart';

sealed class ArticleContentEvent extends Equatable {
  const ArticleContentEvent();

  @override
  List<Object> get props => [];
}

class GetArticleContentEvent extends ArticleContentEvent {
  final int id;
  const GetArticleContentEvent({required this.id});

  @override
  List<Object> get props => [id];
}
