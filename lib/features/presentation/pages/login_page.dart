import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            BackgroundLogin(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FormLogin(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            BackgroundLogin(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FormLogin(),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 250, 1),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: SvgPicture.asset(
                  'images/background_logo.svg',
                  semanticsLabel: 'Background Logo',
                ),
              ),
            ),
            Padding(
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
                        style: const TextStyle(
                          letterSpacing: 1.1,
                          color: Color(0xff4f5262),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontSize: 22.0,
                          height: 1.3,
                        ),
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
            )
          ],
        );
      },
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
            child: FormContent(),
          ),
        );
      },
    );
  }
}

class FormContent extends StatelessWidget {
  const FormContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 78),
            Text(
              'Entrar com código do motorista',
              style: TextStyle(
                color: Color(0xff6c6c6c),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            Spacer(flex: 39),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Opacity(
                  opacity: 0.4000000059604645,
                  child: Container(
                    child: Icon(
                      Icons.lock_outline,
                      color: Color.fromRGBO(8, 14, 49, 1),
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            Spacer(flex: 39),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomCheckbox(),
                ),
                Text(
                  'Lembrar acesso',
                  style: const TextStyle(
                    color: Color(0xff6c6c6c),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Spacer(flex: 78),
            ConstrainedBox(
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
            ),
            Spacer(flex: 39),
            Container(
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
            ),
            Spacer(flex: 69),
            Divider(
              height: 1,
              color: Color.fromRGBO(8, 14, 49, 1),
            ),
            Spacer(flex: 48),
            Center(
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
                          text:
                              'Precisa de ajuda? Entre em contato \ncom o telefone '),
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
            ),
            Spacer(flex: 66),
          ],
        );
      },
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final bool? isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;

  CustomCheckbox(
      {this.isChecked,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            )),
        width: widget.size ?? 24,
        height: widget.size ?? 24,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.grey,
                size: widget.iconSize ?? 20,
              )
            : null,
      ),
    );
  }
}
