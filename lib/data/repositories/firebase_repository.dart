import 'package:math_game/data/models/player.dart';

abstract class FirebaseRepository {
  Future<List<PlayerEntity>> getAllPlayers();
  Future<PlayerEntity?> getUserByEmail(String email);
  Future<void> createUser(PlayerEntity player);
}
