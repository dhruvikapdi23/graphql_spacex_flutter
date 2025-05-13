import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_spacex_flutter/services/graphql_service.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'core/dependency_injection/injection_container.dart' as di;
import 'features/launches/data/repositories/launches_repository_impl.dart';
import 'features/launches/presentation/bloc/launches_cubit.dart';
import 'features/rockets/data/repositories/rockets_repository_impl.dart';
import 'features/rockets/presentation/bloc/rocket_cubit.dart';
import 'features/splash/presentation/bloc/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final graphQLService = GraphQLService();
  final rocketRepository = RocketRepositoryImpl(graphQLService);
  final launchRepository = LaunchesRepositoryImpl(graphQLService);

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
        BlocProvider<RocketCubit>(create: (_) => RocketCubit(rocketRepository)),
        BlocProvider<LaunchesCubit>(create: (_) => LaunchesCubit(launchRepository)),
      ],child: const MyApp()));
}
