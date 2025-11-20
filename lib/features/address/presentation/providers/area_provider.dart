import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/dialog/snack_bar.dart';
import '../../../../../../core/models/drop_down_class.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/area_entity.dart';
import '../../domain/usecase/city_usecase.dart';
import 'parts_provider.dart';

class AreaProvider extends ChangeNotifier implements DropDownClass<AreaEntity> {
  AreaEntity? areaEntity;
  List<AreaEntity> areas = [];
  final CityUseCases areaUseCases;
  AreaProvider(this.areaUseCases);

  Map<dynamic, dynamic> validation() {
    return {
      'value': selected() == null,
      "text": LanguageProvider.translate("validation", "select_area_first"),
    };
  }

  void clear() {
    areaEntity = null;
    areas.clear();
    notifyListeners();
  }

  void setData(int? id) {
    if (id != null) {
      areaEntity = areas.firstWhere((element) => element.id == id);
    } else {
      areaEntity = null;
    }
    notifyListeners();
  }

  Future getArea({required int id}) async {
    Map<String, dynamic> data = {};
    data['city_id'] = id;
    areas.clear();
    loading();
    Either<DioException, List<AreaEntity>> value = await areaUseCases.getArea(data);
    navPop();
    value.fold(
      (l) async {
        showToast(l.message!);
      },
      (r) {
        areas = r;
        notifyListeners();
      },
    );
  }

  @override
  String displayedName() {
    return areaEntity?.name ?? LanguageProvider.translate('inputs', 'city');
  }

  @override
  String displayedOptionName(AreaEntity type) {
    return type.name;
  }

  @override
  Widget? displayedOptionWidget(AreaEntity? type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<AreaEntity> list() {
    return areas;
  }

  @override
  Future onTap(AreaEntity? data) async {
    areaEntity = data;
    if (data != null) {
      Provider.of<PartsProvider>(
        Constants.globalContext(),
        listen: false,
      ).getParts(numbers: areaEntity!.partNumber);
    }
    notifyListeners();
  }

  @override
  AreaEntity? selected() {
    return areaEntity;
  }

  @override
  value() {
    return areaEntity?.id;
  }

  @override
  bool require() {
    return true;
  }

  @override
  String? titleName() {
    return null;
  }
}
