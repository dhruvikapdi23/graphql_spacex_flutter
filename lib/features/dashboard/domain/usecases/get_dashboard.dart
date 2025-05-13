import 'package:dartz/dartz.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/dashboard/domain/entities/dashboard.dart';
import 'package:graphql_spacex_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboard {
  final DashboardRepository repository;

  GetDashboard(this.repository);

  Future<Either<Failure, Dashboard>> call() async {
    return await repository.getDashboard();
  }
}
