import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50), // Buton biraz yukarıda dursun
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // En alta hizala
          children: [
            SizedBox(
              width: 250, // Buton genişliği
              height: 60, // Buton yüksekliği
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Renk
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Yuvarlatılmış köşeler
                  ),
                  elevation: 5,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmptyPage()),
                  );
                },
                child: const Text("START"),
              ),
            ),
          ],
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
        child: Text("Oyun içi ekran olacak burası"),
      ),
    );
  }
}
