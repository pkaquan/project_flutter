import 'package:projectiot/features/dashboard/domain/entities/control_device_entity.dart';

class ControlDeviceModel {
  String name;
  bool state;
  ControlDeviceModel({required this.name, required this.state});

  factory ControlDeviceModel.fromMap(Map<String, dynamic> map) {
    return ControlDeviceModel(
      name: map['Name Device']  ,
      state: map['State'] ,
    );
  }

  Map<String, dynamic> toMap() {
    return {'Name Device': name, 'State': state};
  }

  factory ControlDeviceModel.fromMapEntity(ControlDeviceEntity doc) {
    return ControlDeviceModel(name: doc.name, state: doc.state);
  }

  ControlDeviceEntity toEntity() {
    return ControlDeviceEntity(name: name, state: state);
  }
}
