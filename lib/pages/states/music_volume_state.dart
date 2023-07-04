import 'package:flutter/material.dart';

class MusicVolumeComponent extends StatefulWidget {
  const MusicVolumeComponent({super.key});

  @override
  State<StatefulWidget> createState() => MusicVolumeState();
}

class MusicVolumeState extends State<MusicVolumeComponent> {
  double _volumeValue = 50.0;

  @override
  Widget build(BuildContext context) {
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