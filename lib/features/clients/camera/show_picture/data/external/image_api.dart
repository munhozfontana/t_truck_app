import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/models/image_model.dart';

mixin IImageExternal {
  Future<void> save(ImageModel imageModel);
}

class ImageExternal implements IImageExternal {
  IHttp iHttp;

  ImageExternal({
    required this.iHttp,
  });

  @override
  Future<void> save(ImageModel imageModel) async {
    try {
      // await iHttp.postHttp('${env['URL_BASE']}/image',
      //     body: imageModel.toJson());
      return Future.delayed(Duration(seconds: 2));
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
