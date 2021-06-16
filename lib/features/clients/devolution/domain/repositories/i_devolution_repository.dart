import 'package:dartz/dartz.dart';

import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/failures.dart';
import '../../data/models/devolution_model.dart';

mixin IDevolutionRepository {
  Future<Either<Failure, List<DropdownModel>>> list();
  Future<Either<Failure, void>> save(List<DevolutionModel> listDevolution);
}
