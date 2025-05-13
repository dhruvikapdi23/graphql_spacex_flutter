import 'package:dartz/dartz.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:graphql_spacex_flutter/features/dashboard/domain/entities/dashboard.dart';
import 'package:graphql_spacex_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDatasource datasource;

  DashboardRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Dashboard>> getDashboard() async {
    try {
      final result = await datasource.getDashboard();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
