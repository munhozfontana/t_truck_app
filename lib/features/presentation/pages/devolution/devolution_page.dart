import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/custom_checkbox.dart';
import 'package:t_truck_app/features/presentation/components/layout_form.dart';

class DevolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      ProductEntity(codProd: 1, descricao: 'teste1'),
      ProductEntity(codProd: 2, descricao: 'teste2'),
      ProductEntity(codProd: 3, descricao: 'teste3'),
      ProductEntity(codProd: 4, descricao: 'teste4'),
      ProductEntity(codProd: 5, descricao: 'teste5'),
      ProductEntity(codProd: 5, descricao: 'teste5'),
      ProductEntity(codProd: 5, descricao: 'teste5'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          LayoutForm(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 041,
                    ),
                    TextFormField(
                      onChanged: print,
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        '${list.length} clientes encontrados',
                        style: Get.textTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    Flexible(
                        flex: 751,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(height: 16),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  CustomCheckbox(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(list[index].descricao),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
