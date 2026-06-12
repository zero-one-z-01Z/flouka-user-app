import 'package:flouka/features/navbar/presentation/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/deep_link.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DeepLinkService().init();
    });
  }
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
