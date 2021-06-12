import 'questionBank.dart';

//It really helps us to reduce the complexity of the program
//If we need the change the questions we don't really need to touch the main file
//Similary we can have multiple files for various quiz topics as separate classes

class Core {
  List<Bank> _questionAns = [
    Bank('Earth is the third planet from the Sun.', true),
    Bank(
        'Earth is the fourth largest planet in the solar system in terms of size and mass.',
        false),
    Bank(
        'Since German is the international language of astronomy, Earth’s name in English derives from Germanic words for ground and earth.',
        false),
    Bank(
        '“Earth” is only name for a planet of the solar system that does not come from Grego-Roman mythology.',
        true),
    Bank(
        'Even enlightened thinkers didn’t regard Earth as a planet like the others in the solar system until the 18th century.',
        false),
    Bank(
        'Viewed from another planet in the solar system, Earth would appear to be a bright blue in colour.',
        true),
    Bank(
        'Earth’s surface is traditionally subdivided into seven continental masses.',
        true),
    Bank('Earth’s continents are surrounded by four major bodies of water.',
        true),
    Bank(
        'The mean distance of Earth from Sun is about 8,046,700 km (5,000,000 miles).',
        false),
    Bank(
        'Earth orbits the Sun in a path that is presently more nearly a circle than the orbit of any other planet.',
        false),
  ];

  bool getAnswer(int currentNum) {
    return _questionAns[currentNum].answers;
  }

  String getQuestion(int currentNum) {
    return _questionAns[currentNum].question;
  }

  int getLength() {
    return _questionAns.length;
  }

  void setQuestion() {
    _questionAns.insert(
        0, Bank('Love this App developed by Sri Balaji?', true));
  }
}
