import '../../../dtos/credencial/credencial_check_request_dto.dart';
import '../../../dtos/credencial/credencial_check_response_dto.dart';

abstract class IAplicacaoBusinessRules {
  Future<CredencialCheckResponseDto?> handle(CredencialCheckRequestDto request);
}
