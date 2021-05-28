// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/services.dart';

class PayResponse {
  Map<Object?, Object?>? orders;
  String? error;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['orders'] = orders;
    pigeonMap['error'] = error;
    return pigeonMap;
  }

  static PayResponse decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return PayResponse()
      ..orders = pigeonMap['orders'] as Map<Object?, Object?>?
      ..error = pigeonMap['error'] as String?;
  }
}

class PayParam {
  CieloCredentials? cieloCredentials;
  String? reference;
  String? sku;
  String? description;
  String? unit_of_measure;
  int? unit_price;
  int? quantity;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['cieloCredentials'] = cieloCredentials == null ? null : cieloCredentials!.encode();
    pigeonMap['reference'] = reference;
    pigeonMap['sku'] = sku;
    pigeonMap['description'] = description;
    pigeonMap['unit_of_measure'] = unit_of_measure;
    pigeonMap['unit_price'] = unit_price;
    pigeonMap['quantity'] = quantity;
    return pigeonMap;
  }

  static PayParam decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return PayParam()
      ..cieloCredentials = pigeonMap['cieloCredentials'] != null
          ? CieloCredentials.decode(pigeonMap['cieloCredentials']!)
          : null
      ..reference = pigeonMap['reference'] as String?
      ..sku = pigeonMap['sku'] as String?
      ..description = pigeonMap['description'] as String?
      ..unit_of_measure = pigeonMap['unit_of_measure'] as String?
      ..unit_price = pigeonMap['unit_price'] as int?
      ..quantity = pigeonMap['quantity'] as int?;
  }
}

class CieloCredentials {
  String? clientID;
  String? accessToken;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['clientID'] = clientID;
    pigeonMap['accessToken'] = accessToken;
    return pigeonMap;
  }

  static CieloCredentials decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return CieloCredentials()
      ..clientID = pigeonMap['clientID'] as String?
      ..accessToken = pigeonMap['accessToken'] as String?;
  }
}

class CieloRun {
  /// Constructor for [CieloRun].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CieloRun({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  Future<PayResponse> pay(PayParam arg) async {
    final Object encoded = arg.encode();
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CieloRun.pay', const StandardMessageCodec(), binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(encoded) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return PayResponse.decode(replyMap['result']!);
    }
  }
}
