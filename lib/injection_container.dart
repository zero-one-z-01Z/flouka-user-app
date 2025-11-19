import 'package:get_it/get_it.dart';
import 'core/helper_function/api.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<ApiHandel>(ApiHandel.getInstance);

  // auth
}
