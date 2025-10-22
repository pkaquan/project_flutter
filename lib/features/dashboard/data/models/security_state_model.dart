import 'package:projectiot/features/dashboard/domain/entities/security_state_entity.dart';

class SecurityStateModel {
  final bool state;
  SecurityStateModel({required this.state});

  factory SecurityStateModel.fromeMap(Map<String, dynamic> map) {
    return SecurityStateModel(state: map['alert']);
  }

  SecurityStateEntity toEntity() {
    return SecurityStateEntity(state);
  }
}
