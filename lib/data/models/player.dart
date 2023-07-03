import 'dart:convert';

PlayerEntity playerEntityFromJson(String str) =>
    PlayerEntity.fromJson(json.decode(str));

String playerEntityToJson(PlayerEntity data) => json.encode(data.toJson());

class PlayerEntity {
  String email;
  Map<String, int> stars;

  PlayerEntity({
    required this.email,
    required this.stars,
  });

  factory PlayerEntity.fromJson(Map<String, dynamic> json) => PlayerEntity(
        email: json["email"],
        stars:
            Map.from(json["stars"]).map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "stars": Map.from(stars).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
