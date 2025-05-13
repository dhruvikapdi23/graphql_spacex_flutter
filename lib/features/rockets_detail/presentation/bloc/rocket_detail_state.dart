part of 'rocket_detail_cubit.dart';


abstract class RocketDetailState {}

class RocketDetailInitial extends RocketDetailState {}

class RocketDetailLoading extends RocketDetailState {}

class RocketDetailLoaded extends RocketDetailState {
  final dynamic rocket;
  RocketDetailLoaded(this.rocket);
}

class RocketDetailError extends RocketDetailState {
  final String message;
  RocketDetailError(this.message);
}