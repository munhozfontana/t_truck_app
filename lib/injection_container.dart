import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_invoice_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/data/external/apis/invoice_external_api.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';
import 'package:t_truck_app/features/data/repository/invoice_repository.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_invoice_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/invoice/invoice_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/invoice_controller.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttp>(() => DioDriver(dio: Dio()));
    dependenciesLogin();
    dependenciesInvoice();
  }
}

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttp>(() => DioDriver(dio: Dio()));
    dependenciesInvoice();
  }
}

class InvoiceBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttp>(() => DioDriver(dio: Dio()));
    dependenciesLogin();
  }
}

void dependenciesInvoice() {
  Get.lazyPut<IInvoiceExternal>(() => InvoiceExternalApi(iHttp: Get.find()));
  Get.lazyPut<IInvoiceRepository>(
      () => InvoiceRepository(iInvoiceExternal: Get.find()));
  Get.lazyPut<InvoiceListUseCase>(
      () => InvoiceListUseCase(iInvoiceListRepository: Get.find()));
  Get.lazyPut<InvoiceController>(() => InvoiceController(invoiceListUseCase: Get.find()));
}

void dependenciesLogin() {
  Get.lazyPut<ILogin>(() => LoginApi(iHttp: Get.find()));
  Get.lazyPut<ILoginRepository>(() => LoginRepository(iLoginApi: Get.find()));
  Get.lazyPut<LoginUseCase>(() => LoginUseCase(iLoginRepository: Get.find()));
  Get.lazyPut<LoginController>(() => LoginController(loginUseCase: Get.find()));
}
