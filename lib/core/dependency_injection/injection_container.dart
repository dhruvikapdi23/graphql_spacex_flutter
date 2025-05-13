import 'package:get_it/get_it.dart';
import 'package:graphql_spacex_flutter/features/launches/presentation/bloc/launches_cubit.dart';
import 'package:graphql_spacex_flutter/features/rockets/presentation/bloc/rocket_cubit.dart';

import '../../features/launches/data/repositories/launches_repository_impl.dart';
import '../../features/rockets/data/repositories/rockets_repository_impl.dart';
import '../../features/splash/presentation/bloc/splash_cubit.dart';
import '../../services/graphql_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register services
  final graphQLService = GraphQLService();
  final rocketRepository = RocketRepositoryImpl(graphQLService);
  final launchRepository = LaunchesRepositoryImpl(graphQLService);

  sl.registerFactory(() => SplashCubit());
  sl.registerFactory(() => RocketCubit(rocketRepository));
  sl.registerFactory(() => LaunchesCubit(launchRepository));
  // sl.registerFactory(() => SplashCubit(sl<Dependency>()));


  // Register blocs
  
  // Register repositories
  
  // Register data sources
}
