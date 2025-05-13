import 'package:graphql_spacex_flutter/features/dashboard/domain/entities/dashboard.dart';

class DashboardModel {
  final String id;
  final String name;

  DashboardModel({
    required this.id,
    required this.name,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Dashboard toEntity() {
    return Dashboard(
      id: id,
      name: name,
    );
  }
}
