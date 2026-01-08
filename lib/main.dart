import 'package:flutter/material.dart';
import 'package:mainscreenforfrcmanager/gameScreen.dart';
import 'package:mainscreenforfrcmanager/values/GameScreen/colorValues.dart';

double startBtnHeight = 57;
double startBtnWeight = 162; //Tasarımdaki boyutu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Arka plana resim eklemek için bu kod kullanılacak
        decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/arkaplan.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          color: GameScreenColors.backgroundColor,
        ),
        child: Center(
          child: SizedBox(
            width: startBtnWeight,
            height: startBtnHeight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //Buton arka plan rengi
                backgroundColor: GameScreenColors.orangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // kareye yakın
                ),
                elevation: 10, // gölge
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GameScreen(title: "FRC Manager Cymurghs"),
                  ), //Oyun ekranına atacak
                );
              }, //Buton textinin yer aldığı bölüm
              child: const Text(
                "START",
                style: TextStyle(color: GameScreenColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Oyun içi ekran olacak burası",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
