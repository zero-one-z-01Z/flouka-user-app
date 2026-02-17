import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/dialog/snack_bar.dart';
import '../../../../../core/dialog/success_dialog.dart';
import '../../../../../core/helper_function/loading.dart';
import '../../../../../core/helper_function/location.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../../core/helper_function/text_form_field_validation.dart';
import '../../../../../core/models/text_field_model.dart';
import '../../../../../injection_container.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/dialog/new_success_dialog.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/usecase/address_usecase.dart';
import '../../domain/usecase/city_usecase.dart';
import '../views/select_address_map_page.dart';
import 'address_provider.dart';
import 'area_provider.dart';
import 'city_provider.dart';
import 'parts_provider.dart';

class AddressDetailsProvider extends ChangeNotifier {
  final CityUseCases cityUseCases = CityUseCases(sl());
  final AddressUseCases addressUseCases;
  AddressDetailsProvider(this.addressUseCases);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isMakeDefault = false;
  void changeIsMakeDefault() {
    AuthProvider authProvider = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
  }

  Set<Polygon> polygons = {};
  void generatePolygons() {
    CityProvider cityProvider = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
    List<CityEntity> cities = cityProvider.cities;
    polygons.clear();
    for (int i = 0; i < cities.length; i++) {
      final area = cities[i];
      final polygonId = PolygonId('city_$i');
      polygons.add(
        Polygon(
          polygonId: polygonId,
          fillColor: Colors.green.withAlpha((0.3 * 255).round()),
          strokeColor: Colors.green.withAlpha((0.7 * 255).round()),
          strokeWidth: 2,
        ),
      );
    }
  }

  String addressName = 'home';
  TextEditingController addressNameController = TextEditingController();
  void changeHomeAddress({required String chooseHomeAddress}) {
    // this.chooseHomeAddress=chooseHomeAddress;
    addressName = chooseHomeAddress;
    notifyListeners();
  }

  CityEntity? city;
  String title = 'add_address';
  bool? validAddress = false;
  bool expanded = false;
  CameraPosition? currentPos;
  GoogleMapController? controller;
  late double lat, lng;
  AddressEntity? addressEntity;
  String description = '';
  List<TextFieldModel> inputs = [
    TextFieldModel(
      controller: TextEditingController(),
      key: 'name',
      label: 'address_name',
      validator: (value) => validateAddressName(value),
    ),
    TextFieldModel(
      controller: TextEditingController(),
      key: 'street',
      label: 'street_name',
      validator: (value) => validateStreetName(value),
    ),
    TextFieldModel(
      controller: TextEditingController(),
      key: 'apartment',
      label: 'apartment',
      textInputType: TextInputType.number,
      width: 40.w,
      validator: (value) => validateApartment(value),
    ),
    TextFieldModel(
      controller: TextEditingController(),
      key: 'building',
      label: 'building',
      textInputType: TextInputType.number,
      width: 40.w,
      validator: (value) => validateBuilding(value),
    ),
    TextFieldModel(
      controller: TextEditingController(),
      key: 'notes',
      label: 'notes',
      max: 5,
      validator: (value) => null,
    ),
  ];
  void resetData() {
    currentPos = null;
    controller = null;
    description = '';
    expanded = false;
    addressEntity = null;
    for (var i in inputs) {
      i.controller.clear();
    }
  }

  Future getDescription() async {
    // description = await getStreetText(
    //   LatLng(lat, lng),
    // );
  }

  void setDataController(GoogleMapController controller) {
    this.controller = controller;
  }

  void setData(double lat, double lng) {
    this.lat = lat;
    this.lng = lng;

    setMarker();
  }

  void checkThenSetCity(int cityId) {
    final CityProvider cityProvider = Provider.of<CityProvider>(
      Constants.globalContext(),
      listen: false,
    );
    int index = cityProvider.cities.indexWhere((element) => element.id == cityId);
    if (index != -1) {
      city = cityProvider.cities[index];
    }
  }

  BitmapDescriptor myMarkerIcon = BitmapDescriptor.defaultMarker;
  CityProvider cityProvider = Provider.of(Constants.globalContext(), listen: false);
  AreaProvider areaProvider = Provider.of(Constants.globalContext(), listen: false);
  PartsProvider partsProvider = Provider.of(
    Constants.globalContext(),
    listen: false,
  );

  void submitAddressForm() {
    String nameError = '';
    if (cityProvider.cityEntity == null) {
      nameError += '${validateCity()}\n';
    }

    if (areaProvider.areaEntity == null) {
      nameError += '${validateArea()}\n';
    }

    for (var element in inputs) {
      if (element.controller.text.isEmpty && element.validator != null) {
        String? error = element.validator!(element.controller.text);
        if (error != null && error.isNotEmpty) {
          nameError += '$error\n';
        }
      }
    }

    if (nameError.isEmpty) {
    } else {
      showToast(nameError.trim());
    }
  }

