import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upcoming_launche_cubit.dart';

class UpcomingLaunchCountView extends StatelessWidget {
  const UpcomingLaunchCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpcomingLaunchesCubit()..fetchUpcomingLaunches(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Upcoming Launches")),
        body: BlocBuilder<UpcomingLaunchesCubit, List>(
          builder: (context, launches) {
            if (launches.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: launches.length,
              itemBuilder: (context, index) {
                final launch = launches[index];
                log("launch :$launch");
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(launch['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rocket: ${launch['rocket']}"),
                        Text("Launch Time (UTC): ${DateTime.parse(launch['date_utc'])}"),
                        CountdownText(launchDate: DateTime.parse(launch['date_utc'])),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CountdownText extends StatefulWidget {
  final DateTime launchDate;

  const CountdownText({super.key, required this.launchDate});

  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = widget.launchDate.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() {
        _duration = widget.launchDate.difference(DateTime.now());
      });
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_duration.isNegative) {
      return const Text("Launched");
    }
    final d = _duration;
    return Text(
        "${d.inDays}d ${d.inHours % 24}h ${d.inMinutes % 60}m ${d.inSeconds %
            60}s",
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }
}