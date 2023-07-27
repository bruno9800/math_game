import 'package:math_game/data/models/player.dart';

abstract class FirebaseRepository {
  Future<List<PlayerEntity>> getAllPlayers();
  Future<PlayerEntity?> getUserByEmail(String email);
  Future<void> createUser(PlayerEntity player);
  Future<String?> getUserIdByEmail(String email);
  Future<void> updateStars(PlayerEntity player, int level, int stars);
}
