// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Home of dawo libraries
/// * dawo version: 0.0.5  56.11.2017  READY-STATE: for 0.0.6 : 0 %
///
/// * Hist: hkl  18.12.2013  0.0.1  dawo/lib  dawo.dart package
///

//  TODO  teamEdu  ---------   notes are essential part of dawo package ------
//      so they are left here.. and they show direction and serve as tools here
//  TODO  myOwn    Remember this & myOwn-special hashtag & special-projects

library dawo_src; //  naming this to _src...

//  Some unused imports stay..
import 'dart:async';

import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'base_lib.dart';
import 'base_struct.dart'; //  unused
import 'chore.dart';
import 'connector.dart'; //  unused
import 'corporate.dart';  //  some stuff from base_lib.
import 'dawo_app.dart';
import 'dawo_dev.dart';
import 'effort.dart';
import 'equipment.dart';
import 'mill.dart';
import 'missions.dart';
import 'rumba.dart'; //  unused
import 'shower.dart';
import 'tools.dart';

///  Data ( #clay ) is in clay-folder.
import 'package:dawo/clay/clay_roll.dart';

//  *team* became independent. How to use team in future.. that's the question.
//  *team* was collaboration system to serve as tool for dawo development.
//  Small elements of team are presented.

// #Team teamAdm  'favorite Dev, kill inno :), save money & time'
//       teamDev  'create fine new complicated things'
//       teamEdu   'this works, show it to everybody'
//       teamHowTo 1-9 -valued   answers and questions
//       teamInno  'crazy' ideas  (..that  adm often crushes :)
// #NOT  teamNext  for  next dawo versions

//  TODO  teamAdm  package  Not yet:  import 'package:game_loop/game_loop_html.dart';
//  TODO  teamAdm  pack     to avoid complications, better not to use too many packages
///
//  TODO  teamDev   NOT using collection package anymore
//  TODO  Should make alphabetical .txt  list of suggestions & not-used things.

part 'src/awesome.dart';

//  TODO  teamNext   not yet :  part 'wrap_game_loop.dart';

///---------------------  count how long way to 0.0.1 version
num dawoDartReadiness = 92;

String missionError = 'Yes there is mission error';

//  Using getters to collect sums of variables from dawo-part files.
num get dawoReadiness =>
    (aldenteFuncReadiness +
        batLoopReadiness +
        dawLibBaseReadiness +
        effortReadiness +
        dawLibStreamReadiness +
        dawLibWorkReadiness +
        dawoDartReadiness +
        dawoAppReadiness +
        dawoDevReadiness +
        toolsReadiness) /
    11;

///  ---------------------     initialization at the beginning
//  TODO  teamInno: Can it be done?:  special initialization process at the beginning
num get dawoInit => aldenteFuncInit();

///  High-level function to get Map data.
Map getClay(String _mapS) {
  Map _retM = getClayMap(_mapS);
  return _retM;
}

///  NOTE: Need to create instance of BLib class here?

///  Example of library usage: dawo_app can be accessed from here,
///  but users of package can access it only by importing it.
///  All render.. functions are tests or example-like files.
StringBuffer renderDawo() {
  print('\n ---------------  renderDawo rolling -------------------------');
  var renderBuffer = new StringBuffer();
  renderBuffer.writeln('\n ------ renderBuffer starting  ------------ \n');

  var dawoApp = new DawoApp('dawoTestApp', 'in void renderDawo ');

  //TODO  where is this? var dawoFlags = new Dawo

  dawoApp.agenda; //  Just naming it.

  /// Just another instance, shorter, for testing.
  var da = new DawoApp('dawoApp', 'playing in renderDawo-function');
  var mill = new Mill();
  renderBuffer.writeln(da.infoS);
  mill.userChoice;

  /// -------------------------------- testing  getters and setters
  /// HINT:  with getters you can make code, that works NOW
  /// -------------       bool.. use some getters for testing
//  NOTE: howTo:   getters can not be defined withing methods or functions;
//  bool get dawoOn   => dawoFlags.on;
//  bool get dawoActive => dawoFlags.active;  //  stupid name
  //TODO  where did this go?  var dawoOn = dawoFlags.active;
  //  dawoOn; //  just naming it
  //TODO  var dawoActive = dawoFlags.active;
  //  dawoActive;

  renderBuffer.writeln('------- renderBuffer data--------------------- \n');
  var missionY = new Mission('mission in dawo_src-render', 'test-mission');
  missionY.opCount;

  renderBuffer.writeln('--------renderBuffer done -------------------- \n');
  print(renderBuffer);
  print('---------------  renderDawo * done *  --------------------- \n');

  return renderBuffer;
}

///  Fast test for rumba.
void renderRumba() {
  //  rumba  //  2 variables
}
