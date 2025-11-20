import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/wallet_provider.dart';
import '../widgets/header_wallet_widget.dart';
import '../widgets/user_list_of_operations_widget.dart';
import '../widgets/wallet_bottom_widget.dart';

class UserWalletHome extends StatelessWidget {
  UserWalletHome({super.key, this.fromHome = true});
  final ScrollController controller = ScrollController();
  final bool fromHome;
  @override
  Widget build(BuildContext context) {
    WalletProvider walletProvider = Provider.of(context);
    walletProvider.pagination();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            title: Text(LanguageProvider.translate('settings', 'wallet')),
            elevation: 0,
          ),
          bottomNavigationBar: const WalletBottomWidget(),
          body: RefreshIndicator(
            onRefresh: () async {
              walletProvider.refresh();
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWalletWidget(),
                    const ListOfTransactionWidgets(),
                    if (walletProvider.paginationStarted) const LoadingWidget(),
                    SizedBox(height: 7.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
