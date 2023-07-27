
import 'package:flutter/material.dart';
import 'package:math_game/services/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class MusicVolumeComponent extends StatefulWidget {
  const MusicVolumeComponent({super.key});

  @override
  State<StatefulWidget> createState() => MusicVolumeState();
}

class MusicVolumeState extends State<MusicVolumeComponent> {
  double _volumeValue = 20.0;



  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);

    audioProvider.changeVolumeMusic(_volumeValue.toInt());

    return SliderTheme(
        data: const SliderThemeData(
          thumbColor: Colors.blueGrey,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
          trackHeight: 26,
        ),
        child: Slider(
          min: 0.0,
          max: 100.0,
          value: _volumeValue,
          onChanged: (value) => {
            setState(() => _volumeValue = value)
          },
        ));
  }

}