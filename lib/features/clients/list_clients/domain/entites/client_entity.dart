import '../../../client_detail/domain/entites/invoice_entity.dart';

class ClientEntity {
  final String id;
  final String? clientId;
  final String? name;
  final List<InvoiceEntity>? invoices;
  final bool show;

  ClientEntity({
    this.id = '',
    this.clientId,
    this.name,
    this.invoices,
    this.show = true,
  });

  ClientEntity copyWith({
    String? id,
    String? clientId,
    String? name,
    List<InvoiceEntity>? invoices,
    bool? show,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      invoices: invoices ?? this.invoices,
      show: show ?? this.show,
    );
  }
}
