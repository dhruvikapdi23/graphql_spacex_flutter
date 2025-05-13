import '../../domain/entities/rocket_detail.dart';

class RocketDetailModel {
  final String id;
  final String name;
  final String description;
  final String country;
  final bool active;
  final int successRate;
  final int costPerLaunch;
  final String firstFlight;
  final String wikipedia;
  final double height;
  final double diameter;
  final double mass;
  final int engines;

  RocketDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.active,
    required this.successRate,
    required this.costPerLaunch,
    required this.firstFlight,
    required this.wikipedia,
    required this.height,
    required this.diameter,
    required this.mass,
    required this.engines,
  });

  factory RocketDetailModel.fromJson(Map<String, dynamic> json) {
    return RocketDetailModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      country: json['country'],
      active: json['active'],
      successRate: json['success_rate_pct'],
      costPerLaunch: json['cost_per_launch'],
      firstFlight: json['first_flight'],
      wikipedia: json['wikipedia'],
      height: (json['height']?['meters'] ?? 0).toDouble(),
      diameter: (json['diameter']?['meters'] ?? 0).toDouble(),
      mass: (json['mass']?['kg'] ?? 0).toDouble(),
      engines: json['engines']?['number'] ?? 0,
    );
  }

  RocketDetail toEntity() {
    return RocketDetail(
      id: id,
      name: name,
      description: description,
      country: country,
      active: active,
      successRate: successRate,
      costPerLaunch: costPerLaunch,
      firstFlight: firstFlight,
      wikipedia: wikipedia,
      height: height,
      diameter: diameter,
      mass: mass,
      engines: engines,
    );
  }
}
