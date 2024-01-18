part of 'article_content_bloc.dart';

sealed class ArticleContentState extends Equatable {
  const ArticleContentState();

  @override
  List<Object> get props => [];
}

final class ArticleContentInitial extends ArticleContentState {}

final class ArticleContentLoading extends ArticleContentState {
  const ArticleContentLoading();

  @override
  List<Object> get props => [];
}

final class ArticleContentFailure extends ArticleContentState {
  final String message;

  const ArticleContentFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class ArticleContentSuccess extends ArticleContentState {
  final ArticleContentEntity article;

  const ArticleContentSuccess({required this.article});

  @override
  List<Object> get props => [article];
}
