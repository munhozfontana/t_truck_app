import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/custom_checkbox.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';
import 'package:t_truck_app/features/presentation/styles/style_inputs.dart';
import 'package:t_truck_app/features/presentation/styles/style_typograph.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller =
      Get.put(LoginController(loginUseCase: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            AppBackground(),
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return alinhaFormParaBaixo(
                    constraints: constraints,
                    conteudoDorFormulario: Form(
                      key: controller.form.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FORMULARIO DE LOGIN
                          Spacer(flex: 78),
                          TextFormField(
                            controller: controller.loginField.value,
                            decoration: StyleInputs.inputDecorationLogin,
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
                            decoration: StyleInputs.inputDecorationLogin,
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
          style: StyleTypograph.h3,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Text labelMotorista() {
    return Text(
      'Entrar com código do motorista',
      style: StyleTypograph.h2,
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
                  style: StyleTypograph.h4,
                  text: 'Precisa de ajuda? Entre em contato \ncom o telefone '),
              TextSpan(
                style: StyleTypograph.h4_w500,
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
            const Color(0xff080e31),
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
        style: StyleTypograph.h4,
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
