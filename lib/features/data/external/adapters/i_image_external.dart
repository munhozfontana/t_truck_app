import 'package:t_truck_app/features/domain/entites/image_entity.dart';

mixin IImageExternal {
  Future<void> save(ImageEntity imageEntity);
}
