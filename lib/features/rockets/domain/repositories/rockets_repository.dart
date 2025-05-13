import 'package:dartz/dartz.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/rockets/domain/entities/rockets.dart';

abstract class RocketRepository {
  Future<List<Rocket>> getRockets(int limit, int offset);
}