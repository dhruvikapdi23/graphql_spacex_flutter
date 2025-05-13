
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/features/rockets/domain/entities/rockets.dart';
import 'package:graphql_spacex_flutter/features/rockets/domain/repositories/rockets_repository.dart';
import 'package:graphql_spacex_flutter/services/space_query.dart';

import '../../../../services/graphql_service.dart';
import '../models/rockets_model.dart';

class RocketRepositoryImpl implements RocketRepository {
  final GraphQLService service;

  RocketRepositoryImpl(this.service);

  static  String getRocketsQuery = SpaceQuery.getRockets;

  @override
  Future<List<Rocket>> getRockets(int limit, int offset) async {
    final result = await GraphQLService().client.value.query(QueryOptions(
      document: gql(getRocketsQuery),
      variables: {
        "limit": limit,
        "offset": offset,
      },
    ));

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['rockets'] ?? [];
    log("data ${data.length}");
    return data.map((e) => RocketModel.fromJson(e)).toList();
  }
}
