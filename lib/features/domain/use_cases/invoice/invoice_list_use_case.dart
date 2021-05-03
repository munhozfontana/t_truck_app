import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/entites/invoice.dart';
import 'package:t_truck_app/features/domain/repositories/i_invoice_repository.dart';

class InvoiceListUseCase implements UseCase<Type, Params> {
  IInvoiceRepository iInvoiceListRepository;

  InvoiceListUseCase({
    required this.iInvoiceListRepository,
  });

  @override
  Future<Either<Failure, List<Invoice>>> call(Params params) async {
    return iInvoiceListRepository.list();
  }
}
