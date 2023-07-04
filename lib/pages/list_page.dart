

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.BackColor,
      body: Column(
        children: [
          Center(
            child: FutureBuilder<List<PlayerEntity>>(
              future: FirebaseRepositoryImpl().getAllPlayers(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (c, index) => (
                          Column(
                            children: [
                              ListTile(
                                iconColor: Colors.white,
                                tileColor: Colors.white,
                                leading: const Icon(FontAwesomeIcons.user),
                                title: Text('email: ${snapshot.data![index].email}'),
                                subtitle: Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data![index].stars.length,
                                        itemBuilder: (c, starsIndex) => (
                                            ListTile(
                                              title: Text('lvl: $starsIndex, stars:  ${snapshot.data![index].stars[(starsIndex + 1).toString()]}'),
                                            )
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    );
                  } else if(snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}', style: const TextStyle(color: Colors.white, fontSize: 16),),
                    );
                  } else {
                    return const Center(
                      child: Text('Algo deu errado', style: TextStyle(color: Colors.white, fontSize: 32),),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },

            ),
          ),
          CustomButton(
            color: CustomTheme.RED,
            label: 'voltar',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),

    );
  }

}