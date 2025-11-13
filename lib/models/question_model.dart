class QuestionModel {
  String question;
  List<String> options; 
  String answer;     
  String imageUrl;

  QuestionModel({
    required this.question,
    required this.options, 
    required this.answer,  
    required this.imageUrl,
  });
}