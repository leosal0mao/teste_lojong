import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/features/app/domain/entities/list_quotes_entity.dart';
import 'package:teste_lojong/features/app/domain/usecases/get_quotes/get_quotes_usecase.dart';

part 'get_quotes_event.dart';
part 'get_quotes_state.dart';

class GetQuotesBloc extends Bloc<GetQuotesEvent, GetQuotesState> {
  final GetQuotesUsecase getQuotesUsecase;
  GetQuotesBloc({required this.getQuotesUsecase}) : super(GetQuotesInitial()) {
    on<GetQuotesListEvent>((event, emit) async {
      emit(await getQuotes(event: event, emit: emit));
    });
  }

  Future<GetQuotesState> getQuotes({
    required GetQuotesListEvent event,
    required Emitter<GetQuotesState> emit,
  }) async {
    final result = await getQuotesUsecase(
      ParamsGetQuotesUsecase(page: event.page),
    );

    return result.fold((l) {
      emit(GetQuotesFailure(message: l.toString()));
      return const GetQuotesFailure(message: 'Failure');
    }, (r) {
      emit(GetQuotesSuccess(quotes: r.response));
      return GetQuotesSuccess(quotes: r.response);
    });
  }
}
