import 'package:flouka/features/products/domain/user_case/product_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../categories/data/model/category_model.dart';
import '../../../categories/domain/entity/category_entity.dart';
import '../../../categories/domain/usecases/category_usecase.dart';
import '../../../products/domain/entity/product_entity.dart';

class FilterProductProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCase;
  final ProductUseCase productUseCase;

  FilterProductProvider(this.categoryUseCase,this.productUseCase);
  List<CategoryEntity>? data;

  Future<void> getData() async {
    var response = await categoryUseCase.getMainCategories();
    response.fold((l) {}, (r) {
      data=[];
      List<CategoryModel> staticCategories = [
        CategoryModel(id: 0, name: 'for_you',image: "", parentId: null,),
        CategoryModel(id: -1, name: 'new_gadget',image: "", parentId: null,),
        CategoryModel(id: -2, name: 'best_selling',image: "", parentId: null,),
      ];
      data?.addAll(staticCategories);

      data?.addAll(r);
      filters.addAll(data!);
      getFilterProducts(filters.first.id);
      notifyListeners();
    });
  }

  bool isProductLoading = false;
  List<ProductEntity>? products;
  List<ProductEntity> homeProducts = [];

  Future<void> getFilterProducts(int id) async {
    isProductLoading = true;
    Map<String,dynamic> data = {};
    data['page'] = 1;
    data['skip'] = 2;
    notifyListeners();
    if(id ==0){

    }else if(id==-2){
      data['best_selling'] = 1;
    }else if(id ==-1){

    }else{
      data['category_id']= id;
    }
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      data['lat'] = authProvider.currentLocation?.latitude;
      data['lng'] = authProvider.currentLocation?.longitude;
    }
    var response;
    if(id == 0){
      response = await productUseCase.getSuggestedProducts(data);
    }else{
      response = await productUseCase.getProducts(data);
    }
    response.fold((l) {}, (r) {
      products = r;
    });
    isProductLoading = false;
    notifyListeners();
  }

  final List<CategoryEntity> filters = [];

  late CategoryEntity selectedFilter = filters.first;

  void setSelectedIndex(CategoryEntity filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  bool isSelected(CategoryEntity filter) {
    return selectedFilter.id == filter.id;
  }

  bool get isLoading => isProductLoading;

  ProductEntity fakeProduct = ProductEntity(
    id: -1,
    title: 'Loading Product Title...',
    image: "",
    related: [],
    reviewImages: [],
    reviews: [],
      store: null,discountPercentage: 0.0,
    discountTitle: "",
    description: 'Loading Description...',
    price: 99.99,
    offerPrice: 0,
    recommended: [],
    images: [],
    stock: null,
    rate: 4.5,
    isFavorite: false,
    attributes: [],
    variants: []
  );
}
