part of 'launch_detail_cubit.dart';


abstract class LaunchDetailState {}

class LaunchDetailInitial extends LaunchDetailState {}

class LaunchDetailLoading extends LaunchDetailState {}

class LaunchDetailLoaded extends LaunchDetailState {
  final dynamic launch;
  LaunchDetailLoaded(this.launch);
}

class LaunchDetailError extends LaunchDetailState {
  final String message;
  LaunchDetailError(this.message);
}