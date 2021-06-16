import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownModel {
  num? id;
  String? label;

  DropdownModel({
    this.id,
    this.label,
  });
}

class ClienteDropdownButton extends StatelessWidget {
  final bool isLoading;
  final Function(DropdownModel)? onChange;
  final RxList<DropdownModel> items;

  const ClienteDropdownButton({
    Key? key,
    required this.onChange,
    required this.items,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return DropdownButtonFormField<num>(
      hint: Text(
        'Selecione',
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
      ),
      onChanged: (num? idSelecionado) {
        onChange!(items.firstWhere((cliente) => cliente.id == idSelecionado));
      },
      items: items.map<DropdownMenuItem<num>>((DropdownModel cliente) {
        return DropdownMenuItem<num>(
          value: cliente.id,
          child: Text(cliente.label ?? ''),
        );
      }).toList(),
    );
  }
}
