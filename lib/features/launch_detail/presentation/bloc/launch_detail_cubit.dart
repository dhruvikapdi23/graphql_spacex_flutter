import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../domain/repositories/launch_detail_repository.dart';

part 'launch_detail_state.dart';

class LaunchDetailCubit extends Cubit<LaunchDetailState> {
  final LaunchDetailRepository repository;

  LaunchDetailCubit(this.repository) : super(LaunchDetailInitial());

  Future<void> fetchLaunchDetail(BuildContext context) async {
    dynamic id = GoRouterState.of(context).extra;
log("id: $id");
    emit(LaunchDetailLoading());
    try {
      final rocket = await repository.getLaunchById(id['id']);
      emit(LaunchDetailLoaded(rocket));
    } catch (e) {
      emit(LaunchDetailError(e.toString()));
    }
  }
}
