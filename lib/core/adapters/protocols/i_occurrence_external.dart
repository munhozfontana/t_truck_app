import 'package:t_truck_app/features/domain/entites/occurrence_entity.dart';

mixin IOccurrenceExternal {
  Future<List<OccurrenceEntity>> list();
}
