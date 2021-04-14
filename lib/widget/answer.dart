import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final isCorrect;
  final Function onChangeAnswer;

  Answer({Key key, this.title, this.isCorrect, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                offset: Offset(1, 1),
              )
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Color(0xFF5337FF),
              Color(0xFF8131FF),
              Color(0xFFBD27FF),
            ])),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
