import 'package:flouka/features/products/domain/entity/product_image_entity.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../domain/user_case/product_use_case.dart';
import '../pages/products_details_view.dart';

class ProductDetailsProvider extends ChangeNotifier
    implements ProviderStructureModel<ProductEntity> {
  @override
  ProductEntity? data;

  @override
  Map? inputs;

  // bool isLoading = false;
  PageController pageController = PageController();

  final ProductUseCase productUseCase;

  List<int> productsIDs = [];

  ProductDetailsProvider({required this.productUseCase});

  @override
  void clear() {
    data = null;
    // colors = [];
    // sizes = [];
    notifyListeners();
  }

  @override
  Future getData() async {
    // if (inputs == null || inputs!['product_id'] == null) return;
    // isLoading = true;
    data = null;
    data = fakeProduct;
    notifyListeners();
    // final result = await productUseCase.getProductDetails({
    //   'product_id': productsIDs.isEmpty ? inputs!['product_id'] : productsIDs.last,
    // });

    // result.fold((l) => showToast(l.message ?? ''), (
    //   productDetails,
    // ) {
    //   data = productDetails;
    //   sizes = [];
    //   colors = [];
    //   for (var element in data!.stock!) {
    //     int index = colors.indexWhere((colorElement) => colorElement.id == element.colorId);
    //     if (index == -1) {
    //       colors.add(element.colorEntity!);
    //     }
    //   }
    //   if(colors.isNotEmpty) {
    //     onColorChange(colors.first);
    //   }
    // });

    // isLoading = false;
    // notifyListeners();
  }

  void backToLastProduct() {
    if (productsIDs.length > 1) {
      productsIDs.removeLast();
      refresh();
    } else {
      navPop();
    }
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) async {
    // this.inputs = inputs;
    // if (!inputs!['is_similar']) {
    //   navP(const ProductsDetailsView());
    // } else {
    //   productsIDs.add(inputs['product_id']);
    // }

    await refresh();
    navP(const ProductsDetailsView());
  }

  @override
  Future refresh() async {
    clear();
    await getData();
    notifyListeners();
  }

  List<Color> colorsList = [Colors.red, Colors.green, Colors.blue, Colors.purple];
  late Color selectedColor = colorsList.first;

  void onColorChange(Color newColor) {
    if (selectedColor == newColor) return;
    selectedColor = newColor;
    notifyListeners();
  }

  bool isColorSelected(Color color) {
    return selectedColor == color;
  }

  // ColorEntity? colorEntity;
  // onColorChange(ColorEntity newColor) {
  //   if (colorEntity?.id == newColor.id) {
  //     return;
  //   }
  //   sizeEntity = null;
  //   sizes = [];
  //   for (var elemnt in data!.stock!.where(
  //     (element) => element.colorId == newColor.id,
  //   )) {
  //     int index = sizes.indexWhere((element) => element.id == elemnt.sizeId);
  //     if (index == -1) {
  //       sizes.add(elemnt.sizeEntity!);
  //     }
  //   }
  //   colorEntity = newColor;
  //   notifyListeners();
  // }

  // bool isColorSelected(ColorEntity color) {
  //   return colorEntity?.id == color.id;
  // }

  // bool isSizeAvialalbe(SizeEntity newSize) {
  //   return data!.stock!.any(
  //     (element) =>
  //         element.sizeId == newSize.id &&
  //         element.colorId == colorEntity!.id &&
  //         element.stock! > 0,
  //   );
  // }

  // SizeEntity? sizeEntity;
  // onSizeChange(SizeEntity newSize) {
  //   if (isSizeAvialalbe(newSize)) {
  //     sizeEntity = newSize;
  //     notifyListeners();
  //   }
  // }

  // bool isSizeSelected(SizeEntity size) {
  //   return sizeEntity?.id == size.id;
  // }

  // updateFavourite(bool isFavorite) {
  //   if (data == null) return;
  //   data!.isFavorite = isFavorite;
  //   notifyListeners();
  // }

  // List<ColorEntity> colors = [];
  // List<SizeEntity> sizes = [];

  // List<ImageEntity> allImages(){
  //   List<ImageEntity> images = List.from(data!.images!);
  //   int index = data?.stock?.indexWhere((element) => element.id == colorEntity?.id && element.image!=null)??-1;
  //   if(index!=-1){
  //     images.insert(0,ImageEntity(id: 0, image: data!.stock![index].image!));
  //   }
  //   return images;
  // }
}

// product details entity => List<StockEntity>
// loop data in stock entity => size stock entity => colors stock entity
// product stock entity

final fakeProduct = ProductEntity(
  id: 5,
  name: 'Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB',
  description:
      'For now, the Lenovo Yoga 920 is the highest variant of the Yoga series. The specifications are no joke. With the 8th generation Kaby Lake Refresh Intel Core i7-8550U processor.',
  price: 1000,
  offerPrice: 800,
  active: true,
  marketId: 1,
  image: "https://placehold.co/600x400/000000/FFFFFF/png",
  images: [
    ProductImageEntity(
      id: 45,
      productId: 5,
      image: "https://placehold.co/600x400/000000/FFFFFF/png",
    ),
    ProductImageEntity(
      id: 45,
      productId: 5,
      image: "https://placehold.co/600x400/000000/FFFFFF/png",
    ),
  ],
);
