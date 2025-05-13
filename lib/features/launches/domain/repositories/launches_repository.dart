import 'package:dartz/dartz.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';

abstract class LaunchesRepository {
  Future<List> getLaunches(int limit, int offset,search);
}
