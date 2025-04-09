import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  double _currentDifficultyLevel = 0; // Default difficulty level

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.10,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _appTitle(),
                _difficultySlider(),
              ],
            ),
          ),
          //   ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return const Column(
      children: [
        Text(
          'Trivia Game',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _difficultySlider() {
    return Slider(
      value: _currentDifficultyLevel,
      onChanged: (value) {
        setState(() {
          _currentDifficultyLevel = value;
        });
      },
    );
  }
}
