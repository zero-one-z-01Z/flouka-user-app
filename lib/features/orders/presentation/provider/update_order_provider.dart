import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flutter/material.dart';

import '../views/update_order_view.dart';

class UpdateOrderProvider extends ChangeNotifier {
  gotoPage() {
    navP(const UpdateOrderView());
  }
}
