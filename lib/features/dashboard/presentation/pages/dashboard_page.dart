import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_spacex_flutter/core/constants/assets/images.dart';
import 'package:graphql_spacex_flutter/widgets/common_bg_image_layout.dart';

import '../../../../routes/app_routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Launches & Rockets')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonBgImageLayout(
                image: AppImage.launchBg,
                title: 'Launches',
                onTap: () => context.pushNamed(Names.launches),
              ),
              CommonBgImageLayout(
                image: AppImage.rocketBackground,
                title: 'Rockets',
                onTap: ()=> context.pushNamed(Names.rockets),
              ), CommonBgImageLayout(
                image: AppImage.launchBg,
                title: 'Upcoming Launches',
                onTap: ()=> context.pushNamed(Names.upComing),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
