
class Questions{

  late String question;
  late bool correctAnswer;
  late bool incorrectAnswer;
  
  Questions(this.question, this.correctAnswer, this.incorrectAnswer);
  
  static List<Questions> samples = [
    Questions(
      'A defibrillator is used to start up a heartbeat once a heart has stopped beating.',
      false,
      true,),
    Questions(
      'The music group Daft Punk got their name from a negative review they recieved.',
      true,
      false,),
    Questions(
      'An eggplant is a vegetable.',
      false,
      true,),
    Questions(
      'Antarctica is the largest desert in the world.',
      true,
      false,),
    Questions(
      'Former United States Presidents John Adams and Thomas Jefferson died within hours of each other.',
      true,
      false,),
    Questions(
      'When BMW was established in 1916, it was producing automobiles.',
      false,
      true,),
    Questions(
      'Hippopotomonstrosesquippedaliophobia is the irrational fear of long words.',
      true,
      false,),
    Questions(
      'Soccer player Cristiano Ronaldo opened a museum dedicated to himself.',
      true,
      false,),
    Questions(
      'Rabbits are carnivores.',
      false,
      true,),
    Questions(
      'Ping-Pong originated in England',
      true,
      false,),
  ];
}