import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../../../core/constants/constants.dart';
import '../../../../../core/helper_function/location.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../../core/models/pagination_class.dart';
import '../views/select_address_map_page.dart';

class MapProvider with ChangeNotifier implements PaginationClass {
  ScrollController scrollController = ScrollController();
  String? mapStyleString;
  GoogleMapController? controller;
  LatLng? _center;
  final double _zoom = 14;
  final Set<Marker> _markers = {};

  double get zoom => _zoom;
  LatLng? get center => _center;
  Set<Marker> get markers => _markers;

  MapProvider() {
    initLocation();
  }

  Future<void> initLocation() async {
    LatLng latLng = await determinePosition();
    _center = latLng;
    notifyListeners();
  }

  void clear() {
    _markers.clear();
    firstTime = true;
    pageIndex = 1;
    paginationFinished = false;
    paginationStarted = false;
    notifyListeners();
  }

  void refresh() async {
    clear();
  }

  void goToMapPage() {
    navP(const SelectAddressMapPage());
    initLocation();
  }

  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  void onCameraMove(CameraPosition position) {
    _center = position.target;
    notifyListeners();
  }

  Future<void> moveCameraTo(LatLng target, {double? zoom}) async {
    if (controller == null) return;
    await controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: zoom ?? _zoom),
      ),
    );
    _center = target;
    notifyListeners();
  }

  bool firstTime = true;

  void animateToMyLocation() async {
    LatLng latLng = await determinePosition();
    moveCameraTo(latLng);
  }

  BitmapDescriptor? customIcon;

  @override
  void pagination() {
    scrollController.addListener(() async {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels > 50) {}
    });
  }

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;
}
