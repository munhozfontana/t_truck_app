import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';

class JwtDecoderDriver implements IJwt {
  @override
  Map jwtDecode(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      throw DriverException(error: 'Error ao decodificar o jwt');
    }
  }

  @override
  bool isExpired(String token) {
    try {
      var decodeToken = JwtDecoder.decode(token);
      if (DateTime.now().millisecondsSinceEpoch >= decodeToken['exp'] * 1000) {
        return true;
      }
      return false;
    } catch (e) {
      throw DriverException(error: 'Error ao recuperar expriração do jwt');
    }
  }
}
