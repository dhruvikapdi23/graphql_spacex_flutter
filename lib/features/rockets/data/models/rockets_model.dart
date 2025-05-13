import 'package:graphql_spacex_flutter/features/rockets/domain/entities/rockets.dart';

class RocketModel extends Rocket {
  RocketModel({
    required super.id,
    required super.name,
    required super.country,
    required super.successRatePct,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      successRatePct: json['success_rate_pct'],
    );
  }
}