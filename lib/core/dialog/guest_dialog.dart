import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../helper_function/navigation.dart';
import 'custom_alert_dialog.dart';


void checkGuest(Function onTap){
  if(AuthProvider.isLogin()){
    onTap();
  }
  else{
    showGuestDialog();
  }
}

void showGuestDialog() {
  customAlertDialog(
    image: 'assets/images/home/guest_dialog.png',
    title: 'must_login',
    content: 'must_login_first',
    cancel: 'cancel',
    confirm: 'login',
    cancelTap: () {
      navPop();
    },
    confirmTap: () {
      Provider.of<AuthProvider>(
        Constants.globalContext(),
        listen: false,
      ).goToLoginView();
    },
  );
}
