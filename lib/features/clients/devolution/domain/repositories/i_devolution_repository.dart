import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/devolution/data/models/devolution_model.dart';

import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/failures.dart';

mixin IDevolutionRepository {
  Future<Either<Failure, List<DropdownModel>>> list();
  Future<Either<Failure, void>> save(List<DevolutionModel> listDevolution);
}
