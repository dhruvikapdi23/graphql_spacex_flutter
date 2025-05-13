import 'package:graphql_spacex_flutter/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardDatasource {
  Future<DashboardModel> getDashboard();
}

class DashboardDatasourceImpl implements DashboardDatasource {
  @override
  Future<DashboardModel> getDashboard() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return DashboardModel(
      id: '1',
      name: 'Dashboard Name',
    );
  }
}
