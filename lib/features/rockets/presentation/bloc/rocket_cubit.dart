import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/rockets.dart';
import '../../domain/repositories/rockets_repository.dart';

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit(this._repository) : super(RocketInitial());

  final RocketRepository _repository;
  final int _limit = 10;
  int _offset = 0;
  bool _hasMore = true;

  List<Rocket> _rockets = [];

  void fetchRockets({bool isRefresh = false}) async {
    if (state is RocketLoading || !_hasMore && !isRefresh) return;

    if (isRefresh) {
      _offset = 0;
      _hasMore = true;
      _rockets.clear();
    }

    emit(RocketLoading(_rockets, isRefresh: isRefresh));

    try {
      final newRockets = await _repository.getRockets(_limit, _offset);

      _hasMore = newRockets.length == _limit;
      _offset += _limit;
      _rockets.addAll(newRockets);

      emit(RocketLoaded(List.from(_rockets), hasMore: _hasMore));
    } catch (e) {
      emit(RocketError(e.toString(), _rockets));
    }
  }
}