import 'package:flutter/material.dart';
import 'values/GameScreen/colorValues.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.title});
  final String title;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: GameScreenColors.backgroundColor,
        ),
      ),
    );
  }
}
