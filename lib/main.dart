import 'package:flutter/material.dart';

double startBtnHeight = 57;
double startBtnWeight = 162; //Tasarımdaki boyutu
const Color startBtnColor = Color.fromRGBO(
  255,
  37,
  37,
  100,
); //Buton arka planının rengini ayarlar
const Color startBtnTextColor = Color.fromRGBO(
  20,
  8,
  8,
  100,
); //Butonun textinin rengini ayarlar
const Color backgroundColor = Color.fromRGBO(
  114,
  152,
  249,
  100,
); //Arka plan rengi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          color: backgroundColor,
        ),
        child: Center(
          child: SizedBox(
            width: startBtnWeight,
            height: startBtnHeight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //Buton arka plan rengi
                backgroundColor: startBtnColor,
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
                    builder: (context) => const EmptyPage(),
                  ), //Oyun ekranına atacak
                );
              }, //Buton textinin yer aldığı bölüm
              child: const Text(
                "START",
                style: TextStyle(color: startBtnTextColor),
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
