part of 'get_videos_bloc.dart';

sealed class GetVideosEvent extends Equatable {
  const GetVideosEvent();

  @override
  List<Object> get props => [];
}

final class GetVideosListEvent extends GetVideosEvent {
  final int page;
  const GetVideosListEvent({required this.page});

  @override
  List<Object> get props => [];
}
