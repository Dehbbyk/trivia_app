import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_page_provier.dart';

class GamePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  GamePageProvider? _pageProvider;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => GamePageProvider(context),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Builder(builder: (context) {
      _pageProvider = context.read<GamePageProvider>();
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth! * 0.05,
            ),
            child: _gameUI(),
          ),
        ),
      );
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _deviceHeight! * 0.01,
            ),
            _falseButton(),
          ],
        ),
      ],
    );
  }

  Widget _questionText() {
    return const Text(
      'Test Question 1, Nothing Interesting',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.10,
      child: const Text(
        'True',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.red,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.10,
      child: const Text(
        'False',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
