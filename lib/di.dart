import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:add_lease/presentation/provider/my_leases_provider/my_leases_provider.dart';
import 'package:get_it/get_it.dart';
import 'data/dio/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;



Future<void> init() async {


  //provider
 sl.registerLazySingleton(() => LeaseProvider());
 sl.registerLazySingleton(() => MyLeasesProvider());
 // sl.registerLazySingleton(() => InfoProvider());
 // sl.registerLazySingleton(() => DepositProvider());
 // sl.registerLazySingleton(() => TenantsProvider());
 // sl.registerLazySingleton(() => ExtraChangesProvider());
 // sl.registerLazySingleton(() => LateFeesProvider());




 // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}
