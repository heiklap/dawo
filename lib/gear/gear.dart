// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///
/// # Gear, dashboard system for dawo.
///
/// * dwv: version:   1.0.0.  10.4.2022.  -  devState 5 %
//

//

library gear;

//  for box_serve:
//  NO  import '../venue/box_serve.dart';
//  for box-serve
import '../venue/venue.dart';
import '../tools/tools.dart';


part 'glb.dart';
part 'mill.dart';


///  Buffer also outside class, for testing and adding visibility.
StringBuffer gearBuf = StringBuffer();

///  Will eventually be some kind of #gear, that controls all #job's
///  Loop - switch - doWhile bunch of functions and methods
///  Keeps track of the privileges and performance of the assignments.
///  Names might be:  gearRoll  and gearFlag

///  Control flow structures.
///  Event ordering and scheduling system.
class Gear {
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


  ///  Punch-style st
  ///  4 bool in Map to control states, working-condition-state values.
  Map<String, bool> st = {
    'wake': false,
    'work': false,
    'pause': false,
    'done': false,
    'sleep': false
  };
  ///
  bool active = false;
  ///
  String userChoice = '-';
  String autoChoice = '1';
  ///
  void roll() {
    print('DawoGear::  $tempo  $rounds    :: engaged ');
    //  code here
  }
}     //     -----     class Gear

///  create instance
Gear gear = Gear(); //  add Object - map to constructor

///  TODO  teamNext  for to use in next versions
///  NOTE:  int '1'  do not give error...  how about int?
///  Or:  Map<String, Object> jobM = new Map();
///  Like: {'1' : chore1, '2' : chore2}
Map<String, String> gearMap = {
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
