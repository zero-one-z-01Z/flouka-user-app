import 'package:flutter/material.dart';
import 'map_screen.dart';

class SelectAddressMapPage extends StatelessWidget {
  const SelectAddressMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      backgroundColor: Colors.transparent,
      body: const Column(children: [Expanded(child: MapScreen())]),
    );
  }
}
