import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/client_detail/data/external/product_api.dart';
import 'package:t_truck_app/features/clients/client_detail/data/repositories_impl/product_repository_impl.dart';
import 'package:t_truck_app/features/clients/client_detail/domain/repositories/i_product_repository.dart';
import 'package:t_truck_app/features/clients/client_detail/domain/use_cases/client_detail_list_use_case.dart';

import 'ui/page/client_detail_controller.dart';

class ClientDetailBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProduct>(
      () => ProductApi(iHttp: Get.find()),
    );

    Get.lazyPut<IProductRepository>(
        () => ProductRepository(iProduct: Get.find()));

    Get.lazyPut<ProductListUseCase>(
        () => ProductListUseCase(iProductRepository: Get.find()));

    Get.put(ClientDetailController(productListUseCase: Get.find()));
  }
}
