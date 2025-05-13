
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/services/graphql_service.dart';

import '../../../../services/space_query.dart';
import '../../domain/repositories/launch_detail_repository.dart';

class LaunchDetailRepositoryImpl implements LaunchDetailRepository {

  static  String getLaunchQuery = SpaceQuery.launchDataById;

  @override
  Future getLaunchById(id) async {
    final result = await GraphQLService().client.value.query(QueryOptions(
      document: gql(getLaunchQuery),
      variables: {"launchId": id},
    ));


    if (result.hasException) {
      throw result.exception!;
    }

    log("result :$result");

    return result.data!['launch'];
  }
}
