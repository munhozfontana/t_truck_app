import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/devolution/ui/page/devolution_page.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/utils/base_controller.dart';

class ListProductsController extends GetxController with BaseController {
  Rx<ClientModel> clientModel = ClientModel().obs;
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  RxString numTransVendaFeild = ''.obs;
  RxString nameFeild = ''.obs;

  void filterNumTransvendaChanged(String value) {
    numTransVendaFeild.value = value;
    numTransVendaFeild.refresh();
    filterComposer();
  }

  void filterNameChanged(String value) {
    nameFeild.value = value;
    nameFeild.refresh();
    filterComposer();
  }

  void filterComposer() {
    clientModel.value.copyWith(
        produtos: clientModel.value.produtos.map((element) {
      var transacaoFinded =
          element.nUMTRANSVENDA.toString() == numTransVendaFeild.value;

      var nameFinded = element.name.isCaseInsensitiveContains(nameFeild.value);

      print(nameFinded);

      if (transacaoFinded && nameFeild.isEmpty) {
        element.show = true;
      } else if (nameFeild.isNotEmpty && nameFinded) {
        element.show = true;
      } else {
        element.show = false;
      }

      return element;
    }).toList());

    clientModel.refresh();
  }

  void updadeListFromValue(String value, ProductModel productEntity) {
    if (!GetUtils.isNull(value)) {
      var listProducts = clientModel.value.produtos.map((p) {
        if (p.id == productEntity.id) {
          return p.copyWith(
              quantity: GetUtils.isBlank(value)! ? 0 : int.tryParse(value)!);
        } else {
          return p;
        }
      }).toList();

      clientModel.value = clientModel.value.copyWith(produtos: listProducts);
      clientModel.refresh();

      updateTypeDevolution();
    }
  }

  void updateTypeDevolution() {
    if (clientModel.value.produtos
        .where((element) => element.quantity < element.maxQuantity)
        .isEmpty) {
      typeDevolution.value = TypeOccurrence.RED;
    } else {
      typeDevolution.value = TypeOccurrence.YELLOW;
    }
  }

  void nextPage() {
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      Get.to(() => OccurrenceReasonPage(),
          // binding: OccurrenceReasonBiding(),
          arguments: [
            TypeOccurrence.YELLOW,
            clientModel,
          ]);
    } else {
      Get.to(() => OccurrenceReasonPage(),
          // binding: OccurrenceReasonBiding(),
          arguments: [
            TypeOccurrence.RED,
          ]);
    }
  }

  @override
  void onInit() async {
    typeDevolution.value = Get.arguments[0];
    clientModel.value = Get.arguments[1];
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      clientModel.value = clientModel.value.copyWith(
          produtos: clientModel.value.produtos.map((element) {
        return element.copyWith(quantity: 0);
      }).toList());
    } else {
      clientModel.value = clientModel.value.copyWith(
          produtos: clientModel.value.produtos.map((element) {
        return element.copyWith(quantity: element.maxQuantity);
      }).toList());
    }

    filterComposer();
    clientModel.refresh();
    super.onInit();
  }
}
