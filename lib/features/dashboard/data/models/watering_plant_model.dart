import 'package:projectiot/features/dashboard/domain/entities/watering_plant_entity.dart';

class WateringPlantModel {
  final int humidityPlant;
  final bool statePump;
  final bool button;
  final int speedMotor;
  final int hourSetTime;
  final int minuteSetTime;
  final int timer;
  WateringPlantModel ({
    required this.humidityPlant,
    required this.statePump,
    required this.button,
    required this.speedMotor,
    required this.hourSetTime,
    required this.minuteSetTime,
    required this.timer
  });

  factory WateringPlantModel.fromToJson (Map <String, dynamic> map) {
    return WateringPlantModel(
        humidityPlant: map['Humidity Plant'] ?? 0,
        statePump: map['State Pump'] ?? false,
        button: map['Button'] ?? false,
        speedMotor: map['Speed Motor'] ?? 0,
        hourSetTime: map['House Set Time'] ?? 0,
        minuteSetTime: map['Minute Set Time'] ?? 0,
        timer: map['Time'] ?? 0
    );
  }

  Map <String, dynamic> toMap () {
    return {
      'Humidity Plant' : humidityPlant,
      'State Pump' : statePump,
      'Button' : button,
      'Speed Motor' : speedMotor,
      'House Set Time' : hourSetTime,
      'Minute Set Time' : minuteSetTime,
      'Time' : timer
    };
  }

  WateringPlantEntity toEntity () {
    return WateringPlantEntity(
        humidityPlant: humidityPlant,
        statePump: statePump,
        button: button,
        speedMotor: speedMotor,
        hourSetTime: hourSetTime,
        minuteSetTime: minuteSetTime,
        timer: timer
    );
  }

  factory WateringPlantModel.fromToEntity (WateringPlantEntity doc) {
    return WateringPlantModel(
        humidityPlant: doc.humidityPlant,
        statePump: doc.statePump,
        button: doc.button,
        speedMotor: doc.speedMotor,
        hourSetTime: doc.hourSetTime,
        minuteSetTime: doc.minuteSetTime,
        timer: doc.timer
    );
  }
}