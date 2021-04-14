import 'package:country_quiz/model/question.dart';
import 'package:country_quiz/model/questions_base.dart';
import 'package:country_quiz/widget/answer.dart';
import 'package:country_quiz/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final QuestionsBase data = QuestionsBase();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  List<Question> questions = [];

  static const num MAX_QUESTIONS = 10;

  void _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  final whiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    Question question;
    while (question == null || questions.contains(question)) {
      question = data.getRandomQuestion();
    }
    List<Country> answers = question.additionCountries;
    answers.add(question.answer);

    answers.sort((a, b) => a.toString().compareTo(b.toString()));
    print(question.imageUrl);
    print(question.answer);

    if (_questionIndex >= MAX_QUESTIONS) {
      return ResultWidget(
        countResult: _countResult,
        questionIndex: _questionIndex,
        onPressed: _clearState,
      );
    }

    return Column(
      children: [
        ProgressBar(
          icons: _icons,
          count: _countResult,
          total: _questionIndex,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 200,
            child: question.image,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: Text(question.title)),
        ),
        Answer(
          title: answers[0].getName(),
          isCorrect: answers[0] == question.answer,
          onChangeAnswer: _onChangeAnswer,
        ),
        Answer(
          title: answers[1].getName(),
          isCorrect: answers[1] == question.answer,
          onChangeAnswer: _onChangeAnswer,
        ),
        Answer(
          title: answers[2].getName(),
          isCorrect: answers[2] == question.answer,
          onChangeAnswer: _onChangeAnswer,
        ),
        Answer(
          title: answers[3].getName(),
          isCorrect: answers[3] == question.answer,
          onChangeAnswer: _onChangeAnswer,
        ),
        Divider(),
        MaterialButton(
          child: Text("Заново"),
          onPressed: _clearState,
        ),
      ],
    );
  }

  void _onChangeAnswer(isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(Icon(Icons.brightness_1, color: Color(0xFFbd27ff)));
          _countResult++;
        } else {
          _icons.add(Icon(Icons.brightness_1, color: Color(0xFF000000)));
        }

        _questionIndex++;
      });
}

class ResultWidget extends StatelessWidget {
  final questionIndex;
  final countResult;
  final Function onPressed;

  ResultWidget({this.countResult, this.questionIndex, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text("Ваш результат: $countResult з $questionIndex питань")),
        MaterialButton(
          child: Text("Заново"),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
