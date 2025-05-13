import 'package:equatable/equatable.dart';
class RocketDetail {
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

  RocketDetail({
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
}