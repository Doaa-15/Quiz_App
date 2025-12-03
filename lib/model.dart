class model {
  final String question;
  final Map<String, bool> answer;

  model({required this.question, required this.answer});
}

final List<model> questions = [
  model(
    question: "who is the owner of flutter ?",
    answer: {"Apple": false, "Google": true, "Samsung": false, "Nokie": false},
  ),
    model(
    question: "who is the owner of iphone ?",
    answer: {"Apple": true, "oppo": false, "Samsung": false, "Nokie": false},
  ),
    model(
    question: "youtube is ..... platform ?",
    answer: {"music sharing": false, "video sharing": false, "live ": false, "all": true},
  ),
    model(
    question: "Are you a flutter developer?",
    answer: {"False": false, "True": true},
  ),
];
