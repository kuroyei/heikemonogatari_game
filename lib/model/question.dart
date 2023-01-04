import 'package:flutter/material.dart';

class Question {
  List<String> choices;
  String answer;
  String audioFilePath;
  Question({required this.choices, required this.answer, required this.audioFilePath});
}