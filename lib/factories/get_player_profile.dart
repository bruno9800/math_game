import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';
import 'package:math_game/services/use-cases/get_player_profile_use_case.dart';

class GetPlayerProfile {
  final FirebaseRepository firebaseRepo = FirebaseRepositoryImpl();
  String email;
  GetPlayerProfile({required this.email}) {
    final PlayerEntity playerDetails =
        GetPlayerProfileUseCase(firebaseRepo: firebaseRepo).call(email);
  }
}
