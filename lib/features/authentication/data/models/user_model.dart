import 'package:projectiot/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel ({required super.uid, required super.email});

  factory UserModel.fromToJson (Map <String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email:  map ['Email'] ?? ''
    );
  }
  Map <String, dynamic> toMap () {
    return {
      'uid' : uid,
      'Email' : email
    };
  }

  factory UserModel.fromToJsonEntity (UserEntity user) {
    return UserModel(
        uid: user.uid,
        email: user.email
    );
  }

  UserEntity toEntity () {
    return UserEntity(uid: uid, email: email);
  }

  factory UserModel.fromToEntity (UserEntity doc) {
    return UserModel(uid: doc.uid, email: doc.email);
  }
}