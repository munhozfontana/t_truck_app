import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_image_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/image/image_save_use_case.dart';

import 'image_save_use_case_test.mocks.dart';

@GenerateMocks([IImageRepository])
void main() {
  late ImageSaveUseCase imageSaveUseCase;
  late IImageRepository mockIImageListRepository;
  late ImageEntity imageEntity;
  late OrderEntity orderEntity;

  setUp(() {
    imageEntity = ImageEntity(
        canhoto: 'imagemEmBase64',
        estabelecimento: 'estab',
        data: DateTime(2021, 4, 6),
        codCli: 1,
        numcanhoto: '');

    orderEntity = OrderEntity(
        cliente: '1',
        codCli: 5,
        identificacoes: [],
        numCar: 9,
        dtSaida: '2021-05-20T03:00:00.000Z');

    mockIImageListRepository = MockIImageRepository();
    imageSaveUseCase = ImageSaveUseCase(
      iImageListRepository: mockIImageListRepository,
    );
  });

  // test('Should return list images', () async {
  //   when(mockIImageListRepository.save(imageEntity)).thenAnswer(
  //     (_) async => Right(Future.value()),
  //   );
  //   var res = await imageSaveUseCase(Params(
  //     imageEntity: imageEntity,
  //     orderEntity: orderEntity,
  //   ));
  //   expect(res, isA<Right>());
  // });

  // test('Should concat id', () async {
  //   when(mockIImageListRepository.save(imageEntity)).thenAnswer(
  //     (_) async => Right(Future.value()),
  //   );

  //   var res = await imageSaveUseCase(Params(
  //     imageEntity: imageEntity,
  //     orderEntity: orderEntity,
  //   ));

  //   verify(
  //     mockIImageListRepository.save(imageEntity),
  //   ).called(1);
  // });

  test('Should return failure', () async {
    when(mockIImageListRepository.save(imageEntity)).thenAnswer(
      (_) async => Left(AppFailure()),
    );
    var res = await imageSaveUseCase(Params());
    expect(res, isA<Left>());
  });
}
