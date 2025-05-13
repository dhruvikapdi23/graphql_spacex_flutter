import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/core/error/failures.dart';
import 'package:graphql_spacex_flutter/features/launches/domain/repositories/launches_repository.dart';

import '../../../../services/graphql_service.dart';
import '../../../../services/space_query.dart';

class LaunchesRepositoryImpl implements LaunchesRepository {
  final GraphQLService service;

  LaunchesRepositoryImpl(this.service);

  static String getLaunchesQuery = SpaceQuery.getLaunches;

  @override
  Future<List> getLaunches(int limit, int offset, search) async {
    final result = await GraphQLService().client.value.query(
      QueryOptions(
        document: gql(getLaunchesQuery),
        variables: {
          if (search == null) "limit": limit,
          "offset": offset,
          if (search != null) "find": {"mission_name": search},
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    log('result.data? ;${result.data}');
    final List data = result.data?['launchesPast'] ?? [];
    return data;
  }
}
