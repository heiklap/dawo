// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source codeis governed by a BSD-style license
// that can be found in the LICENSE file.
///
/// # Mill, fine-graded command / event scheduling system.
/// * State: Just an long developed idea, in very early development state.
/// * Usability: 1%  IDEA: Clear, but got no time to implement it.
/// * work-scheduling system, got flag class from dawo_app.
/// * dwv: version:   0.9.6  1.4.2022  -  devState 5 %
//

//
part of gear;

///  Buffer also outside class, for testing and adding visibility.
StringBuffer millBuf = StringBuffer();

///  Will eventually be some kind of #mill, that controls all #job's
///  Loop - switch - doWhile bunch of functions and methods
///  Keeps track of the privileges and performance of the assignments.
///  Names might be:  millRoll  and millFlag

///  Control flow structures.
///  Event ordering and scheduling system.
class Mill {
  ///
  int tempo = 6;
  ///
  int rounds = 1;

  ///  To keep menu-choice values.
  ///  Like: {'1' : chore1, '2' : chore2}
  Map<String, Object> jobM = Map();
  ///
  int jobInQueue = 0;
  ///
  int jobsDone = 0;

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'off': true,
    'on': false,
    'pause': false,
    'done': false,
  };
  ///
  bool active = false;
  ///
  String userChoice = '-';
  String autoChoice = '1';
  ///
  void roll() {
    print('DawoMill::  $tempo  $rounds    :: engaged ');
    //  code here
  }
}     //     -----     class Mill

///  create instance
Mill mill = Mill(); //  add Object - map to constructor

///  TODO  teamNext  for to use in next versions
///  NOTE:  int '1'  do not give error...  how about int?
///  Or:  Map<String, Object> jobM = new Map();
///  Like: {'1' : chore1, '2' : chore2}
Map<String, String> millMap = {
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
