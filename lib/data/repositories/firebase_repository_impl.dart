import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final CollectionReference playersCollection =
      FirebaseFirestore.instance.collection('players');

  @override
  Future<List<PlayerEntity>> getAllPlayers() async {
    final snapshot = await FirebaseFirestore.instance.collection('players').get();

    final players = snapshot.docs.map((doc) => PlayerEntity.fromJson(doc.data())).toList();
    return players;
  }

  @override
  Future<PlayerEntity> getUserByEmail(String email) async {
    final querySnapshot =
        await playersCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      final playerDoc = querySnapshot.docs.first;
      final playerEntity =
          PlayerEntity.fromJson(playerDoc.data() as Map<String, dynamic>);
      return playerEntity;
    }

    throw Exception('Player with email $email not found.');
  }
}
