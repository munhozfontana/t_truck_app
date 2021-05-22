import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';

class DevolutionEntity {
  ProductEntity productEntity;
  OrderEntity orderEntity;
  String situacao;
  DateTime date;
  String codmot;

  DevolutionEntity({
    required this.productEntity,
    required this.orderEntity,
    required this.situacao,
    required this.date,
    required this.codmot,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DevolutionEntity &&
        other.productEntity == productEntity &&
        other.orderEntity == orderEntity &&
        other.situacao == situacao &&
        other.date == date &&
        other.codmot == codmot;
  }

  @override
  int get hashCode {
    return productEntity.hashCode ^
        orderEntity.hashCode ^
        situacao.hashCode ^
        date.hashCode ^
        codmot.hashCode;
  }
}
