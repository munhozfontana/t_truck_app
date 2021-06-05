import '../../../client_detail/domain/entites/invoice_entity.dart';

class ClientEntity {
  final String id;
  final String? clientId;
  final String? name;
  final List<InvoiceEntity>? invoices;

  ClientEntity({
    this.id = '',
    this.clientId,
    this.name,
    this.invoices,
  });
}
