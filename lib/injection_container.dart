import 'package:flouka/features/address/data/repository/address_repository_impl.dart';
import 'package:flouka/features/categories/data/repositories/category_repo_impl.dart';
import 'package:flouka/features/categories/domain/usecases/category_usecase.dart';
import 'package:get_it/get_it.dart';

// import 'package:gifts/settings/data/datasources/remote.dart';
// import 'package:gifts/settings/data/repositories/settings_repo_impl.dart';
// import 'package:gifts/settings/domain/repositories/settings_repo.dart';
// import 'package:gifts/settings/domain/usecases/settings_usecases.dart';

import 'core/helper_function/api.dart';
import 'features/address/data/datasource/address_remote_data_source.dart';
import 'features/address/domain/repository/address_repository.dart';
import 'features/address/domain/usecase/address_usecase.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repo/user_repo_impl.dart';
import 'features/auth/domain/repo/auth_repo.dart';
import 'features/auth/domain/usecases/user_usecases.dart';
import 'features/banners/data/datasource/remote.dart';
import 'features/banners/data/repositories/banners_repo_impl.dart';
import 'features/banners/domain/repositories/banner_repository.dart';
import 'features/banners/domain/usecases/banners_usecases.dart';
import 'features/cart/data/data_source/cart_remote_data_source.dart';
import 'features/cart/data/repo/cart_repo_impl.dart';
import 'features/cart/domain/repo/cart_repo.dart';
import 'features/cart/domain/use_case/cart_use_case.dart';
import 'features/categories/data/datasource/remote.dart';
import 'features/categories/domain/repositories/category_repo.dart';
import 'features/orders/data/data_srouce/order_remote_data_source.dart';
import 'features/orders/data/repos/order_repo_impl.dart';
import 'features/orders/domain/repos/order_repo.dart';
import 'features/orders/domain/use_case/order_use_case.dart';
import 'features/wallet/data/data_sources/remote.dart';
import 'features/wallet/data/repositories/wallet_repo.dart';
import 'features/wallet/domain/repositories/wallet_repo_impl.dart';
import 'features/wallet/domain/use_cases/wallet_use_cases.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<ApiHandel>(ApiHandel.getInstance);

  // auth
  sl.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSource(sl.get()));
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl.get()));
  sl.registerSingleton<AuthUseCase>(AuthUseCase(sl.get()));
  // cart
  sl.registerSingleton<CartRemoteDataSource>(CartRemoteDataSource(sl.get()));
  sl.registerSingleton<CartRepo>(CartRepoImpl(sl.get()));
  sl.registerSingleton<CartUseCase>(CartUseCase(sl.get()));
  // addresses
  sl.registerSingleton<AddressRemoteDataSource>(
    AddressRemoteDataSource(sl.get()),
  );
  sl.registerSingleton<AddressRepo>(AddressRepoImpl(sl.get()));
  sl.registerSingleton<AddressUseCases>(AddressUseCases(sl.get()));
  // order
  sl.registerSingleton<OrderRemoteDataSource>(OrderRemoteDataSource(sl.get()));
  sl.registerSingleton<OrderRepo>(OrderRepoImpl(sl.get()));
  sl.registerSingleton<OrderUseCase>(OrderUseCase(sl.get()));

  // wallet
  sl.registerSingleton<WalletRemoteDataSource>(WalletRemoteDataSource(sl.get()),);
  sl.registerSingleton<WalletRepo>(WalletRepoImpl(sl.get()));
  sl.registerSingleton<WalletUseCases>(WalletUseCases(sl.get()));

  // tickets
  
  // sl.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource(sl.get()));
  // sl.registerSingleton<UserRepo>(UserRepoImpl(userRemoteDatasource: sl.get()));
  // sl.registerSingleton<UserUseCases>(UserUseCases(sl.get()));

  // sl.registerSingleton<ProductRemoteDataSource>(
  //   ProductRemoteDataSource(sl.get()),
  // );
  // sl.registerSingleton<ProductRepo>(ProductRepoImpl(sl.get()));
  // sl.registerSingleton<ProductUseCase>(ProductUseCase(sl.get()));

  // sl.registerSingleton<MarketRemoteDataSource>(
  //   MarketRemoteDataSource(sl.get()),
  // );
  // sl.registerSingleton<MarketRepo>(MarektRepoImpl(sl.get()));
  // sl.registerSingleton<MarketUseCase>(MarketUseCase(sl.get()));

  // sl.registerSingleton<CartRemoteDataSource>(CartRemoteDataSource(sl.get()));
  // sl.registerSingleton<CartRepo>(CartRepoImpl(sl.get()));
  // sl.registerSingleton<CartUseCase>(CartUseCase(sl.get()));

  // sl.registerSingleton<OrderRemoteDataSource>(OrderRemoteDataSource(sl.get()));
  // sl.registerSingleton<OrderRepo>(OrderRepoImpl(sl.get()));
  // sl.registerSingleton<OrderUseCase>(OrderUseCase(sl.get()));

  // //addresses
  // sl.registerSingleton<AddressRemoteDataSource>(
  //   AddressRemoteDataSource(sl.get()),
  // );
  // sl.registerSingleton<AddressRepo>(AddressRepoImpl(sl.get()));
  // sl.registerSingleton<AddressUseCases>(AddressUseCases(sl.get()));

  // //city
  // sl.registerSingleton<CityRemoteDataSource>(CityRemoteDataSource(sl.get()));
  // sl.registerSingleton<CityRepo>(CityRepoImpl(sl.get()));
  // sl.registerSingleton<CityUseCases>(CityUseCases(sl.get()));

  //banners
  sl.registerSingleton<BannersRemoteDataSource>(BannersRemoteDataSource(sl.get()));
  sl.registerSingleton<BannersRepository>(BannersRepoImpl(sl.get()));
  sl.registerSingleton<BannersUseCase>(BannersUseCase(sl.get()));

  // // //settings
  // sl.registerSingleton<SettingsRemoteDataSource>(
  //   SettingsRemoteDataSource(sl.get()),
  // );
  // sl.registerSingleton<SettingsRepo>(SettingsRepoImpl(sl.get()));
  // sl.registerSingleton<SettingsUseCases>(SettingsUseCases(sl.get()));

  //categories
  sl.registerSingleton<CategoryRemoteDataSource>(CategoryRemoteDataSource(sl.get()));
  sl.registerSingleton<CategoryRepo>(CategoryRepoImpl(sl.get()));
  sl.registerSingleton<CategoryUsecase>(CategoryUsecase(sl.get()));

  // // market auth
  // sl.registerSingleton<MarketAuthRemoteDataSource>(
  //   MarketAuthRemoteDataSource(sl.get()),
  // );
  // sl.registerSingleton<MarketAuthRepo>(
  //   MarketAuthRepoImpl(marketRemoteDataSource: sl.get()),
  // );
  // sl.registerSingleton<MarketAuthUsecase>(MarketAuthUsecase(sl.get()));

  // //tickets
  // sl.registerSingleton<RemoteTicketsDataSource>(
  //   RemoteTicketsDataSource(sl.get()),
  // );
  // sl.registerSingleton<TicketsRepository>(TicketsRepoImpl(sl.get()));
  // sl.registerSingleton<TicketsUseCase>(TicketsUseCase(sl.get()));

  // //marketOrder
  // sl.registerSingleton<MarketOrderRemoteDatasource>(
  //   MarketOrderRemoteDatasource(sl.get()),
  // );
  // sl.registerSingleton<MarketOrderRepo>(MarketOrderRepoImpl(sl.get()));
  // sl.registerSingleton<MarketOrderUsecase>(MarketOrderUsecase(sl.get()));
}
