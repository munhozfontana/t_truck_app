import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/custom_checkbox.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_controller.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            AppBackground(
              initialScreen: true,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return alinhaFormParaBaixo(
                    constraints: constraints,
                    conteudoDorFormulario: Form(
                      key: form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 78),
                          TextFormField(
                            controller: controller.loginField.value,
                            decoration: InputDecoration(
                              prefixIcon: Opacity(
                                opacity: 0.4000000059604645,
                                child: Icon(Icons.person_outline_outlined),
                              ),
                            ),
                            validator: (value) {
                              if (GetUtils.isNull(value) || value!.isEmpty) {
                                return 'Obrigatório';
                              }
                              return null;
                            },
                          ),
                          Spacer(flex: 39),
                          TextFormField(
                            controller: controller.passwordField.value,
                            decoration: InputDecoration(
                              prefixIcon: Opacity(
                                opacity: 0.4000000059604645,
                                child: Icon(Icons.lock_outline),
                              ),
                            ),
                            validator: (value) {
                              if (GetUtils.isNull(value) || value!.isEmpty) {
                                return 'Obrigatório';
                              }
                              return null;
                            },
                          ),
                          Spacer(flex: 39),
                          lenbrarAcesso(),
                          Spacer(flex: 78),
                          btnEntrar(constraints),
                          Spacer(flex: 39),
                          esqueciMeuCodigo(constraints),
                          Spacer(flex: 69),
                          Divider(
                            height: 1,
                            color: Color.fromRGBO(8, 14, 49, 1),
                          ),
                          Spacer(flex: 48),
                          ajuda(constraints),
                          Spacer(flex: 66),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.loadingState.value == Loading.START,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row lenbrarAcesso() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomCheckbox(),
        ),
        Text(
          'Lembrar acesso',
          style: Get.textTheme.headline3,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Text labelMotorista() {
    return Text(
      'Entrar com código do motorista',
      style: Get.textTheme.headline2,
      textAlign: TextAlign.left,
    );
  }

  Center ajuda(BoxConstraints constraints) {
    return Center(
      child: Container(
        width: constraints.maxWidth,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  style: Get.textTheme.headline4,
                  text: 'Precisa de ajuda? Entre em contato \ncom o telefone '),
              TextSpan(
                style: Get.textTheme.headline5,
                text: ' (00) 0 0000-0000',
              )
            ],
          ),
        ),
      ),
    );
  }

  ConstrainedBox btnEntrar(BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: constraints.maxWidth,
        height: 56,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Get.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        onPressed: controller.auth,
        child: Text(
          'Entrar',
          style: const TextStyle(
            letterSpacing: 1,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontSize: 23.0,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Container esqueciMeuCodigo(BoxConstraints constraints) {
    return Container(
      height: 21,
      width: constraints.maxWidth,
      child: Text(
        'Esqueci meu código',
        style: Get.textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget alinhaFormParaBaixo(
      {required Widget? conteudoDorFormulario, required constraints}) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .66,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(8, 14, 49, 0.12),
            spreadRadius: 5,
            blurRadius: 32,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * .064,
        ),
        child: conteudoDorFormulario,
      ),
    );
  }
}
