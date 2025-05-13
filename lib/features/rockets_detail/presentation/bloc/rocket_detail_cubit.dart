import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

import '../../../rockets/domain/repositories/rockets_repository.dart';
import '../../data/models/rockets_detail_model.dart';
import '../../domain/repositories/rocket_detail_repository.dart';

part 'rocket_detail_state.dart';

class RocketDetailCubit extends Cubit<RocketDetailState> {
  final RocketDetailRepository repository;

  RocketDetailCubit(this.repository) : super(RocketDetailInitial());

  Future<void> fetchRocketDetail(BuildContext context) async {
    dynamic id = GoRouterState.of(context).extra;
log("id: $id");
    emit(RocketDetailLoading());
    try {
      final rocket = await repository.getRocketById(id['id']);
      emit(RocketDetailLoaded(rocket));
    } catch (e) {
      emit(RocketDetailError(e.toString()));
    }
  }
}
