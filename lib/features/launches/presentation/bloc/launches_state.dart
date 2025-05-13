
abstract class LaunchesState {}

class LaunchesInitial extends LaunchesState {}

class LaunchesLoading extends LaunchesState {
  final List launches;
  final bool isRefresh;
  LaunchesLoading(this.launches, {this.isRefresh = false});
}

class LaunchesLoaded extends LaunchesState {
  final List launches;
  final bool hasMore;
  LaunchesLoaded(this.launches, {this.hasMore = true});
}

class LaunchesError extends LaunchesState {
  final String message;
  final List launches;
  LaunchesError(this.message, this.launches);
}