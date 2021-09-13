import 'package:get/get.dart';

import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../../devolution/devolution_biding.dart';
import '../../../devolution/ui/page/devolution_page.dart';
import '../../../list_clients/data/models/client_model.dart';
import '../../data/models/product_model.dart';

class ListProductsController extends GetxController with BaseController {
  Rx<ClientModel> clientModel = ClientModel().obs;
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  RxString numTransVendaFeild = ''.obs;
  RxString nameFeild = ''.obs;

  RxBool blockField = false.obs;

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
          element.numTransVenda.toString() == numTransVendaFeild.value;

      var nameFinded = element.name.isCaseInsensitiveContains(nameFeild.value);

      if (blockField.isFalse && nameFeild.isEmpty) {
        element.show = true;
        return element;
      }

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

  void updadeListFromValue(String value, ProductModel productModel) {
    if (!GetUtils.isNull(value)) {
      var listProducts = clientModel.value.produtos.map((p) {
        if (p.id == productModel.id) {
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
      Get.to(
        () => DevolutionPage(),
        binding: DevolutionBiding(),
        arguments: [
          TypeOccurrence.YELLOW,
          clientModel.value,
        ],
      );
    } else {
      Get.to(
        () => DevolutionPage(),
        binding: DevolutionBiding(),
        arguments: [
          TypeOccurrence.RED,
          clientModel.value,
        ],
      );
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

    var someCod = clientModel.value.produtos.every((element) =>
        element.numTransVenda == clientModel.value.produtos.last.numTransVenda);

    if (someCod) {
      blockField.value = true;
      clientModel.refresh();
      filterComposer();
    } else {
      blockField.value = false;
      clientModel.value.copyWith(
        produtos: clientModel.value.produtos.map((e) {
          e.show = true;
          return e;
        }).toList(),
      );
      clientModel.refresh();
    }

    super.onInit();
  }
}
