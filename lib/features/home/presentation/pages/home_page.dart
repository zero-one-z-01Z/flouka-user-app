import 'package:flouka/features/home/presentation/widgets/far_away_container_widget.dart';
import 'package:flouka/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [HomeAppbarWidget(), FarAwayContainerWidget()],
      ),
    );
  }
}
