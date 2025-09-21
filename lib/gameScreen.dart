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
        color: GameScreenColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ÜSTTE SORU KUTUSU
            SizedBox(
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
                    "SORU",
                    style: TextStyle(
                      color: GameScreenColors.whiteColor,
                      fontSize: GameScreenSize.questionFontSize,
                      fontFamily: "Kdam Thmor Pro",
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ), // Turuncu kutu ile butonlar arası boşluk
            // ALTTA BUTONLAR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // buton tıklandığında yapılacak işlem
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GameScreenColors.darkBlueColor,
                      maximumSize: GameScreenSize.questionBtnSize,
                      minimumSize:
                          GameScreenSize.questionBtnSize, // buton boyutu
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'A${index + 1}',
                      style: const TextStyle(
                        color: GameScreenColors.whiteColor,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
