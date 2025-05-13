import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_spacex_flutter/features/launch_detail/presentation/bloc/launch_detail_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../services/graphql_service.dart';
import '../../data/repositories/launch_detail_repository_impl.dart';

class LaunchDetailPage extends StatefulWidget {
  const LaunchDetailPage({super.key});

  @override
  State<LaunchDetailPage> createState() => _LaunchDetailPageState();
}

class _LaunchDetailPageState extends State<LaunchDetailPage> {
  final graphQLService = GraphQLService();
  final launchRepository = LaunchDetailRepositoryImpl();
  dynamic id;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchDetailCubit>(
      create: (_) => LaunchDetailCubit(launchRepository)..fetchLaunchDetail(context),
      child: RocketsDetailPageView()
    );
  }
}

class RocketsDetailPageView extends StatelessWidget {
  const RocketsDetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Launch detail')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:BlocBuilder<LaunchDetailCubit, LaunchDetailState>(
            builder: (context, state) {
              if (state is LaunchDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LaunchDetailLoaded) {
                final launch = state.launch;
                List images =launch['links']['flickr_images'];

                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(launch['mission_name']),
                      ),
                    ),

                    (images.isNotEmpty)? Container(): YouTubePlayerExample(path: launch['links']['video_link'].toString(),),

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
                          Text(launch['details']),
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
                                  Text(launch['rocket']['rocket']['mass']['kg'].toString()),
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
                                  Text(launch['rocket']['rocket']['height']['meters'].toString()),
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
                                  Text(launch['rocket']['rocket']['diameter']['meters'].toString()),
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
                                  Text("${launch['cost_per_launch']}"),
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
                                  Text(launch['stages'].toString()),
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
                              /*TableRow(
                                children: [
                                  Text('Burn time (s)'),
                                  Text(
                                    launch['first_stage']['burn_time_sec']
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
                              ),*/
                              TableRow(
                                children: [
                                  Text('Nº of engines'),
                                  Text(
                                    launch['rocket']['rocket']['first_stage']['engines'].toString(),
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
                             /* TableRow(
                                children: [
                                  Text('Tons of fuel'),
                                  Text(
                                    launch['first_stage']['fuel_amount_tons']
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
                              ),*/
                              TableRow(
                                children: [
                                  Text('Thrust at sea level (kN)'),
                                  Text(
                                    launch['rocket']['rocket']['first_stage']['thrust_sea_level']['kN']
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
                                    launch['rocket']['rocket']['first_stage']['thrust_vacuum']['kN']
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
                              /*TableRow(
                                children: [
                                  Text('Burn time (s)'),
                                  Text(
                                    launch['second_stage']['burn_time_sec']
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
                              ),*/
                              TableRow(
                                children: [
                                  Text('Nº of engines'),
                                  Text(
                                    launch['rocket']['rocket']['second_stage']['engines'].toString(),
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
                                    launch['rocket']['rocket']['second_stage']['fuel_amount_tons']
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
                                    launch['rocket']['rocket']['second_stage']['thrust']['kN']
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
              } else if (state is LaunchDetailError) {
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


class YouTubePlayerExample extends StatefulWidget {
  final String? path;
  const YouTubePlayerExample({super.key, this.path});

  @override
  State<YouTubePlayerExample> createState() => _YouTubePlayerExampleState();
}

class _YouTubePlayerExampleState extends State<YouTubePlayerExample> {
   YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    String videoUrl = widget.path!;
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
    );
  }
}