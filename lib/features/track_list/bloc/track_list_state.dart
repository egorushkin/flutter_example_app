part of 'track_list_bloc.dart';

abstract class TrackListState extends Equatable {
  const TrackListState();

  @override
  List<Object> get props => [];
}

class TrackListLoading extends TrackListState {}

class TrackListLoaded extends TrackListState {
  final TracksResponse tracksResponse;

  TrackListLoaded(this.tracksResponse);

  @override
  List<Object> get props => [tracksResponse];
}
