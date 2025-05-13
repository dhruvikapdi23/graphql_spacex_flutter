
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graphql_spacex_flutter/features/rockets/presentation/pages/rocket_card.dart';
import '../../domain/entities/rockets.dart';
import '../bloc/rocket_cubit.dart';

class RocketsPage extends StatefulWidget {
  const RocketsPage({super.key});

  @override
  State<RocketsPage> createState() => _RocketsPageState();
}

class _RocketsPageState extends State<RocketsPage> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
    context.read<RocketCubit>().fetchRockets();
  }

  void _onScroll() {
    if (_controller.position.pixels >= _controller.position.maxScrollExtent - 200) {
      context.read<RocketCubit>().fetchRockets();
    }
  }

  Future<void> _onRefresh() async {
    context.read<RocketCubit>().fetchRockets(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rockets")),
      body: BlocBuilder<RocketCubit, RocketState>(
        builder: (context, state) {
          if (state is RocketInitial || state is RocketLoading && state.rockets.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RocketError && state.rockets.isEmpty) {
            return Center(child: Text('Error: ${state.message}'));
          }

          final rockets = (state is RocketLoaded || state is RocketError || state is RocketLoading)
              ? (state as dynamic).rockets as List<Rocket>
              : [];

          return RefreshIndicator(
            onRefresh: _onRefresh,

            child: ListView.builder(
              controller: _controller,
              itemCount: rockets.length + ((state is RocketLoaded && state.hasMore) ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= rockets.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                log('rocket :${rockets.length}');
                final rocket = rockets[index];

                return RocketCard(rocket: rocket);
              },
            ),
          );
        },
      ),
    );
  }
}




