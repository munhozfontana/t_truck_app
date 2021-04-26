import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:t_truck_app/features/data/external/adapters/i_http.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/drivers/http_driver.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(
    () => LoginController(
      loginUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginUseCase(
      iLoginRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ILoginRepository>(
    () => LoginRepository(
      iLoginApi: sl(),
    ),
  );
  sl.registerLazySingleton<ILogin>(
    () => LoginApi(
      iHttp: sl(),
    ),
  );
  sl.registerLazySingleton<IHttp>(
    () => HttpDriver(
      client: http.Client(),
    ),
  );
}
