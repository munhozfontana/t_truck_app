import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/models/image_model.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';
import 'package:t_truck_app/features/payment/ui/page/payment_controller.dart';

import '../../features/clients/list_clients/data/models/client_model.dart';
import '../../features/login/domain/entites/credential_entity.dart';
import '../components/btn_occurrence.dart';
import '../components/dropdown_default.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final String? codmot;
  final String? codusur;
  final String? motivoDevolucao;
  final int? codCli;
  final ClientModel? clientModel;
  final TypeOccurrence? typeOccurrence;
  final DropdownModel? selected;
  final ImageModel? imageModel;
  final FromPayment? fromPayment;
  final ChatMessage? chatMessageEntity;
  final String? idUser;
  final ImageReportModel? imageReportModel;

  Params({
    this.credential,
    this.token,
    this.codmot,
    this.codusur,
    this.motivoDevolucao,
    this.codCli,
    this.clientModel,
    this.typeOccurrence,
    this.selected,
    this.imageModel,
    this.fromPayment,
    this.idUser,
    this.chatMessageEntity,
    this.imageReportModel,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        codmot!,
        codusur!,
        motivoDevolucao!,
        codCli!,
        clientModel!,
        typeOccurrence!,
        selected!,
        imageModel!,
        fromPayment!,
        idUser!,
        chatMessageEntity!,
        imageReportModel!,
      ];
}
