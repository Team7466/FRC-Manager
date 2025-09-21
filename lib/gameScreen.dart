import 'package:flutter/material.dart';
import 'values/GameScreen/colorValues.dart';
import 'values/GameScreen/sizeValues.dart';

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
        child: Center(
          child: SizedBox(
            width: GameScreenSize.textBGWidth,
            height: GameScreenSize.textBGHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  GameScreenSize.borderSmooth,
                ),
                color: GameScreenColors.orangeColor,
              ),
              child: Center(
                child: Text(
                  "Soru",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GameScreenColors.whiteColor,
                    fontSize: GameScreenSize.questionFontSize,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Kdam Thmor Pro",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
