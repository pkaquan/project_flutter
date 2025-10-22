import 'package:projectiot/features/dashboard/domain/entities/profile_entity.dart';

class ProfileModel  {
  final String name;
  final String phone;
  ProfileModel ({required this.name, required this.phone});

  factory ProfileModel.fromJson (Map <String, dynamic> map) {
    return ProfileModel(
        name: map['Name'] ?? '',
        phone: map['Phone'] ?? ''
    );
  }

  Map <String, dynamic> toMap () {
    return {
      'Name' : name,
      'Phone' : phone
    };
  }

  ProfileEntity toEntity () {
    return ProfileEntity(name: name, phone: phone);
  }

  factory ProfileModel.fromJsonEntity (ProfileEntity profile) {
    return ProfileModel(name: profile.name, phone: profile.phone);
  }
}
