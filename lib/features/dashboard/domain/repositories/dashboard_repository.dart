import 'package:dartz/dartz.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/dashboard/domain/entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, Dashboard>> getDashboard();
}
