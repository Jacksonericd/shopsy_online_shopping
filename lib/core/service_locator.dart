import 'package:get_it/get_it.dart';
import 'package:shopsy/data/datasources/cart_local_data_source.dart';
import 'package:shopsy/data/datasources/product_local_data_source.dart';
import 'package:shopsy/data/repositories/cart_repository_impl.dart';
import 'package:shopsy/data/repositories/product_repository_impl.dart';
import 'package:shopsy/data/services/preference_service_impl.dart';
import 'package:shopsy/domain/repositories/cart_repository.dart';
import 'package:shopsy/domain/repositories/product_repository.dart';
import 'package:shopsy/domain/services/navigation_service.dart';
import 'package:shopsy/domain/services/preference_service.dart';
import 'package:shopsy/domain/usecases/cart_usecases.dart';
import 'package:shopsy/domain/usecases/product_usecases.dart';

import '../data/services/navigation_service_impl.dart';

final sl = GetIt.instance;

init() {
  //Product
  sl.registerLazySingleton(() => ProductLocalDataSource());
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => ProductUsecases(sl()));
  //cart
  sl.registerLazySingleton(() => CartLocalDataSource());
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
  sl.registerLazySingleton(() => CartUseCases());
  //shared preference service
  sl.registerLazySingleton<PreferenceService>(() => PreferenceServiceImpl());
  // go router navigation service
  sl.registerLazySingleton<NavigationService>(()=> NavigationServiceImpl());
}
