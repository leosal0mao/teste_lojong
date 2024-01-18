part of 'get_quotes_bloc.dart';

sealed class GetQuotesEvent extends Equatable {
  const GetQuotesEvent();

  @override
  List<Object> get props => [];
}

final class GetQuotesListEvent extends GetQuotesEvent {
  final int page;

  const GetQuotesListEvent({required this.page});

  @override
  List<Object> get props => [page];
}
