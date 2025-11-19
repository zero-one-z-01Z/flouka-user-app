// import 'package:flutter/material.dart';
// import 'package:gifts/core/dialog/snack_bar.dart';
// import 'package:gifts/core/helper_function/navigation.dart';
// import 'package:gifts/core/models/provider_structure_model.dart';
// import 'package:gifts/features/products/presentation/pages/product_details_page.dart';
// import '../../domain/entity/product_entity.dart';
// import '../../domain/user_case/product_use_case.dart';

// class ProductDetailsProvider extends ChangeNotifier
//     implements ProviderStructureModel<ProductEntity> {
//   final ProductUseCase productUseCase;
//   ProductDetailsProvider(this.productUseCase);

//   @override
//   ProductEntity? data;

//   @override
//   Map? inputs;

//   bool isLoading = false;

//   @override
//   void clear() {
//     data = null;
//     notifyListeners();
//   }

//   @override
//   Future getData() async {
//     if (inputs == null || inputs!['product_id'] == null) return;
//     isLoading = true;
//     notifyListeners();

//     final result = await productUseCase.getProductDetails({
//       'product_id': inputs!['product_id'],
//     });

//     result.fold(
//       (l) => showToast(l.message ?? 'Error fetching product details'),
//       (r) {
//         data = r;
//       },
//     );

//     isLoading = false;
//     notifyListeners();
//   }

//   @override
//   void goToPage([Map<String, dynamic>? inputs]) {
//     this.inputs = inputs;
//     if (data != null) {
//       route.add(data!.id!);
//     }
//     clear();
//     navP(const ProductDetailsPage());
//     getData();
//   }

//   @override
//   Future refresh() async {
//     await getData();
//   }

//   List<int> route = [];
//   void goToPrevious() {
//     if (route.isNotEmpty) {
//       int id = route.last;
//       route.removeLast();
//       inputs = {'product_id': id};
//       getData();
//     } else {
      
//     }
//     navPop();
//   }

//   // void goToAdsDetailsPage({required int id, bool similar = false}) {
//   //   if (similar) {
//   //     route.add(data!.id!);
//   //   }
//   //   inputs = {'product_id': id};
//   //   getData();
//   //   // CommentProvider commentProvider =Provider.of(Constants.globalContext(),listen: false);
//   //   // commentProvider.isAdsPage =true;
//   //   navP(());
//   // }
// }
