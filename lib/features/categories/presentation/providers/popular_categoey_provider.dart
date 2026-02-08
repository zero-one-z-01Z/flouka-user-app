import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class PopularCategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  PopularCategoryProvider(this.categoryUseCases);
  final List<CategoryEntity> _popularCategories = [];

  List<CategoryEntity> get popularCategories => _popularCategories;

  Future<void> getPopularCategories() async {
    notifyListeners();

    Either<DioException, List<CategoryEntity>> response = await categoryUseCases
        .getCategories();

    response.fold((l) => showToast(l.message ?? "Error loading categories"), (r) {
      _popularCategories.addAll(r);
      notifyListeners();
    });
  }
}
