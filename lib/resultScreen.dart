import 'package:flutter/material.dart';
import 'values/GameScreen/colorValues.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> scores;

  const ResultScreen({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameScreenColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Sonuçlar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: GameScreenColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Kategori Puanların",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: scores.entries.map((entry) {
                  return Card(
                    color: GameScreenColors.orangeColor,
                    child: ListTile(
                      title: Text(
                        entry.key.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GameScreenColors.whiteColor,
                        ),
                      ),
                      trailing: Text(
                        entry.value.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: entry.value >= 0
                              ? Colors.green
                              : Colors
                                    .black, //bunları const olarak eklememiz lazım.
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GameScreenColors.orangeColor,
        onPressed: () {
          Navigator.pop(
            context,
          ); //mainScreene gideceğiz. Merge işlemi yapıldıktan sonra değişecek.
        },
        child: const Icon(Icons.home, color: Colors.black),
      ),
    );
  }
}
