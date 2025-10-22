class ControlMotor {
  final bool button;
  final int speed;
  final int hour;
  final int minute;
  final int timer;
  ControlMotor ({
    required this.button,
    required this.speed,
    required this.hour,
    required this.minute,
    required this.timer
  });

  factory ControlMotor.fromToMap (Map <String, dynamic> map) {
    return ControlMotor(
        button: map['Button'] ?? false,
        speed: map['Speed Motor'] ?? 0,
        hour: map['House Set Time'] ?? 0,
        minute: map['Minute Set Time'] ?? 0,
        timer: map['Time'] ?? 0
    );
  }

  Map <String, dynamic> toMap () {
    return {
      'Button' : button,
      'Speed Motor' : speed,
      'House Set Time' : hour,
      'Minute Set Time' : minute,
      'Time' : timer
    };
  }
}