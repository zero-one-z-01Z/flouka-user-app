import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'cart_provider.dart';

extension CartOperations on CartProvider {
  Future increaseCart(int cartId) async {
    Map<String, dynamic> dataToUse = {'id': cartId};
    final result = await cartUseCase.increaseCart(dataToUse);
    result.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        final item = data!.firstWhere((element) => element.id == cartId);
        item.quantity = (item.quantity ?? 0) + 1;
        rebuild();
      },
    );
    rebuild();
  }

  Future decreaseCart(int cartId) async {
    Map<String, dynamic> dataToUse = {'id': cartId};
    final result = await cartUseCase.decreaseCart(dataToUse);
    result.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        final item = data!.firstWhere((element) => element.id == cartId);
        if (item.quantity == 1) {
          data!.remove(item);
        } else {
          item.quantity = (item.quantity ?? 0) - 1;
        }
        rebuild();
      },
    );
    rebuild();
  }

  bool checkIfProductIsInCart(int productId) {
    return data!.any((element) => element.product!.id == productId);
  }

  Future deleteCartItem(int cartId) async {
    Map<String, dynamic> dataToUse = {'id': cartId};
    final result = await cartUseCase.deleteCartItem(dataToUse);
    result.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        final item = data!.firstWhere((element) => element.id == cartId);
        data!.remove(item);
        rebuild();
      },
    );
    rebuild();
  }

  Future addToCart({
    required int productId,
  }) async {
    if (Provider.of<AuthProvider>(
          Constants.globalContext(),
          listen: false,
        ).userEntity ==
        null) {
      // showGuestDialog();
    } else {
      Map<String, dynamic> dataToUse = {};
      dataToUse['product_id'] = productId;
      dataToUse['quantity'] = 1;
      final result = await cartUseCase.addToCart(dataToUse);
      result.fold(
        (l) {
          showToast(l.message!);
        },
        (r) {
          successDialog(lottie: 'assets/lottie/success_order.json');
        },
      );
    }
  }
}
