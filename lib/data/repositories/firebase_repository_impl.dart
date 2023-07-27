import 'dart:convert';

import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference playersCollection = firestore.collection('players');

  @override
  Future<List<PlayerEntity>> getAllPlayers() async {
    final snapshot = await firestore.collection('players').get();

    final players = snapshot.docs.map((doc) => PlayerEntity.fromJson(doc.data())).toList();
    return players;
  }

  @override
  Future<String?> getUserIdByEmail(String email) async {
      try {
        final querySnapshot = await playersCollection.where('email', isEqualTo: email).limit(1).get();

        if(querySnapshot.size > 0) {
          return querySnapshot.docs.first.id;
        } else {
          return null;
        }
      }catch(err) {
        print('Erro ao obter o ID do usuário pelo email: $err');
        return null;
      }
  }

  @override
  Future<PlayerEntity?> getUserByEmail(String email) async {
    final querySnapshot =
        await playersCollection.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      final playerDoc = querySnapshot.docs.first;
      final playerEntity =
          PlayerEntity.fromJson(playerDoc.data() as Map<String, dynamic>);
      return playerEntity;
    }

    return null;
  }

  @override
  Future<void> unblockNextLevel(DocumentReference playerRef, PlayerEntity player) async {
      final unblockLevel = player.stars.length + 1;
      player.stars[unblockLevel.toString()] = 0;

      playerRef.update(player.toJson());
  }

  @override
  Future<void> updateStars(PlayerEntity player, int level, int stars) async {
    print('atualizando usuario ${player.email}\n level: $level == estrelas: $stars');
    try {
      String? playerId = await getUserIdByEmail(player.email);
      if(playerId != null) {
        final playerRef = playersCollection.doc(playerId);
        player.stars[(level).toString()] = stars;

        if(level == player.stars.length) {
          unblockNextLevel(playerRef, player);
        }else {
          await playerRef.update(player.toJson());
        }

      }

    }catch(err) {
      print('Erro ao atualizar Estrelas do usuário: $err');
    }
    return null;
  }

  @override
  Future<void> createUser(PlayerEntity player) async{
    try {
      final userAlreadyExists = await getUserByEmail(player.email);

      if(userAlreadyExists != null) {
        print('Usuário já existe');
        return;
      }

      String playerData = json.encode(player.toJson());
      await playersCollection.add(jsonDecode(playerData));
      print('Novo usuário criado com sucesso!');
    } catch (e) {
      print('Erro ao criar o novo usuário: $e');
    }
  }
}
