import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/address_details_provider.dart';
import '../providers/map_provider.dart';
import '../widgets/address_bottomsheet_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProv = Provider.of<MapProvider>(context);

    if (mapProv.center == null) {
      return const Center(child: LoadingWidget());
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          GoogleMap(
            // style: mapProv.mapStyleString,
            initialCameraPosition: CameraPosition(
              target: mapProv.center!,
              zoom: mapProv.zoom,
            ),
            onMapCreated: (c) {
              mapProv.onMapCreated(c);
            },
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            markers: mapProv.markers,
            onCameraMove: (pos) => mapProv.onCameraMove(pos),
          ),
          Center(
            child: Icon(Icons.location_on,size: 8.w,color: Colors.red,),
          ),
          Positioned(
            right: 10,
            top: 5.h,
            child: InkWell(
              onTap: () {
                mapProv.animateToMyLocation();
              },
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(7),
                  child: const Icon(Icons.my_location_rounded),
                ),
              ),
            ),
          ),
          Positioned(
            left: 22,
            bottom: 7.h,
            child: InkWell(
              onTap: () {
                mapProv.animateToMyLocation();
              },
              child: ButtonWidget(
                onTap: () {
                  final mapProvider = Provider.of<MapProvider>(
                    context,
                    listen: false,
                  );
                  final lat = mapProvider.center?.latitude;
                  final lng = mapProvider.center?.longitude;

                  if (lat == null || lng == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          LanguageProvider.translate(
                            "global",
                            "please_select_location",
                          ),
                        ),
                      ),
                    );
                    return;
                  }

                  final addressDetailsProvider = Provider.of<AddressDetailsProvider>(
                    context,
                    listen: false,
                  );
                  addressDetailsProvider.setData(lat, lng);

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const AddressBottomSheet(),
                  );
                },
                text: LanguageProvider.translate('location', 'confirm_location'),
                width: 89.w,
                height: 5.5.h,
                borderRadius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
