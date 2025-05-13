import 'package:equatable/equatable.dart';

class Rocket {
  final String id;
  final String name;
  final String country;
  final int successRatePct;

  Rocket({
    required this.id,
    required this.name,
    required this.country,
    required this.successRatePct,
  });
}