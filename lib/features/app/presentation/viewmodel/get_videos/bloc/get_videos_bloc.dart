import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';

import '../../../../domain/usecases/get_videos/get_videos_usecase.dart';

part 'get_videos_event.dart';
part 'get_videos_state.dart';

class GetVideosBloc extends Bloc<GetVideosEvent, GetVideosState> {
  final GetVideosUsecase getVideosUsecase;

  GetVideosBloc({required this.getVideosUsecase}) : super(GetVideosInitial()) {
    on<GetVideosListEvent>((event, emit) async {
      emit(await getVideos(event: event, emit: emit));
    });
  }

  Future<GetVideosState> getVideos({
    required GetVideosListEvent event,
    required Emitter<GetVideosState> emit,
  }) async {
    final result = await getVideosUsecase(
      ParamsGetVideosUsecase(page: event.page),
    );

    return result.fold((l) {
      emit(GetVideosFailure(message: l.toString()));
      return const GetVideosFailure(message: 'Failure');
    }, (r) {
      emit(GetVideosSuccess(videos: r.response));
      return GetVideosSuccess(videos: r.response);
    });
  }
}
