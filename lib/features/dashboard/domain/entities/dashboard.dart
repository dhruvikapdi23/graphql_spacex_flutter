import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  final String id;
  final String name;

  const Dashboard({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
