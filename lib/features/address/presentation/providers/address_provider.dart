import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/address/domain/entities/address_label_entity.dart';
import 'package:flouka/features/address/domain/entities/area_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/dialog/custom_alert_dialog.dart';
import '../../../../../../core/dialog/snack_bar.dart';
import '../../../../../../core/dialog/success_dialog.dart';
import '../../../../../../core/helper_function/helper_function.dart';
import '../../../../../../core/helper_function/loading.dart';
import '../../../../../../core/helper_function/navigation.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/usecase/address_usecase.dart';
import '../views/saved_addresses_page.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressEntity> address = [];
  AddressEntity? addressEntity;
  final AddressUseCases addressUseCases;
  AddressProvider(this.addressUseCases);

  bool isFirstTime = false;
  Future getAddress() async {
    address.clear();
    Map<String, dynamic> data = {};
    address.add(fakeAddressEntitiy);
    address.add(fakeAddressEntitiy2);
    notifyListeners();
    // Either<DioException, List<AddressEntity>> result = await addressUseCases
    //     .getAddress(data);
    // result.fold(
    //   (l) async {
    //     showToast(l.message!);
    //   },
    //   (r) {
    //     address = r;
    //     if (address.isEmpty) {
    //       addressEntity = null;
    //       isFirstTime = true;
    //     } else {
    //       addressEntity = address.first;
    //       isFirstTime = false;
    //     }
    //     notifyListeners();
    //   },
    // );
  }

  void refresh() async {
    address.clear();
    await getAddress();
  }

  void updateAddress(AddressEntity addressEntity) {
    int index = address.indexWhere((element) => element.id == addressEntity.id);
    if (index != -1) {
      address[index] = addressEntity;
      notifyListeners();
    }
    if (this.addressEntity != null && this.addressEntity!.id == addressEntity.id) {
      this.addressEntity = addressEntity;
    }
  }

  bool isExpanded = false;
  void changeIsExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void showDeleteLocation(int id) {
    customAlertDialog(
      title: 'delete_location',
      content: 'delete_location_content',
      // image: Images.locationImage,
      top: -18.h,
      backConfirm: Colors.red,
      confirmFound: false,
      // backCancel: AppColor.redColor,
      confirm: '',
      cancelTextColor: Colors.black,
      confirmTap: () {
        navPop();
        deleteAddress(id);
      },
      cancel: 'delete',
      cancelTap: () {
        navPop();
        deleteAddress(id);
      },
    );
  }

  void deleteAddress(int id) async {
    Map<String, dynamic> data = {};
    data['address_id'] = id;
    loading();
    Either<DioException, bool> value = await addressUseCases.deleteAddress(data);
    navPop();
    value.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        int index = address.indexWhere((element) => element.id == id);
        if (index != -1) {
          address.removeAt(index);
          notifyListeners();
        }

        if (addressEntity != null && addressEntity!.id == id) {
          if (address.isEmpty) {
            addressEntity = null;
          } else {
            addressEntity = address.first;
            successDialog();
          }
        }
      },
    );
  }

  void addAddress(AddressEntity newAddress) {
    if (address.isEmpty) {
      addressEntity = newAddress;
    }
    address.add(newAddress);
    notifyListeners();
  }

  void goToAddressPage() async {
    navP(const SavedAddressesPage());
  }

  void setAddress(AddressEntity addressEntity) async {
    this.addressEntity = null;
    notifyListeners();
    await delay(100);
    this.addressEntity = addressEntity;
    notifyListeners();
  }

  void changeAddress(AddressEntity addressEntity) {
    if (this.addressEntity?.id == addressEntity.id) {
      this.addressEntity = null;
    } else {
      this.addressEntity = addressEntity;
    }
    notifyListeners();
  }

  bool isSelected(AddressEntity addressEntity) {
    return this.addressEntity?.id == addressEntity.id;
  }

  AddressEntity? selectedAdressEntity;
  void onSelectAddressEntity(AddressEntity adress) {
    this.selectedAdressEntity = adress;
    notifyListeners();
  }

  bool isAddressEntitySeleted(AddressEntity adressEntity) {
    return adressEntity.id == selectedAdressEntity?.id;
  }

  final List<AddressLabelEntity> labels = [
    AddressLabelEntity(label: "Home", svg: Images.addressHome),
    AddressLabelEntity(label: "Work", svg: Images.addressWork),
  ];

  AddressLabelEntity? selectedLabel;
  isLabelSelected(String label) {
    return selectedLabel?.label == label;
  }

  void changeLabel(String label) {
    selectedLabel = labels.firstWhere((element) => element.label == label);
    notifyListeners();
  }
}

final fakeAddressEntitiy = AddressEntity(
  id: 5,
  userId: 5,
  areaEntity: AreaEntity(id: 5, name: 'areaName', cityId: 5, partNumber: 5),
  areaId: 5,
  partNumber: 5,
  addressName: 'addressName',
  streetName: 'streetName',
  lat: 5,
  lng: 5,
  building: 'building',
  apartment: 'apartment',
  notes: 'notes',
  createdAt: 'createdAt',
);

final fakeAddressEntitiy2 = AddressEntity(
  id: 4,
  userId: 5,
  areaEntity: AreaEntity(id: 5, name: 'areaName', cityId: 5, partNumber: 5),
  areaId: 5,
  partNumber: 5,
  addressName: 'addressName',
  streetName: 'streetName',
  lat: 5,
  lng: 5,
  building: 'building',
  apartment: 'apartment',
  notes: 'notes',
  createdAt: 'createdAt',
);
