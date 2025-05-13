part of 'rocket_cubit.dart';

abstract class RocketState {}

class RocketInitial extends RocketState {}

class RocketLoading extends RocketState {
  final List<Rocket> rockets;
  final bool isRefresh;
  RocketLoading(this.rockets, {this.isRefresh = false});
}

class RocketLoaded extends RocketState {
  final List<Rocket> rockets;
  final bool hasMore;
  RocketLoaded(this.rockets, {this.hasMore = true});
}

class RocketError extends RocketState {
  final String message;
  final List<Rocket> rockets;
  RocketError(this.message, this.rockets);
}