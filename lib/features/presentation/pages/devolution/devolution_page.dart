import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';

class DevolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
        ],
      ),
    );
  }
}
