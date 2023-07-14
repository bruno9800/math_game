import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_state.dart';

// Criar evento de pausar o timer;
Widget buildTitle({required String title, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomIconButton(
        icon: FontAwesomeIcons.pause,
        onPressed: () {
          print('click');
        },
      ),
      SizedBox(width: 48,),
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 22, right: 22, top: 4, bottom: 4),
            decoration: BoxDecoration(
                color: CustomTheme.ForeColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Text('$title', style: TextStyle(color: CustomTheme.Black),),
          ),
          const SizedBox(height: 12,),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1'),
              Text('2'),
              Text('3')
            ],
          )
        ],
      ),
      const SizedBox(width: 48,),
      CustomIconButton(
        icon: FontAwesomeIcons.house,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

}


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomTheme.BackColor,
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: buildTitle(title: 'Level 5', context: context),
        ),
      body: GameComponent(),
    );
  }

}
