import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';

mixin IDevolutionExternal {
  Future<void> save(List<DevolutionEntity> devolutionEntity);
}
