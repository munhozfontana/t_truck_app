import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/image/image_save_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_controller.dart';

class CameraImageController extends GetxController {
  final ImageSaveUseCase imageSaveUseCase;

  CameraImageController({
    required this.imageSaveUseCase,
  });

  void saveImage(String image) {
    var orderEntity = Get.find<PaymentController>().orderEntity.value;

    orderEntity.identificacoes;

    var dataSaida = DateFormat('yy/MM/d')
        .format(DateTime.parse(orderEntity.dtSaida))
        .toString()
        .replaceAll('/', '');

    var numcanhotoConcatenado = dataSaida +
        orderEntity.codCli.toString() +
        orderEntity.numCar.toString();

    imageSaveUseCase(Params(
      imageEntity: ImageEntity(
          canhoto: image,
          codCli: orderEntity.codCli,
          data: DateTime.now(),
          estabelecimento: '',
          numcanhoto: numcanhotoConcatenado),
    ));
  }
}
// ${orderEntity.dtSaida}${orderEntity.codCli.toString()}${orderEntity.numCar.toString()}'
//  DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(orderEntity.dtSaida)).toString()