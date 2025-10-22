class WateringPlantEntity {
  final int humidityPlant;
  final bool statePump;
  final bool button;
  final int speedMotor;
  final int hourSetTime;
  final int minuteSetTime;
  final int timer;
  const WateringPlantEntity ({
    required this.humidityPlant,
    required this.statePump,
    required this.button,
    required this.speedMotor,
    required this.hourSetTime,
    required this.minuteSetTime,
    required this.timer
  });
}