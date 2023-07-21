import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository.dart';

class GetPlayerSessionUseCase {
  final FirebaseRepository firebaseRepo;
  GetPlayerSessionUseCase({required this.firebaseRepo});

  call(String email) async {
    try {
      PlayerEntity? player = await firebaseRepo.getUserByEmail(email);

      return player;
    } catch (err) {
      return null;
    }
  }
}
