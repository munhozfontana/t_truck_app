import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/chat/ui/chat_component.dart';
import 'package:t_truck_app/features/chat/ui/chat_controller.dart';

import '../../features/clients/list_clients/list_clients_biding.dart';
import '../../features/clients/list_clients/ui/page/list_client_page.dart';
import '../../features/login/login_biding.dart';
import '../../features/login/ui/page/login_page.dart';
import '../adapters/protocols/i_logged_user.dart';

class AppBackground extends StatelessWidget {
  final bool initialScreen;

  const AppBackground({
    Key? key,
    this.initialScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(initialScreen);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            backgroundGray(),
            backgroundDraw(),
            details(constraints),
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
      child: Visibility(
        visible: initialScreen,
        replacement: isNotInitial(),
        child: isInitial(),
      ),
    );
  }

  void logout() async {
    if (Get.currentRoute.contains('ClientPage')) {
      Get.find<ILoggedUser>().logout();
      await Get.offAll(() => LoginPage(), binding: LoginBiding());
    } else {
      await Get.off(() => ListClientPage(), binding: ListClientBiding());
    }
  }

  Widget isNotInitial() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
            height: 50,
            child: GestureDetector(
              onTap: () => logout(),
              child: Container(
                child: SvgPicture.asset(
                  'images/logo.svg',
                  semanticsLabel: 'Background Logo',
                ),
              ),
            ),
          ),
        ),
        // Rectangle 15
        GestureDetector(
          onTap: () => Get.to(ChatComponent()),
          child: Obx(() => Container(
                width: 107.27838134765625,
                height: 34.2634391784668,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: const Color(0xff080e31), width: 1),
                  color: Get.find<ChatController>().anyNotification.isTrue
                      ? Colors.red
                      : Colors.transparent,
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      children: [
                        Container(
                          width: constraints.maxWidth * .5,
                          child: // Ajuda
                              Text(
                            'Chat',
                            style: const TextStyle(
                                color: Color(0xff090f31),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth * .5,
                          child: Icon(Icons.chat_outlined),
                        )
                      ],
                    );
                  },
                ),
              )),
        ),
      ],
    );
  }

  Column isInitial() {
    return Column(
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
              style: Get.textTheme.headline1,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Column(
          children: [
            Opacity(
              opacity: .5,
              child: SvgPicture.asset(
                'images/icons/arrows_down.svg',
                semanticsLabel: 'Background Logo',
                color: Color(0xff080e31),
              ),
            ),
          ],
        )
      ],
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
