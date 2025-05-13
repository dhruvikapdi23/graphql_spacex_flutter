import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_spacex_flutter/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:graphql_spacex_flutter/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
