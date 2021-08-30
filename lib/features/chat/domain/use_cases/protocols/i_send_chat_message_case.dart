import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';

abstract class ISendChatMessageCase {
  Either<Failure, void> call(Params params);
}
