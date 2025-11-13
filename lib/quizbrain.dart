import 'package:preguntas_app/models/question_model.dart';

class Quizbrain {
  bool isFinished = false;
  int questionIndex = 0;

  List<QuestionModel> questionList = [
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      options: ["Machin", "Capitán Peru", "Capitán América", "Capitan Europa"],
      answer: "Capitán América",
      imageUrl: "https://i0.wp.com/elplanetaurbano.com/wp-content/uploads/2023/06/Capitan-America.jpg", 
    ),
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      options: ["Iron man", "Robotin", "Robocop", "Robertín"],
      answer: "Iron man",
      imageUrl: "https://cdn.britannica.com/49/182849-050-4C7FE34F/scene-Iron-Man.jpg",
    ),
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      options: ["Linterna verde", "Hulk", "Superman", "Batman"],
      answer: "Hulk",
      imageUrl: "https://areajugones.sport.es/wp-content/uploads/2024/08/versiones-hulk.jpg",      
    ),
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      options: ["Thanos", "Platanos", "Ricardo Moran", "Gian Marco"],
      answer: "Thanos",
      imageUrl: "https://wallpapers.com/images/featured/thanos-9lbwslx8ppcvnaos.jpg",      
    ),
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      options: ["Superman viejo", "Prosor Strange", "Doctor Tv", "Doctor Strange"],
      answer: "Doctor Strange",
      imageUrl: "https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/noticias-cine/doctor-strange-nuevo-cartel-y-duracion/114752153-1-esl-ES/Doctor-Strange-Nuevo-cartel-y-duracion-final-confirmada.png",      
    ),
  ];

  String getQuestionText() {
    return questionList[questionIndex].question;
  }
  List<String> getOptions() {
    return questionList[questionIndex].options;
  }
  String getCorrectAnswer() {
    return questionList[questionIndex].answer;
  }
  String getQuestionImage() {
    return questionList[questionIndex].imageUrl;
  }
  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      isFinished = true;
      print("Se acabaron las preguntas");
    }
  }

  bool isFinishedFunc() {
    return isFinished;
  }

  void restartQuizz() {
    questionIndex = 0;
    isFinished = false;
  }
}