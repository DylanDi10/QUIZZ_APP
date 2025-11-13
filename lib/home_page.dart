import 'package:flutter/material.dart';
import 'package:preguntas_app/quizbrain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> score = [];
  Quizbrain quizbrain = Quizbrain();

  void checkAnswer(String userAnswer) {
    String correctAnswer = quizbrain.getCorrectAnswer();

    if (userAnswer == correctAnswer) {
      score.add(const Icon(Icons.check, color: Colors.greenAccent));
    } else {
      score.add(const Icon(Icons.close, color: Colors.redAccent));
    }

    if (quizbrain.isFinishedFunc()) {
      print("El cuestionario ha terminado");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Quiz Terminado"),
              content: const Text("Has llegado al final."),
              actions: [
                TextButton(
                  onPressed: () {

                    setState(() {
                      quizbrain.restartQuizz();
                      score = [];
                    });
                    Navigator.pop(context); 
                  },
                  child: const Text("Jugar de nuevo"),
                )
              ],
            );
          });
    } else {
      quizbrain.nextQuestion();
    }

    setState(() {});
  }


  Widget _buildAnswerButton(String optionText, Color color) {
    return Expanded( 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: SizedBox(
          height: 120, 
          child: MaterialButton(
            color: color,
            shape: RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () {
              
              checkAnswer(optionText); 
            },
            child: Text(
              optionText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    List<String> currentOptions = quizbrain.getOptions();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff262626),
        appBar: AppBar(
          title: Text(
            "${quizbrain.questionIndex + 1}. ${quizbrain.getQuestionText()}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff262626),
        ),

        
        body: Column(
        
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  quizbrain.getQuestionImage(),
                  height: 200, 
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          SizedBox(height: 50),
            Row(
              children: [
                _buildAnswerButton(currentOptions[0], Colors.purple),
                _buildAnswerButton(currentOptions[1], Colors.teal),
              ],
            ),
            Row(
              children: [
                _buildAnswerButton(currentOptions[2], Colors.orange),
                _buildAnswerButton(currentOptions[3], Colors.redAccent),
              ],
            ),

         
            const Spacer(), 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: score,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}