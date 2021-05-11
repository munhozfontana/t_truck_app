import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/components/custom_checkbox.dart';
import 'package:t_truck_app/features/presentation/components/layout/layout_form.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_controller.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_page.dart';
import 'package:t_truck_app/features/presentation/pages/devolution_reason/devolution_reason_page.dart';

class DevolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xff090e32).withOpacity(0.4),
                        ),
                        suffixIcon: Icon(
                          Icons.photo_camera_outlined,
                          color: Color(0xff090e32).withOpacity(0.4),
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xff000000).withOpacity(0.4),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            fontSize: 16.0),
                        hintText: 'Pesquisar produto...',
                      ),
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    GetX<DeliveryController>(
                      initState: (_) {},
                      builder: (_) {
                        return Opacity(
                          opacity: 0.5,
                          child: Text(
                            '${_.productEntityList.length} clientes encontrados',
                            style: Get.textTheme.headline6,
                            textAlign: TextAlign.left,
                          ),
                        );
                      },
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    GetX<DeliveryController>(
                      builder: (_) {
                        return Flexible(
                          flex: 450,
                          child: ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 14),
                            itemCount: _.productEntityList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Row(
                                  children: [
                                    CustomCheckbox(
                                      isSelected:
                                          _.productEntityList[index]!.isCheck!,
                                      onTap: () {
                                        _.changeStatus(
                                            _.productEntityList[index], index);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(_
                                          .productEntityList[index]!.descricao),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Spacer(
                      flex: 035,
                    ),
                    GetX<DeliveryController>(
                      builder: (_) {
                        if (_.productEntityList
                            .where((e) => e!.isCheck == false)
                            .isNotEmpty) {
                          return BtnDevolution(
                            onTap: () {
                              Get.to(() => DevolutionReasonPage());
                            },
                            label: 'Devolução parcial',
                            typeDevolution: TypeDevolution.YELLOW,
                          );
                        } else {
                          return BtnDevolution(
                            onTap: () {
                              Get.to(() => DevolutionReasonPage());
                            },
                            label: 'Devolução total',
                            typeDevolution: TypeDevolution.RED,
                          );
                        }
                      },
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    GestureDetector(
                      onTap: () => Get.off(() => DeliveryPage()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_left_rounded),
                          Text('Voltar',
                              style: const TextStyle(
                                  color: Color(0xff6c6c6c),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 035,
                    ),
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
