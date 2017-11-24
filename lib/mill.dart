// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// mill, in very early development state.
/// * Usability: 1%
/// dawo version:  0.0.5  6.11.2017   ready-state for 0.0.6 : 0 %
/// - hist:  hkl  8.9.2017 created
/// - work-scheduling system, got flag class from dawo_app
//

library mill;

///  Buffer also outside class, for testing and adding visibility.
var millBuf = new StringBuffer();

///  teamInno -- plan for controlling  this apps states and behaviour
///  Low level work-flow "flags" are in dawlib.....
///  Will eventually be some kind of #mill, that controls all #job's
///  Keeps track of the privileges and performance of the assignments.
///  Names might be:  millRoll  and millFlag

///  Event ordering and scheduling system.
class Mill {
  int tempo = 6;
  int rounds = 1;

  ///  To keep menu-choice values.
  ///  Like: {'1' : chore1, '2' : chore2}
  Map<String, Object> jobM = new Map();

  int jobInQueue = 0;
  int jobsDone = 0;

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'off': true,
    'on': false,
    'pause': false,
    'done': false,
  };

  bool active = false;

  String userChoice = '-';
  String autoChoice = '1';

  void roll() {
    print('DawoMill::  $tempo  $rounds    :: engaged ');
    //  code here
  }
}

///  create instance
var mill = new Mill(); //  add Object - map to constructor

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
