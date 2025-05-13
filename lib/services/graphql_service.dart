import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/services/space_query.dart';

class GraphQLService {
  //static final HttpLink _httpLink = HttpLink('https://spacex-production.up.railway.app/');
  static final HttpLink _httpLink = HttpLink('https://main--spacex-l4uc6p.apollographos.net/graphql');

  /*static final GraphQLClient client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(),
  );*/


  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),

        link: _httpLink
    ),
  );





}