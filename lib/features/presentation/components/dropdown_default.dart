import 'package:flutter/material.dart';

class ClienteDropdownButton extends StatefulWidget {
  final Function(DropdownModel)? onChange;
  final List<DropdownModel> items;

  const ClienteDropdownButton({Key? key, this.onChange, required this.items})
      : super(key: key);

  @override
  _ClienteDropdownButtonState createState() => _ClienteDropdownButtonState();
}

class DropdownModel {
  num id;
  String label;

  DropdownModel({
    required this.id,
    required this.label,
  });
}

class _ClienteDropdownButtonState extends State<ClienteDropdownButton> {
  DropdownModel? clienteSelecionado;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<num>(
      value: (clienteSelecionado == null)
          ? widget.items[0].id
          : clienteSelecionado!.id,
      hint: Text(
        'Selecione',
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
      ),
      onChanged: (num? idSelecionado) {
        setState(() {
          clienteSelecionado =
              widget.items.firstWhere((cliente) => cliente.id == idSelecionado);
        });
        widget.onChange!(clienteSelecionado!);
      },
      items: widget.items.map<DropdownMenuItem<num>>((DropdownModel cliente) {
        return DropdownMenuItem<num>(
          value: cliente.id,
          child: Text(cliente.label),
        );
      }).toList(),
    );
  }
}
