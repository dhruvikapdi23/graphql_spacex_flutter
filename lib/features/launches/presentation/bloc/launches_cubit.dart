import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/launches_repository.dart';
import 'launches_state.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  LaunchesCubit(this._repository) : super(LaunchesInitial());

  final LaunchesRepository _repository;
  final int _limit = 10;
  int _offset = 0;
  bool _hasMore = true;

  List launches = [];

  void fetchLaunches({bool isRefresh = false, search}) async {
    if (state is LaunchesLoading || !_hasMore && !isRefresh) return;

    if (isRefresh) {
      _offset = 0;
      _hasMore = true;
      launches.clear();
    }

    emit(LaunchesLoading(launches, isRefresh: isRefresh));

    try {
      final newLaunches = await _repository.getLaunches(
        _limit,
        _offset,
        search,
      );

      _hasMore = newLaunches.length == _limit;
      _offset += _limit;
      launches.addAll(newLaunches);
      log("launches2 :${launches.length}");

      if (search != null) {
        launches =
            launches
                .where(
                  (element){
                    log("CONTA :${element['mission_name'].toString().toLowerCase().replaceAll(" ", "").contains(search)
                        }");
                    return element['mission_name']
                        .toString()
                        .toLowerCase()
                        .contains(search.toString().toLowerCase());
                  },
                )
                .toList();
      }
      log("launches :${launches.length}");
      emit(LaunchesLoaded(List.from(launches), hasMore: _hasMore));
    } catch (e) {
      emit(LaunchesError(e.toString(), launches));
    }
  }
}
