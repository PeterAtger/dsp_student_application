enum Level { Primary, Preparatory, Secondary }

class Question {
  final String question;
  final bool isUrgent;
  final Level level;

  Question({
    this.question,
    this.isUrgent,
    this.level,
  });
}
