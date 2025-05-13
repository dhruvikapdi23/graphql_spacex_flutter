import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_spacex_flutter/routes/app_routes.dart';

import '../bloc/launches_cubit.dart';
import '../bloc/launches_state.dart';

class LaunchesPage extends StatefulWidget {
  const LaunchesPage({super.key});

  @override
  State<LaunchesPage> createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage> {
  late final ScrollController _controller;
  TextEditingController controller =TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
    context.read<LaunchesCubit>().fetchLaunches();
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      context.read<LaunchesCubit>().fetchLaunches();
    }
  }

  Future<void> _onRefresh() async {
    context.read<LaunchesCubit>().fetchLaunches(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Launches")),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 20,),
            TextFormField(
              controller: controller,
              onChanged: (v) {
                if(v.isEmpty){
                  context.read<LaunchesCubit>().fetchLaunches(isRefresh: true);
                }
              },
              decoration: InputDecoration(
                labelText: "Search",

                suffixIcon: InkWell(
                    onTap: ()=>  context.read<LaunchesCubit>().fetchLaunches(isRefresh: true,search: controller.text) ,
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            BlocBuilder<LaunchesCubit, LaunchesState>(
              builder: (context, state) {
                if (state is LaunchesInitial ||
                    state is LaunchesLoading && state.launches.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LaunchesError && state.launches.isEmpty) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is LaunchesLoaded) {
                  log("state ;$state");
                  final launches = (state as dynamic).launches as List;

                  return RefreshIndicator(
                    onRefresh: _onRefresh,

                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _controller,
                      itemCount: launches.length + ((state.hasMore) ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= launches.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        log('rocket :${launches.length}');
                        final launch = launches[index];
                        log('rocket :${launch}');

                        return InkWell(
                          onTap: () => context.pushNamed(Names.launchDetail,extra: {"id":launch['id']}),
                          child: Card(
                            margin: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    launch['mission_name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Country: ${launch['rocket']['rocket']['country']}",
                                  ),
                                  Text("Date: ${launch['launch_date_local']}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
