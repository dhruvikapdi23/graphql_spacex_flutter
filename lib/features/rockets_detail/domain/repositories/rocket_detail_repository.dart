import 'package:dartz/dartz.dart' as rocket_detail_repository;
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/rockets/domain/entities/rockets.dart';
import 'package:graphql_spacex_flutter/features/rockets_detail/domain/entities/rocket_detail.dart';

import '../../data/models/rockets_detail_model.dart';

abstract class RocketDetailRepository {
  Future getRocketById(id);
}