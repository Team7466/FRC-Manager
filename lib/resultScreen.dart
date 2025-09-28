import 'package:flutter/material.dart';
import 'values/GameScreen/colorValues.dart';

class ResultScreen extends StatelessWidget {
  final int totalScore;

  const ResultScreen({super.key, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameScreenColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tebrikler!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: GameScreenColors.orangeColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Toplam Puanınız: $totalScore',
              style: TextStyle(
                fontSize: 24,
                color: GameScreenColors.whiteColor,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: GameScreenColors.darkBlueColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Tekrar Başlat',
                style: TextStyle(color: GameScreenColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
