import 'package:intl/intl.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    required String numcanhoto,
    required String canhoto,
    required String estabelecimento,
    required DateTime data,
    required int codCli,
  }) : super(
          numcanhoto: numcanhoto,
          canhoto: canhoto,
          estabelecimento: estabelecimento,
          data: data,
          codCli: codCli,
        );

  static Map toJson(ImageEntity imageEntity) {
    return {
      'codcli': imageEntity.codCli.toString(),
      'canhoto': imageEntity.canhoto,
      'estabelecimento': imageEntity.estabelecimento,
      'data':
          DateFormat('dd/MM/yyyy HH:mm:ss').format(imageEntity.data).toString(),
      'numcanhoto': imageEntity.numcanhoto,
    };
  }
}
