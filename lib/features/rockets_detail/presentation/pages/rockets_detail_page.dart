import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_spacex_flutter/features/rockets_detail/presentation/bloc/rocket_detail_cubit.dart';
import 'package:graphql_spacex_flutter/services/space_query.dart';

import '../../../../services/graphql_service.dart';
import '../../data/repositories/rockets_detail_repository_impl.dart';
import '../../domain/repositories/rocket_detail_repository.dart';

class RocketDetailPage extends StatefulWidget {
  const RocketDetailPage({super.key});

  @override
  State<RocketDetailPage> createState() => _RocketDetailPageState();
}

class _RocketDetailPageState extends State<RocketDetailPage> {
  final graphQLService = GraphQLService();
  final rocketRepository = RocketDetailRepositoryImpl();
  dynamic id;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RocketDetailCubit>(
      create: (_) => RocketDetailCubit(rocketRepository)..fetchRocketDetail(context),
      child: RocketsDetailPageView()
    );
  }
}

class RocketsDetailPageView extends StatelessWidget {
  const RocketsDetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rockets_detail')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:BlocBuilder<RocketDetailCubit, RocketDetailState>(
            builder: (context, state) {
              if (state is RocketDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RocketDetailLoaded) {
                final rocket = state.rocket;
                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(rocket['name']),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black26,
                            Colors.black12,
                            Colors.black26,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Description:'),
                            ),
                          ),
                          Text(rocket['description']),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black26,
                            Colors.black12,
                            Colors.black26,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Specs:'),
                            ),
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text('Mass (kg)'),
                                  Text(rocket['mass']['kg'].toString()),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Height (m)'),
                                  Text(rocket['height']['meters'].toString()),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Diameter (m)'),
                                  Text(rocket['diameter']['meters'].toString()),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Cost per launch (\$)'),
                                  Text("${rocket['cost_per_launch']}"),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Nº of stages'),
                                  Text(rocket['stages'].toString()),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black26,
                            Colors.black12,
                            Colors.black26,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Stage 1 specs:'),
                            ),
                          ),
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(2.0),
                              1: FlexColumnWidth(1.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Text('Burn time (s)'),
                                  Text(
                                    rocket['first_stage']['burn_time_sec']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Nº of engines'),
                                  Text(
                                    rocket['first_stage']['engines'].toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Tons of fuel'),
                                  Text(
                                    rocket['first_stage']['fuel_amount_tons']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Thrust at sea level (kN)'),
                                  Text(
                                    rocket['first_stage']['thrust_sea_level']['kN']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Thrust at vacuum (kN)'),
                                  Text(
                                    rocket['first_stage']['thrust_vacuum']['kN']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Reusable'),
                                  Text(
                                    rocket['first_stage']['reusable']
                                        ? "Yes"
                                        : "No",
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black26,
                            Colors.black12,
                            Colors.black26,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Stage 2 specs:'),
                            ),
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text('Burn time (s)'),
                                  Text(
                                    rocket['second_stage']['burn_time_sec']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Nº of engines'),
                                  Text(
                                    rocket['second_stage']['engines'].toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Tons of fuel'),
                                  Text(
                                    rocket['second_stage']['fuel_amount_tons']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TableRow(
                                children: [
                                  Text('Thrust (kN)'),
                                  Text(
                                    rocket['second_stage']['thrust']['kN']
                                        .toString(),
                                  ),
                                ],
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is RocketDetailError) {
                return Center(child: Text(state.message));
              }
            return Container();
            },
          ),
        ),
      ),
    );
  }
}
