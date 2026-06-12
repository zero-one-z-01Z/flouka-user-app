import 'package:app_links/app_links.dart';
import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flouka/features/stores/presentation/providers/store_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../helper_function/convert.dart';

class DeepLinkService {
  static final DeepLinkService _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;
  DeepLinkService._internal();

  final _appLinks = AppLinks();
  bool _initialized = false;

  void init() {
    if (_initialized) return; // prevent reinit
    _initialized = true;

    // Listen for incoming links while app is running
    _appLinks.uriLinkStream.listen((uri) {
      print('uriLinkStream');
      final map = uri.queryParameters;
      int id = convertStringToInt(map['id']);
      if (uri.path.contains('store')) {
        Provider.of<StoreDetailsProvider>(Constants.globalContext(),listen: false).goToStoreDetailsPage(id);
      }
      if (uri.path.contains('product')) {
        Provider.of<ProductDetailsProvider>(Constants.globalContext(),listen: false).goToPage({'product_id':id});
      }
    });

    // Handle initial link when app is opened from a link
    _appLinks.getInitialLink().then((uri) {
      print("getInitialLink");
      final map = uri?.queryParameters??{};
      int id = convertStringToInt(map['id']);
      if (uri != null && uri.path.contains('auction')) {
        Provider.of<StoreDetailsProvider>(Constants.globalContext(),listen: false).goToStoreDetailsPage(id);
      }
      if (uri?.path.contains('new_user')??false) {
        Provider.of<ProductDetailsProvider>(Constants.globalContext(),listen: false).goToPage({'product_id':id});
      }
    });
  }

}
