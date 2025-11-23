import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/address/presentation/views/add_address_screen.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../providers/map_provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProv = Provider.of<MapProvider>(context);

    if (mapProv.center == null) {
      return const Center(child: LoadingWidget());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "ADD NEW ADDRESS")),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: mapProv.center!,
          zoom: mapProv.zoom,
        ),
        onMapCreated: (c) {
          mapProv.onMapCreated(c);
        },
        onTap: (latLng) {
          navP(const AddAddressScreen());
        },
        myLocationButtonEnabled: true,
        onCameraMove: (pos) => mapProv.onCameraMove(pos),
      ),
    );
  }
}
