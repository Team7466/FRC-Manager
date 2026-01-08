import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultScreen.dart';
import 'values/GameScreen/colorValues.dart';
import 'values/GameScreen/sizeValues.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.title});
  final String title;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<dynamic> questions = [];
  bool isLoading = true;
  int currentQuestionIndex = 0;
  int totalScore = 0;
  Map<String, int> scores = {
    "mechanic": 0,
    "software": 0,
    "electrical": 0,
    "pr": 0,
    "finance": 0,
    "moral": 0,
  };

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/question.json',
      );
      final List<dynamic> data = json.decode(response);

      //Hafta bazlı gruplama
      Map<int, List<dynamic>> weekMap = {};
      for (var q in data) {
        int week = q['week'] ?? 0;
        weekMap.putIfAbsent(week, () => []);
        weekMap[week]!.add(q);
      }

      //Rastgele soru seçme
      List<dynamic> selectedQuestions = [];
      weekMap.forEach((week, questionList) {
        questionList.shuffle(); //Soruları map içerisinde rastgele sıralıyoruz
        selectedQuestions.add(questionList.first); //ilk değeri alıyoruz.
      });
      setState(() {
        questions =
            selectedQuestions; //Haftaya göre ve rastgele sıralanmış soruları seçtik
        isLoading = false;
      });
    } catch (e) {
      print("JSON yüklenirken hata: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void answerQuestion(int index) {
    final currentQuestion = questions[currentQuestionIndex];
    final answer = currentQuestion['answers'][index];

    if (currentQuestion['answers'] == null ||
        currentQuestion['answers'].length <= index)
      return;

    if (answer == null) return;

    setState(() {
      answer.forEach((key, value) {
        if (key != "text" && value is int) {
          scores[key] = (scores[key] ?? 0) + value;
        }
      });
    });

    nextQuestion();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(scores: scores)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: GameScreenColors.orangeColor,
            size: 70,
          ),
        ),
      );
    }

    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: Text("Soru bulunamadı!")));
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        color: GameScreenColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    (currentQuestion['question'] ?? "Soru yok").toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GameScreenColors.whiteColor,
                      fontSize: GameScreenSize.questionFontSize,
                      fontFamily: "Kdam Thmor Pro",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(currentQuestion['answers']?.length ?? 0, (
                index,
              ) {
                final answer = currentQuestion['answers'][index];
                final answerText = (answer?['text'] ?? "").toString();

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => answerQuestion(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GameScreenColors.darkBlueColor,
                      maximumSize: GameScreenSize.questionBtnSize,
                      minimumSize: GameScreenSize.questionBtnSize,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      answerText,
                      style: const TextStyle(
                        color: GameScreenColors.whiteColor,
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
