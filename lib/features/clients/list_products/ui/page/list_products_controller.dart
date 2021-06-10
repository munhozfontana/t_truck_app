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
    (clientModel.value.produtos).map((element) {
      var transacaoFinded =
          element.nUMTRANSVENDA.toString() == numTransVendaFeild.value;

      var nameFinded = element.name.isCaseInsensitiveContains(nameFeild.value);

      if (transacaoFinded && nameFeild.isEmpty) {
        element.hidden = false;
      } else if (nameFeild.isNotEmpty && nameFinded) {
        element.hidden = false;
      } else {
        element.hidden = true;
      }

      return element;
    }).toList();

    update();
  }

  void updadeListFromValue(String value, ProductModel productEntity) {
    if (!GetUtils.isNull(value)) {
      var listProducts = clientModel.value.produtos.map((p) {
        if (p.id == productEntity.id) {
          return productEntity.copyWith(
              quantity: GetUtils.isBlank(value)! ? 0 : int.tryParse(value)!);
        } else {
          return productEntity;
        }
      }).toList();

      clientModel.value.copyWith(produtos: listProducts);

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
    typeDevolution.value = Get.arguments[1];
    clientModel.value = Get.arguments[0];
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      // listProducts.value = listProducts.map((element) {
      //   return ProductEntity(
      //     codProd: element.codProd,
      //     descricao: element.descricao,
      //     qt: element.qt,
      //     qtToSend: 0,
      //     transacaoVendaEntity: element.transacaoVendaEntity,
      //   );
      // }).toList();
    } else {
      // listProducts.value = listProducts.map((element) {
      //   return ProductEntity(
      //     codProd: element.codProd,
      //     descricao: element.descricao,
      //     qt: element.qt,
      //     qtToSend: element.qt,
      //     transacaoVendaEntity: element.transacaoVendaEntity,
      //   );
      // }).toList();
    }

    filterComposer();
    clientModel.refresh();
    super.onInit();
  }
}

class Tste1 {
  final String? atributo;

  Tste1(this.atributo);
}

class Tste2 extends Tste1 {
  @override
  final String? atributo;
  final String? atributo2;

  Tste2({
    this.atributo,
    this.atributo2,
  }) : super('');

  Tste2 copyWith({
    String? atributo,
    String? atributo2,
  }) {
    return Tste2(
      atributo: atributo ?? this.atributo,
      atributo2: atributo2 ?? this.atributo2,
    );
  }
}
