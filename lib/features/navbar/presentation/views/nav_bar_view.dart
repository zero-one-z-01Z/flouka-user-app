import 'package:flouka/features/navbar/presentation/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(
      builder: (context, nav, _) {
        return Scaffold(
          body: nav.body[nav.currentIndex],
          bottomNavigationBar: const CustomBottomNavBarWidget(),
        );
      },
    );
  }
}
