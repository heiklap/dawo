// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
///
///  * dwv: version:   1.0.0.   10.4.2022  devState : 20 %
///  ##  Sample file made by Dart.  "Home of dawo libraries."
/// * Badly treated and would deserve more love than I have to give.
/// * Might serve as a collector or central for it's sub-libraries.
///
//

//  devl:LIB  teamEdu  ---------   notes are essential part of dawo package ------
//      so they are left here.. and they show direction and serve as tools here
//  devl:LIB  myOwn    Remember this & myOwn-special hashtag & special-projects

library dawo_src; //  naming this to _src...


import 'dawo_app.dart';
import 'beta/beta.dart';
import 'clay/clay.dart';
import 'dev/dawo_dev.dart';
import 'gear/gear.dart';
import 'hacker/hack.dart';
import 'mis/mis.dart';
import 'tools/tools.dart';


part 'src/awesome.dart';

// #Team teamAdm  'favorite Dev, kill inno :), save money & time'
//       teamDev  'create fine new complicated things'
//       teamEdu   'this works, show it to everybody'
//       teamHowTo 1-9 -valued   answers and questions
//       teamInno  'crazy' ideas  (..that  adm often crushes :)
// #NOT  teamNext  for  next dawo versions

//  devl:LIB  teamAdm  package  Not yet:  import 'package:game_loop/game_loop_html.dart';
//  devl:LIB  teamAdm  pack     to avoid complications, better not to use too many packages
///
//  devl:LIB  teamDev   NOT using collection package anymore
//  devl:LIB  Should make alphabetical .txt  list of suggestions & not-used things.

///---------------------  count how long way to 0.0.1 version
num dawoDartReadiness = 92;

String missionError = 'Yes there is mission error';

//  Using getters to collect sums of variables from dawo-part files.
num get dawoReadiness =>
    ///  adf  in hack library
    (    adf.aldenteFuncReadiness +
        batLoopReadiness +
        betaReadiness +
        effortReadiness +
        dawLibStreamReadiness +
        dawLibWorkReadiness +
        dawoDartReadiness +
        dawoAppReadiness +
        dawoDevReadiness +
        toolsReadiness) /
    11;

///  ---------------------     initialization at the beginning
//  devl:LIB  teamInno: Can it be done?:  special initialization process at the beginning
num get dawoInit => adf.aldenteFuncInit();

///  High-level function to get Map data.
Map getClay(String _mapS) {
  Map _retM = getClayMap(_mapS);
  return _retM;
}

///  Example of library usage: dawo_app can be accessed from here,
///  but users of package can access it only by importing it.

///  Almost all render.. functions are tests or example-like files.
StringBuffer renderDawo() {
  print('\n ---------------  renderDawo rolling -------------------------');
  var renderBuffer = StringBuffer();
  renderBuffer.writeln('\n ------ renderBuffer starting  ------------ \n');

  dawoApp.init('dawoTestApp', 'in void renderDawo ');
  dawoApp.packageM['agenda']; //  Just naming it.

  /// Just another instance, shorter, for testing.
  DawoApp da = DawoApp();
  da.init('dawoApp', 'playing in renderDawo-function');
  Mill mill = Mill();
  renderBuffer.writeln(da.info);
  mill.userChoice;

  /// -------------------------------- testing  getters and setters
  /// HINT:  with getters you can make code, that works NOW
  /// -------------       bool.. use some getters for testing
  //  NOTE: howTo:   getters can not be defined withing methods or functions;
  //  bool get dawoOn   => dawoFlags.on;
  //  bool get dawoActive => dawoFlags.active;  //  stupid name
  //  dawoOn; //  just naming it
  //  dawoActive;

  renderBuffer.writeln('------- renderBuffer data--------------------- \n');
  Mission missionY = Mission('mission in dawo_src-render', 'test-mission');
  missionY.name;
  missionY.done();
  //Private:  no access and no need for it.  missionY._opCount;

  renderBuffer.writeln('--------renderBuffer done -------------------- \n');
  print(renderBuffer);
  print('---------------  renderDawo * done *  --------------------- \n');

  return renderBuffer;
}     //     -----      renderDawo

///  Fast test for rumba.
void renderRumba() {
  //  rumba  //  2 variables
}
