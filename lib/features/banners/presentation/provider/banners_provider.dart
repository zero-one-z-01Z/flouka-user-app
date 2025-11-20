import 'package:flutter/material.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/usecases/banners_usecases.dart';

class BannersProvider with ChangeNotifier {
  int currentIndex = 0;
  List<BannersEntity> bannersList = [];
  final BannersUseCase bannersUseCase;

  BannersProvider(this.bannersUseCase);

  Future<void> getBanners() async {
    bannersList.clear();
    notifyListeners();

    // Fake data instead of API call
    bannersList = [
      const BannersEntity(
        id: 1,
        image: 'https://placehold.co/600x400/000000/FFFFFF/png',
        link: null,
      ),
      const BannersEntity(
        id: 2,
        image: 'https://placehold.co/600x400/FFFFFF/000000/png',
        link: null,
      ),
      const BannersEntity(
        id: 3,
        image: 'https://placehold.co/600x400/000000/FFFFFF/png',
        link: null,
      ),
    ];

    //  Either<DioException, List<BannersEntity>> response = await bannersUseCase
    //     .getBanners(data);

    // response.fold((l) => showToast(l.message ?? "Error loading banners"), (r) {
    //   bannersList.addAll(r);

    notifyListeners();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