  void addAddress() async {
    Map<String, dynamic> data = addressData();
    loading();
    Either<DioException, AddressEntity> value = await addressUseCases.createAddress(
      data,
    );
    navPop();
    value.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        AddressProvider addressProvider = Provider.of(
          Constants.globalContext(),
          listen: false,
        );
        addressProvider.addAddress(r);
        newSuccessDialog(
          lottie: Lotties.videoAnimation,
          then: () {
            clear();
            navPop();
            navPop();
          },
        );
      },
    );
  }

  void clear() {
    for (var i in inputs) {
      i.controller.clear();
    }
    areaProvider.areaEntity = null;
    cityProvider.cityEntity = null;
    partsProvider.selectedPart = null;
  }

  void updateAddress() async {
    Map<String, dynamic> data = addressData();
    data['address_id'] = addressEntity?.id;
    loading();
    Either<DioException, AddressEntity> value = await addressUseCases.updateAddress(
      data,
    );
    navPop();
    value.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        AddressProvider addressProvider = Provider.of(
          Constants.globalContext(),
          listen: false,
        );
        addressProvider.updateAddress(r);
        // playSuccessSound(path: 'success.mp4');
        successDialog(
          then: () {
            clear();
            navPop();
            navPop();
          },
        );
      },
    );
  }

  bool isSaveWidget = false;
  void isSaveToggle() {
    isSaveWidget = !isSaveWidget;
    notifyListeners();
  }

  void addressButtonAction() {
    if (addressEntity == null) {
      addAddress();
    } else {
      updateAddress();
    }
  }

  Map<String, dynamic> addressData() {
    Map<String, dynamic> data = {};
    //
    for (var i in inputs) {
      data[i.key] = i.controller.text;
    }
    data['area_id'] = areaProvider.areaEntity!.id;
    data['lat'] = lat;
    data['lng'] = lng;
    if (addressEntity != null) {
      data['id'] = addressEntity!.id;
    }
    return data;
  }

  void setMarker() async {
    LatLng latLng = LatLng(lat, lng);
    controller?.moveCamera(CameraUpdate.newLatLng(latLng));
    notifyListeners();
    await getDescription();
    notifyListeners();
  }

  void triggerExtend() {
    if (expanded) {
      disAbleExtend();
    } else {
      enableExtend();
    }
  }

  Future enableExtend() async {
    if (city != null) {
      expanded = true;
      inputs
              .firstWhere((element) => element.key == 'address_title')
              .controller
              .text =
          description;
      // inputs.firstWhere((element) => element.key == 'city_id').controller.text = city?.name ?? "";
    }

    notifyListeners();
  }

  void disAbleExtend() {
    expanded = false;
    notifyListeners();
  }

  Future<String?> goToAddressDetailsPage({AddressEntity? addressEntity}) async {
    try {
      AuthProvider authProvider = Provider.of(
        Constants.globalContext(),
        listen: false,
      );
      // isMakeDefault = authProvider.userEntity!.addressEntity==null;
      if (addressEntity != null) {
        title = "edit_address";
        this.addressEntity = addressEntity;
        setData(addressEntity.lat!, addressEntity.lng!);
        setInputsData();
        navP(
          const SelectAddressMapPage(),
          then: (val) async {
            resetData();
          },
        );
      } else {
        title = "add_address";
        loading();
        LatLng position = await determinePosition();
        navPop();
        setData(position.latitude, position.longitude);
        navP(
          const SelectAddressMapPage(),
          then: (val) async {
            resetData();
          },
        );
      }
    } catch (e) {
      showToast(LanguageProvider.translate('error', 'error'));
    }
    return "jh";
  }

  void setInputsData() async {
    final cityProvider = Provider.of<CityProvider>(
      Constants.globalContext(),
      listen: false,
    );
    final areaProvider = Provider.of<AreaProvider>(
      Constants.globalContext(),
      listen: false,
    );
    // final partsProvider = Provider.of<PartsProvider>(Constants.globalContext(), listen: false,);

    if (addressEntity!.areaEntity != null) {
      cityProvider.cityEntity = cityProvider.cities.firstWhere(
        (element) => element.id == addressEntity!.areaEntity!.cityId,
      );
      await areaProvider.getArea(id: cityProvider.cityEntity!.id, fromAddress: true);
      areaProvider.areaEntity = areaProvider.areas.firstWhere(
        (element) => element.id == addressEntity!.areaEntity!.id,
      );
    }

    // partsProvider.selectedPart = partsProvider.parts.firstWhere(
    //   (element) => element == addressEntity!.partNumber,
    // );

    inputs.firstWhere((element) => element.key == 'address_name').controller.text =
        addressEntity!.addressName ?? "";
    inputs.firstWhere((element) => element.key == 'street_name').controller.text =
        addressEntity!.streetName ?? "";
    inputs.firstWhere((element) => element.key == 'building').controller.text =
        addressEntity!.building ?? "";
    inputs.firstWhere((element) => element.key == 'apartment').controller.text =
        addressEntity!.apartment ?? "";
    inputs.firstWhere((element) => element.key == 'notes').controller.text =
        addressEntity!.notes ?? "";
  }

  void animateToMyLocation() async {
    LatLng latLng = await determinePosition();
    moveCameraTo(latLng);
  }

  Future<void> moveCameraTo(LatLng target, {double? zoom}) async {
    if (controller == null) return;
    await controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: zoom ?? 18),
      ),
    );
    notifyListeners();
  }
}
