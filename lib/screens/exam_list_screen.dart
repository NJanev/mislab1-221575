import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> getExams() {
    return [
      Exam(subjectName: "Математика 1", dateTime: DateTime(2025, 11, 11 , 10, 0), rooms: ["A1", "A2"]),
      Exam(subjectName: "Програмирање", dateTime: DateTime(2025, 11, 15, 9, 0), rooms: ["B1"]),
      Exam(subjectName: "Физика", dateTime: DateTime(2025, 11, 18, 12, 0), rooms: ["A3"]),
      Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 22, 14, 0), rooms: ["B2"]),
      Exam(subjectName: "Алгоритми", dateTime: DateTime(2025, 11, 25, 9, 0), rooms: ["C1"]),
      Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 11, 28, 11, 0), rooms: ["C2"]),
      Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 11, 2, 10, 0), rooms: ["A4"]),
      Exam(subjectName: "Веб програмирање", dateTime: DateTime(2025, 11, 5, 8, 0), rooms: ["B3"]),
      Exam(subjectName: "Инженерска математика", dateTime: DateTime(2025, 11, 10, 13, 0), rooms: ["C3"]),
      Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 12, 9, 0), rooms: ["A5"]),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 213456"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}