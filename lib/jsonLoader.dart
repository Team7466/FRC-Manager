import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Jsonloader {
  Future<void> loadQuestions({
    //Burada Jsondan veri çekiyoruz.
    required bool isLoading,
    required dynamic questions,
  }) async {
    final String response = await rootBundle.loadString(
      'assets/questions.json',
    );
    final data = json.decode(response);
    loadQuestions(isLoading: false, questions: data);
  }

  void nextQuestion({
    required int currentQuestionIndex_,
    required List<dynamic> questions_,
  }) {
    if (currentQuestionIndex_ < questions_.length - 1) {
      currentQuestionIndex_++;
    } else {
      //Son soruya gelindiğinde burada son ekrana atacağız ama şimdilik resetleyelim
      currentQuestionIndex_ = 0;
    }
    nextQuestion(
      currentQuestionIndex_: currentQuestionIndex_,
      questions_: questions_,
    );
  }
}
