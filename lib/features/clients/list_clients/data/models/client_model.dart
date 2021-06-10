import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

import '../../domain/entites/client_entity.dart';

class ClientModel extends ClientEntity {
  @override
  final String id;
  @override
  final int clientId;
  @override
  final String name;
  @override
  final int qtde;
  @override
  final bool show;
  @override
  final List<ProductModel> produtos;

  final int codCli;

  ClientModel({
    this.id = '',
    this.clientId = 0,
    this.name = '',
    this.qtde = 0,
    this.show = true,
    this.produtos = const [],
    this.codCli = 0,
  });

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      produtos: <ProductModel>[],
      codCli: map['CODCLI'],
      name: map['CLIENTE'],
      qtde: map['QTDE'],
    );
  }

  ClientModel copyWith({
    String? id,
    int? clientId,
    String? name,
    int? qtde,
    bool? show,
    List<ProductModel>? produtos,
    int? codCli,
  }) {
    return ClientModel(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      qtde: qtde ?? this.qtde,
      show: show ?? this.show,
      produtos: produtos ?? this.produtos,
      codCli: codCli ?? this.codCli,
    );
  }

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClientModel(id: $id, clientId: $clientId, name: $name, qtde: $qtde, show: $show, produtos: $produtos, codCli: $codCli)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClientModel &&
        other.id == id &&
        other.clientId == clientId &&
        other.name == name &&
        other.qtde == qtde &&
        other.show == show &&
        listEquals(other.produtos, produtos) &&
        other.codCli == codCli;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        clientId.hashCode ^
        name.hashCode ^
        qtde.hashCode ^
        show.hashCode ^
        produtos.hashCode ^
        codCli.hashCode;
  }
}
