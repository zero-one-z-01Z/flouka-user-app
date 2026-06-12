import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'cart_provider.dart';

extension CartOperations on CartProvider {
  Future increaseCart(int cartId) async {
    Map<String, dynamic> dataToUse = {};
    dataToUse['id'] = cartId;
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
    Map<String, dynamic> dataToUse = {};
    dataToUse['id'] = cartId;
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

  Future deleteCart()async{
    Map<String, dynamic> dataToUse = {};
    final result = await cartUseCase.deleteCart(dataToUse);
    result.fold(
          (l) {
        showToast(l.message!);
      }, (r) {

      },
    );
  }

  bool checkIfProductIsInCart(int productId) {
    return data!.any((element) => element.product!.id == productId);
  }

  Future deleteCartItem(int cartId) async {
    Map<String, dynamic> dataToUse = {};
    dataToUse['id'] = cartId;
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

  Future addToCart({required int storeId, required int quantity, required int storeProductStockId}) async {
    if (Provider.of<AuthProvider>(Constants.globalContext(), listen: false,).userEntity ==  null) {
      // showGuestDialog();
    } else {
      Map<String, dynamic> dataToUse = {};
      dataToUse['store_id'] = storeId;
      dataToUse['quantity'] = quantity;
      dataToUse['store_product_stock_id'] = storeProductStockId;
      loading();
      final result = await cartUseCase.addToCart(dataToUse);
      navPop();
      result.fold(
        (l) {
          showToast(l.message!);
          print('xxxxxxxxxxxx${dataToUse}');
          // showToast(dataToUse.toString());

        },
        (r) {
          successDialog(lottie: 'assets/lottie/success_order.json');
        },
      );
    }
  }
}
