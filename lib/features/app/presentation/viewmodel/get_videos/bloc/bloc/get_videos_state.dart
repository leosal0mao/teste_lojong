part of 'get_videos_bloc.dart';

sealed class GetVideosState extends Equatable {
  const GetVideosState();

  @override
  List<Object> get props => [];
}

final class GetVideosInitial extends GetVideosState {}

final class GetVideosLoading extends GetVideosState {
  const GetVideosLoading();

  @override
  List<Object> get props => [];
}

final class GetVideosFailure extends GetVideosState {
  final String message;

  const GetVideosFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetVideosSuccess extends GetVideosState {
  final List<ListVideosEntity> videos;

  const GetVideosSuccess({required this.videos});

  @override
  List<Object> get props => [videos];
}
