import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/entites/image_entity.dart';

mixin IImageExternal {
  Future<void> save(ImageEntity imageEntity);
}

class ImageExternal implements IImageExternal {
  IHttp iHttp;

  ImageExternal({
    required this.iHttp,
  });

  @override
  Future<void> save(ImageEntity imageEntity) async {
    try {
      await iHttp.postHttp('${env['URL_BASE']}/image',
          body: imageEntity.toJson());
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
