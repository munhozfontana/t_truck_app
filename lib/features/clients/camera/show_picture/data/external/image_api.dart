import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_image_external.dart';
import 'package:t_truck_app/features/data/models/image_model.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';

class ImageApi implements IImageExternal {
  IHttp iHttp;

  ImageApi({
    required this.iHttp,
  });

  @override
  Future<void> save(ImageEntity imageEntity) async {
    try {
      await iHttp.postHttp('${env['URL_BASE']}/image',
          body: ImageModel.toJson(imageEntity));
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
