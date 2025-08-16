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
      body: Center(
        child: SizedBox(
          width: 200, // Butonun genişliği
          height: 60, // Butonun yüksekliği
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Buton rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Köşeleri yuvarlat
              ),
              elevation: 5, // Hafif gölge efekti
              textStyle: const TextStyle(
                fontSize: 20, // Yazı boyutu
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmptyPage()),
              );
            },
            child: const Text("Devam Et"),
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
      appBar: AppBar(title: const Text("Boş Sayfa")),
      body: const Center(
        child: Text("Burası boş bir ekran"),
      ),
    );
  }
}
