import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/cart/presentation/providers/coupon_provider.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/guest_dialog.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../products/domain/entity/product_image_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/use_case/cart_use_case.dart';
import '../views/cart_view.dart';

class CartProvider extends ChangeNotifier
    implements ProviderStructureModel<List<CartEntity>> {
  final CartUseCase cartUseCase;

  CartProvider(this.cartUseCase);

  @override
  List<CartEntity>? data;

  @override
  Map? inputs;

  @override
  void clear() {
    data = null;
    inputs = null;
    notifyListeners();
  }

  @override
  Future getData() async {
    // final result = await cartUseCase.getCart();
    // result.fold(
    //   (l) {
    //     showToast(l.message!);
    //   },
    //   (r) {
    //     data ??= [];
    //     data!.addAll(r);
    //     log(data.toString());
    //   },
    // );
    data = [];
    data!.addAll([
      CartEntity(
        id: 2,
        quantity: 1,
        product: ProductEntity(
          id: 1,
          name: "Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB",
          description: "Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB",
          price: 959,
          offerPrice: 959,
          active: true,
          marketId: 1,
          image: "https://placehold.co/600x400",
          images: [
            ProductImageEntity(id: 1, productId: 1, image: AppImages.testLaptop1),
          ],
        ),
      ),
      CartEntity(
        id: 2,
        quantity: 1,
        product: ProductEntity(
          id: 1,
          name: "Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB",
          description: "Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB",
          price: 959,
          offerPrice: 959,
          active: true,
          marketId: 1,
          image: "",
          images: [
            ProductImageEntity(id: 1, productId: 1, image: AppImages.testLaptop1),
          ],
        ),
      ),
    ]);
    notifyListeners();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) async {
    if (Provider.of<AuthProvider>(
          Constants.globalContext(),
          listen: false,
        ).userEntity ==
        null) {
      showGuestDialog();
    } else {
      Provider.of<CouponProvider>(Constants.globalContext(), listen: false).coupon =
          TextEditingController(text: '');
      Provider.of<CouponProvider>(
        Constants.globalContext(),
        listen: false,
      ).isApplied = false;
      refresh();
      navP(const CartView());
      notifyListeners();
    }
  }

  @override
  Future refresh() async {
    clear();
    await getData();

    notifyListeners();
  }

  num caluclateTotal() {
    final couponProvider = Provider.of<CouponProvider>(
      Constants.globalContext(),
      listen: false,
    );
    if (data == null) {
      return 0;
    }
    num allSubTotal = 0;
    for (var element in data!) {
      allSubTotal += element.subTotal;
    }
    // if (couponProvider.isApplied) {
    //   allSubTotal = allSubTotal - couponProvider.calcCoupon(allSubTotal)!;
    // }
    return allSubTotal;
  }

  ScrollController controller = ScrollController();
  void rebuild() {
    notifyListeners();
  }

  TextEditingController couponController = TextEditingController();
}
