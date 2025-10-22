import '../repositories/firestore_repository.dart';

class InitApp {
  final FirestoreRepository firestoreRepository;
  InitApp(this.firestoreRepository);

  Future<void> call(String uid, String email) async {
    await firestoreRepository.initData(uid, email);
  }
}
