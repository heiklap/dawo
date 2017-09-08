///
/// hist:  hkl  8.9.2017 created
/// work-scheduling system, got flag class from dawo_app
//

library dawo_mill;


//TODO  teamInno    -------- plan for controlling  this apps states and behaviour
///     low level work-flow "flags" are in dawlib.....
///  will eventually be some kind of #mill, that controls all #job's
///  keeps track of the privileges and performance of the assignments.
///  names might be:  millRoll  and millFlag
class DawoMill {
  int tempo = 6;
  int rounds = 1;

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

/// TODO  teamNext  for to use in next versions
/// NOTE:  int '1'  do not give error...  how about int?
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



