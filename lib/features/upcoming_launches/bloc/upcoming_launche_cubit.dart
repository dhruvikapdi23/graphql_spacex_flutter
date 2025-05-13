import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'upcoming_launche_state.dart';

class UpcomingLaunchesCubit extends Cubit<List> {
  UpcomingLaunchesCubit() : super([]);


    Future<void> fetchUpcomingLaunches() async {
      final url = Uri.parse("https://api.spacexdata.com/v5/launches/query");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "query": {"upcoming": true},
          "options": {
            "limit": 10,
            "page": 0,
            "sort": {"flight_number":  "asc"},
            "populate": ["payloads", "capsules", "crew", "launchpad"]
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final docs = data['docs'] as List;
        final launches = docs;
        emit(launches);
      } else {
        emit([]);
      }
    }

}