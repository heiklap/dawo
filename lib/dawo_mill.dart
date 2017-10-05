/// dawo_mill, in very early development state.
/// dawo version:  0.0.3  25.9.2017   ready-state:  0 %  for 0.0.4
/// - hist:  hkl  8.9.2017 created
/// - work-scheduling system, got flag class from dawo_app
//

library dawo_mill;

///  Buffer also outside class, for testing and adding visibility.
var millBuf = new StringBuffer();

///  teamInno -- plan for controlling  this apps states and behaviour
///  Low level work-flow "flags" are in dawlib.....
///  Will eventually be some kind of #mill, that controls all #job's
///  Keeps track of the privileges and performance of the assignments.
///  Names might be:  millRoll  and millFlag

///
class DawoMill {
  int tempo = 6;
  int rounds = 1;

  ///  To keep menu-choice values.
  ///  Like: {'1' : chore1, '2' : chore2}
  Map<String, Object> jobM = new Map();

  int jobInQueue = 0;
  int jobsDone = 0;

  bool on = false;
  bool active = false;
  bool paused = false;
  bool stopped = false;

  String userChoice = '-';
  String autoChoice = '1';

  void roll() {
    print('DawoMill::  $tempo  $rounds    :: engaged ');
    //  code here
  }
}

///  create instance
var mill = new DawoMill(); //  add Object - map to constructor

///  TODO  teamNext  for to use in next versions
///  NOTE:  int '1'  do not give error...  how about int?
///  Or:  Map<String, Object> jobM = new Map();
///  Like: {'1' : chore1, '2' : chore2}
Map<int, String> millMap = {
  '1': 'M',
  '2': 'T',
  '3': 'W',
  '4': 'T',
  '5': 'F',
  '6': 'S',
  '7': 'S',
  '8': 'X',
  '9': 'X'
};
