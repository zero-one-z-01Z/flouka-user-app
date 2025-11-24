import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/confirm_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/helper_function/helper_function.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/widgets/payment_online_page.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/operation_entity.dart';
import '../../domain/use_cases/wallet_use_cases.dart';
import '../pages/user_wallet_page.dart';
import '../widgets/charge_wallet_widget.dart';

class WalletProvider extends ChangeNotifier implements PaginationClass {
  List<OperationEntity>? myOperations = [];
  final WalletUseCases walletUseCases;
  WalletProvider(this.walletUseCases);

  Future walletOperations() async {
    myOperations = [
      OperationEntity(
        id: 1,
        userId: 1,
        price: "100",
        operation: "deposited",
        createdAt: DateTime.now().toString(),
      ),
      OperationEntity(
        id: 2,
        userId: 1,
        price: "20",
        operation: "deducted",
        createdAt: DateTime.now().toString(),
      ),
      OperationEntity(
        id: 3,
        userId: 1,
        price: "100",
        operation: "deposited",
        createdAt: DateTime.now().toString(),
      ),
    ];
    notifyListeners();
    // Map<String, dynamic> data = {};
    // data['page'] = pageIndex;
    // Either<DioException, List<OperationEntity>> login = await walletUseCases
    //     .walletOperations(data);
    // login.fold(
    //   (l) {
    //     showToast("${l.message}");
    //   },
    //   (r) async {
    //     pageIndex++;
    //     myOperations ??= [];
    //     myOperations?.addAll(r);
    //     if (r.isEmpty) {
    //       paginationFinished = true;
    //     }
    //   },
    // );
    // paginationStarted = false;
    //
    // notifyListeners();
  }

  void goToWalletPage() {
    // if (AuthProvider.isLogin()) {
    // refresh();
    navP(UserWalletHome());
    // } else {
    // showGuestDialog();
    // }
  }

  void refresh() {
    clear();
    notifyListeners();
    Provider.of<AuthProvider>(
      Constants.globalContext(),
      listen: false,
    ).getProfile();
    walletOperations();
  }

  void showChargeSheet() {
    showModalBottomSheet(
      context: Constants.globalContext(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      builder: (context) {
        return const ChargeWalletWidget();
      },
      // isScrollControlled: true,
    );
  }

  void clear() {
    myOperations = null;
    paginationStarted = false;
    paginationFinished = false;
    pageIndex = 1;
  }

  TextEditingController walletChargeController = TextEditingController();

  void decreaseWallet(num price) {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      Constants.globalContext(),
      listen: false,
    );
    authProvider.userEntity!.wallet = (authProvider.userEntity!.wallet) - price;
    authProvider.rebuild();
  }

  // void updateWallet() async {
  //   loading();
  //   AuthProvider authProvider = Provider.of(Constants.globalContext(),listen: false);
  //   Either<DioException, UserEntity> response;
  //   Map<String, dynamic> data = {};
  //   data['money'] = walletChargeController.text;
  //   response = await WalletUseCases(sl()).chargeWallet(data);
  //   navPop();
  //   response.fold((l) {
  //     showToast(l.message!);
  //   }, (r) {
  //     authProvider.userEntity = r;
  //     walletOperations();
  //     walletChargeController.clear();
  //     notifyListeners();
  //     successDialog();
  //   });
  // }

  Future<bool> checkWallet({required num moneyAmount}) async {
    AuthProvider authProvider = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
    if (moneyAmount > convertDataToDouble(authProvider.userEntity!.wallet)) {
      showToast(LanguageProvider.translate('error', 'wallet'));
      await delay(1000);
      confirmDialog(
        LanguageProvider.translate('wallet', 'charge_wallet'),
        LanguageProvider.translate('buttons', 'confirm'),
        () {
          navPop();
          refresh();
          navP(UserWalletHome(fromHome: false));
        },
      );
      return false;
    } else {
      return true;
    }
  }

  void chargeWallet({required String value}) {
    AuthProvider authProvider = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
    navP(
      PaymentOnlinePage(total: convertDataToNum(value)!, type: 'wallet'),
      then: (val) {
        if (val == 'paid') {
          // SettingsProvider userProfileProvider = Provider.of(
          //   Constants.globalContext(),
          //   listen: false,
          // );
          successDialog();
          authProvider.userEntity!.wallet =
              authProvider.userEntity!.wallet + convertDataToNum(value)!;
          authProvider.rebuild();
          notifyListeners();
        } else if (val == 'filed') {
          showToast(LanguageProvider.translate('error', 'error'));
        }
      },
    );
  }

  //
  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;
  ScrollController controller = ScrollController();
  @override
  void pagination() async {
    controller.addListener(() async {
      if (controller.position.atEdge && controller.position.pixels > 50) {
        if (!paginationFinished &&
            !paginationStarted &&
            myOperations != null &&
            myOperations!.isNotEmpty) {
          paginationStarted = true;
          notifyListeners();
          await walletOperations();
        }
      }
    });
  }
}
