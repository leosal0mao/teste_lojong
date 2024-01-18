part of 'get_quotes_bloc.dart';

sealed class GetQuotesState extends Equatable {
  const GetQuotesState();

  @override
  List<Object> get props => [];
}

final class GetQuotesInitial extends GetQuotesState {}

final class GetQuotesLoading extends GetQuotesState {
  const GetQuotesLoading();

  @override
  List<Object> get props => [];
}

final class GetQuotesFailure extends GetQuotesState {
  final String message;
  const GetQuotesFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetQuotesSuccess extends GetQuotesState {
  final ListQuotesEntity quotes;

  const GetQuotesSuccess({required this.quotes});

  @override
  List<Object> get props => [quotes];
}
