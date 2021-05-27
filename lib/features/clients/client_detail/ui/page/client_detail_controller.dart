import 'dart:async';

import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/injection_container.dart';

class ClientDetailController extends GetxController with BaseController {
  final ClientDetailListUseCase clientdetailListUseCase;
  final TipoTransacaoUseCase tipoTransacaoUseCase;

  ClientDetailController({
    required this.clientdetailListUseCase,
    required this.tipoTransacaoUseCase,
  });

  Rx<OrderEntity?> orderEntity =
  RxList<ClientDetailEntity?> clientdetailEntityList = <ClientDetailEntity>[].obs;

  RxList<TipoTransacaoEntity?> tipoTransacaoEntity =
      <TipoTransacaoEntity>[].obs;

  RxString qtdProdutos = ''.obs;
  RxString qtdNotas = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    changeLoading(Loading.START);

    (await tipoTransacaoUseCase(Params(
      orderEntity: orderEntity.value,
    )))
        .fold(
      (l) => null,
      (r) => tipoTransacaoEntity.value = r,
    );

    orderEntity.value!.copyWith(
        identificacoes: tipoTransacaoEntity
            .map((element) => TransacaoVendaEntity(
                  numTransVenda: element!.transacaoVendaEntity.numTransVenda,
                  numNota: 0,
                  prest: '',
                ))
            .toList());

    var params = Params(
      listIdentificacao: orderEntity.value!
          .copyWith(
              identificacoes: tipoTransacaoEntity
                  .map((element) => TransacaoVendaEntity(
                        numTransVenda:
                            element!.transacaoVendaEntity.numTransVenda,
                        numNota: 0,
                        prest: '',
                      ))
                  .toList())
          .identificacoes,
    );
    (await clientdetailListUseCase(params)).fold(
      (l) => AppDialog.error(
        menssagem: l.props.first.toString(),
      ),
      (r) => {
        clientdetailEntityList.value = r,
        qtdProdutos.value = clientdetailEntityList.length.toString(),
        qtdNotas.value = orderEntity.value!.qtde.toString(),
        qtdProdutos.refresh(),
        qtdNotas.refresh(),
        Timer(Duration(seconds: 1), () {
          changeLoading(Loading.STOP);
        })
      },
    );
  }

  void toDevolution(TypeOccurrence typeDevolution) {
    if (typeDevolution == TypeOccurrence.YELLOW) {
      clientdetailEntityList.value = clientdetailEntityList
          .map((e) => ClientDetailEntity(
                codProd: e!.codProd,
                descricao: e.descricao,
                qt: e.qt,
                qtToSend: 0,
                transacaoVendaEntity: e.transacaoVendaEntity,
              ))
          .toList();
    }
    if (typeDevolution == TypeOccurrence.RED) {
      clientdetailEntityList.value = clientdetailEntityList
          .map((e) => ClientDetailEntity(
                codProd: e!.codProd,
                descricao: e.descricao,
                qt: e.qt,
                qtToSend: e.qt,
                transacaoVendaEntity: e.transacaoVendaEntity,
              ))
          .toList();
    }
    Get.to(
      () => DevolutionPage(),
      binding: DevolutionBiding(),
      arguments: [clientdetailEntityList, typeDevolution],
    );
  }
}
