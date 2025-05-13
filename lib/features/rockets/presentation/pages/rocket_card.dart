import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_spacex_flutter/routes/app_routes.dart';

import '../../domain/entities/rockets.dart';

class RocketCard extends StatelessWidget {
  final Rocket rocket;
  const RocketCard({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> context.pushNamed(Names.rocketsDetail,extra: {"id":rocket.id}),
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rocket.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Country: ${rocket.country}"),
              Text("Success Rate: ${rocket.successRatePct}%"),
            ],
          ),
        ),
      ),
    );
  }
}