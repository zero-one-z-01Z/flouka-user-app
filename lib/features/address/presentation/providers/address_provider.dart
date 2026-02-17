import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/dialog/custom_alert_dialog.dart';
import '../../../../../core/dialog/snack_bar.dart';
import '../../../../../core/helper_function/helper_function.dart';
import '../../../../../core/helper_function/loading.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/usecase/address_usecase.dart';
import '../views/saved_addresses_page.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressEntity>? address;
  AddressEntity? addressEntity;
  final AddressUseCases addressUseCases;
  AddressProvider(this.addressUseCases);

  bool isFirstTime = false;
  Future getAddress() async {
    address ==null;
    Map<String, dynamic> data = {};
    Either<DioException, List<AddressEntity>> value = await addressUseCases
        .getAddress(data);
    value.fold(
      (l) async {
        showToast(l.message!);
      },
      (r) {
        address ??=[];
        address!.addAll(r);
        if (address!.isEmpty) {
          addressEntity = null;
          isFirstTime = true;
        } else {
          addressEntity = address!.first;
          isFirstTime = false;
        }
        notifyListeners();
      },
    );
    notifyListeners();

  }

  void refresh() async {
    address =null;
    notifyListeners();
    await getAddress();
  }

  void updateAddress(AddressEntity addressEntity) {
    int index = address!.indexWhere((element) => element.id == addressEntity.id);
    if (index != -1) {
      address![index] = addressEntity;
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
        int index = address!.indexWhere((element) => element.id == id);
        if (index != -1) {
          address!.removeAt(index);
          notifyListeners();
        }

        if (addressEntity != null && addressEntity!.id == id) {
          if (address!.isEmpty) {
            addressEntity = null;
          } else {
            addressEntity = address!.first;
            successDialog();
          }
        }
      },
    );
  }

  void addAddress(AddressEntity newAddress) {
    address ??=[];
    if (address!.isEmpty) {
      addressEntity = newAddress;
    }
    address!.add(newAddress);
    notifyListeners();
  }

  void goToAddressPage() async {
    refresh();
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
}
