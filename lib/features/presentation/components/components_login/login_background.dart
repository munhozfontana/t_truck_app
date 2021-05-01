import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_truck_app/features/presentation/styles/style_typograph.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            /// PILHA DE CONTEUDOS
            /// background [backgroundGray()] -> desenho[backgroundDraw()] -> detalhes[details(constraints)]

            /// COR DE FUNDO
            backgroundGray(),

            /// LOGO COM OS QUADRADOS
            backgroundDraw(),

            /// DETALHAMENTO DA DELA, LOGOMARCA, ICONE E DESCRIÇÃO DO APP
            details(constraints)
          ],
        );
      },
    );
  }

  Padding details(BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: constraints.maxHeight * .038,
        horizontal: constraints.maxHeight * .044,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SvgPicture.asset(
              'images/logo.svg',
              semanticsLabel: 'Background Logo',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 24,
            ),
            child: Container(
              width: 250,
              height: 90,
              child: Text(
                'Bem vindo ao GSA Acompanhamento Logístico',
                style: StyleTypograph.h1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Opacity(
            opacity: .5,
            child: SvgPicture.asset(
              'images/icons/arrows_down.svg',
              semanticsLabel: 'Background Logo',
              color: Color(0xff080e31),
            ),
          )
        ],
      ),
    );
  }

  Align backgroundDraw() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        child: SvgPicture.asset(
          'images/background_logo.svg',
          semanticsLabel: 'Background Logo',
        ),
      ),
    );
  }

  Container backgroundGray() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 249, 250, 1),
      ),
    );
  }
}
