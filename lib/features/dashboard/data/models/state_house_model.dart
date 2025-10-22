import 'package:projectiot/features/dashboard/domain/entities/state_house_entity.dart';

class StateHouseModel {
  final int humidity;
  final int temperature;
  final int alertFire;
  StateHouseModel({
    required this.humidity,
    required this.temperature,
    required this.alertFire,
  });
  factory StateHouseModel.fromToMap(Map<String, dynamic> map) {
    return StateHouseModel(
      humidity: map['Humidity House'] ?? 0,
      temperature: map['Temperature House'] ?? 0,
      alertFire: map['Alert'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Temperature House': temperature,
      'Alert': alertFire,
      'Humidity House': humidity,
    };
  }

  StateHouseEntity toEntity() {
    return StateHouseEntity(
      temperature: temperature,
      humidity: humidity,
      alert: alertFire,
    );
  }

  factory StateHouseModel.fromToEntity(StateHouseEntity doc) {
    return StateHouseModel(
      humidity: doc.humidity,
      temperature: doc.temperature,
      alertFire: doc.alert,
    );
  }
}
