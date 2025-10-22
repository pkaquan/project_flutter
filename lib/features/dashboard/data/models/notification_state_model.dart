import 'package:projectiot/features/dashboard/domain/entities/notification_state_entity.dart';

class NotificationStateModel {
  final String body;
  final String title;
  NotificationStateModel({required this.body, required this.title});

  factory NotificationStateModel.fromMap(Map<String, dynamic> map) {
    return NotificationStateModel(
      body: map['Body'] ?? '',
      title: map['Title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'Body': body, 'Title': title};
  }

  factory NotificationStateModel.fromMapEntity(NotificationStateEntity doc) {
    return NotificationStateModel(body: doc.body, title: doc.title);
  }

  NotificationStateEntity toMapEntity() {
    return NotificationStateEntity(body: body, title: title);
  }
}
