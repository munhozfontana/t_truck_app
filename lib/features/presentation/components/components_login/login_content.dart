import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:t_truck_app/features/presentation/components/custom_checkbox.dart';
import 'package:t_truck_app/features/presentation/styles/style_app.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return alinhaFormParaBaixo(
            constraints: constraints,
            conteudoDorFormulario: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FORMULARIO DE LOGIN
                Spacer(flex: 78),
                labelMotorista(),
                Spacer(flex: 39),
                input(),
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
          );
        },
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
          style: StyleApp.h3,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Text labelMotorista() {
    return Text(
      'Entrar com código do motorista',
      style: StyleApp.h2,
      textAlign: TextAlign.left,
    );
  }

  TextFormField input() {
    return TextFormField(
      decoration: StyleApp.inputDecorationLogin,
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
                  style: const TextStyle(
                    letterSpacing: .7,
                    color: Color(0xff6c6c6c),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                  text: 'Precisa de ajuda? Entre em contato \ncom o telefone '),
              TextSpan(
                style: const TextStyle(
                  color: Color(0xff6c6c6c),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                ),
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
        onPressed: () {},
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
      child: Text('Esqueci meu código',
          style: const TextStyle(
              color: Color(0xff6c6c6c),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16.0),
          textAlign: TextAlign.center),
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
