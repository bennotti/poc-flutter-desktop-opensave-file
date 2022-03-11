import '../../domain/contract/application/business_rules/IAplicacaoBusinessRules.dart';
import '../../domain/contract/infraestructure/localstorage/ILocalStorage.dart';
import '../../domain/dtos/credencial/credencial_check_request_dto.dart';
import '../../domain/dtos/credencial/credencial_check_response_dto.dart';

class AplicacaoBusinessRules implements IAplicacaoBusinessRules {
  final ILocalStorage storage;
  AplicacaoBusinessRules(this.storage) {}
  @override
  Future<CredencialCheckResponseDto?> handle(
      CredencialCheckRequestDto request) async {
    String? response = await storage.get("token");
    return await Future.delayed(Duration(milliseconds: 1000),
        () => response != null ? new CredencialCheckResponseDto() : null);
  }
}
