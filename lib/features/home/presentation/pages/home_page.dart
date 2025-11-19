import 'package:flouka/features/categories/presentation/widgets/categories_home_explore.dart';
import 'package:flouka/features/home/presentation/widgets/far_away_container_widget.dart';
import 'package:flouka/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/banners/presentation/widgets/carousel_slider_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeAppbarWidget(),
          FarAwayContainerWidget(),
          CarouselSliderWidget(),
          CategoriesHomeExplore(),
        ],
      ),
    );
  }
}
