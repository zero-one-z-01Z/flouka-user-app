import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show atan2, cos, pi, pow, sin, sqrt;

// Position? globalPosition;
String? currentLocationAddress;

Future<LatLng> determinePosition({
  bool showMessage = true,
}) async {
  const defaultLatLng = LatLng(24.7136, 46.6753);

  try {
    // 1- Check Location Service
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (showMessage) {
        await showSettingsDialog('open_gps');
      }
      return defaultLatLng;
    }

    // 2- Check Permission
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        if (showMessage) {
          await showSettingsDialog('location_permission_denied');
        }
        return defaultLatLng;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (showMessage) {
        await showSettingsDialog('open_gps_settings');
      }
      return defaultLatLng;
    }

    // 3- Try Current Position
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 2),
        ),
      );

      return LatLng(position.latitude, position.longitude);
    } on TimeoutException {
      final lastPosition = await Geolocator.getLastKnownPosition();

      if (lastPosition != null) {
        return LatLng(lastPosition.latitude, lastPosition.longitude);
      }

      if (showMessage) {
        await showSettingsDialog('location_timeout');
      }

      return defaultLatLng;
    }
  } catch (e, s) {
    if (showMessage) {
      await showSettingsDialog('location_error');
    }

    return defaultLatLng;
  }
}
Future showSettingsDialog(String title) async {
  // Position as = Position(longitude: 24.7136, latitude: 46.6753, timestamp: DateTime.now(),
  //     accuracy: 0 , altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0,
  //     speedAccuracy: 0);
  // globalPosition = as;
  // currentLocationAddress = LanguageProvider.translate('global', 'riyadh');
  // await confirmDialog(LanguageProvider.translate('global', title), LanguageProvider.translate('buttons', 'confirm'), () async{
  //   navPop();
  //   await openAppSettings();
  //   determinePosition(showMessage: false);
  // });
}

double calculateDistance(LatLng location1, LatLng location2) {
  const double earthRadius = 6371; // Radius of the Earth in kilometers

  // Convert latitude and longitude from degrees to radians
  double lat1 = _degreesToRadians(location1.latitude);
  double lon1 = _degreesToRadians(location1.longitude);
  double lat2 = _degreesToRadians(location2.latitude);
  double lon2 = _degreesToRadians(location2.longitude);

  // Calculate differences between latitudes and longitudes
  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  // Calculate the distance using Haversine formula
  double a = pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = earthRadius * c; // Distance in kilometers

  return distance;
}

double _degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}
