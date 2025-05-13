
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/services/graphql_service.dart';

import '../../../../services/space_query.dart';
import '../../domain/entities/rocket_detail.dart';
import '../../domain/repositories/rocket_detail_repository.dart';
import '../models/rockets_detail_model.dart';

class RocketDetailRepositoryImpl implements RocketDetailRepository {

  static  String getRocketsQuery = SpaceQuery.rocketDataById;

  @override
  Future getRocketById(id) async {
    final result = await GraphQLService().client.value.query(QueryOptions(
      document: gql(getRocketsQuery),
      variables: {"id": id},
    ));


    if (result.hasException) {
      throw result.exception!;
    }

    log("result :$result");

    return result.data!['rocket'];
  }
}
