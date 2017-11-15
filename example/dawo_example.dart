// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo_example   dawo version  0.0.5  6.11.2017

import 'package:dawo/dawo.dart';

///  watch difference, when importing dawo/dawo_src.dart
///  dawo_src only #imports all dawo files except dawo.dart
///  dawo.dart exports: export 'package:dawo/dawo_src.dart';
//  import 'package:dawo/dawo_src.dart';

import 'package:dawo/alpha.dart';
import 'package:dawo/chore.dart';

import 'package:dawo/dawo_app.dart';
import 'package:dawo/connector.dart';
import 'package:dawo/mill.dart';
import 'package:dawo/missions.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/rumba.dart';

//

//  create classes::
var da = new DawoApp('exampleApp', 'Testing in dawo_example');
var df = new Mill();

var missionX = new Mission('Mission-class', 'example:dawo_example');

var ch = new CommonChore('ChoreInDawoExample', 'Test-Chore');

main() {
  print('d-ex-==>>==>>====      dawo_example          ==>>==>>====');
  //  By Google Stagehand example
  var awesome = new Awesome();
  print('d-ex-:DAWO:EXAMPLE:  awesome: ${awesome.isAwesome}');
  Map<String, String> placardM = {
    'actor': 'D-example',
    'sender': 'Dawo example',
    'receiver': 'D-ex-loops',
    'command': 'D-ex-cmd:',
    'msg': 'D-ex-msg:',
  };

  var dawoApp = new DawoApp(':play-rumba-test:dawoApp',
      'By: dawo_example.dart: dawoApp rolls missioms');
  var rumba = new Rumba();
  noPrint();

  print('d-ex--->>-->>--  :dawo:example: calling :connector:  -->>-->>--');
  String connectorMsg = ':ORDER of :OUTER process is :ANY KIND ';
  con.opJoin(placardM, connectorMsg, ':Dawo:example:');
  con.roll();

  // This also returns a StringBuffer.
  rumba.dance(dawoApp);
  print('d-ex-==<<==roll mission op/ init -open - roll: -close    ==<<==<');
  //  TODO  Better hello-function, to do something real.
  void courierMission() => print('d-ex-exmpl: * *  :courier: Mission!. * * ');
  print('\n d-ex-:dw:-ex: -----------  rolling :courier:Mission: ------ ');

  ///  Eventually opRoll handles all these others.
  packDawoMission.opInit(1, 'empty parameter');
  packDawoMission.opOpen(2, 'second empty parameter');
  packDawoMission.opRoll(3, courierMission);
  packDawoMission.opClose(); //  No parameters.
  packDawoMission.opReport();
  print('d-ex- -:dw:-ex: -----  rolling :courier:mission: opFunc  done ---\n');
  scheduleBox(':d:ex:');

  // #connector
  ch.roll();

  print('d-ex- ==>>==>>====      dawo_example buffers:     ==>>==>>====');
  out.outBuffersSizes('dawo_example');
  outBuffersPrint('d-ex- dawo_example', 'no-prevent-printing');
  print('d-ex- ==<<==<<====      dawo_example buffers:     ==<<==<<====');

  print('d-ex- >>  ----- calling choreEffort---------- dawo sets, goals:');
  choreEffort('d-ex-');

  print('d-ex- <<  ----- calling choreEffort done  ------ dawo sets, goals:');

  print('d-ex- ==>>==>>====      encoded - decoded      ==>>==>>====');
  print('d-ex- ==>>==>>==== chore > effort > user_json render   ==>>==>>===');
  choreToEffortUserJson(':d-ex:');

  print('d-ex- ==<<==<<====      encoded - decoded   done   ==<<==<<====');
  print('d-ex- ==>>==>>==== :d:ex: calling connector report   ==>>==>>===');
  con.report();
  print('d-ex- ==<<==<<====      connector report done     ==<<==<<====');

  print('d-ex- ==<<==<<====      dawo_example done     ==<<==<<====');
}

void noPrint() {
  /*
  //  lol  You can not access local private variables.
  dawoApp.printControl(false);  //  no top-level getter dawoApp ??
  connector._pB = false;
  dev._pB = false;
  mill._pB = false;
  missions._pB = false;
  shower._pB = false;
  tools._pB = false;
  rumba._pB = false;
 */
}

///  For to check variables visibility.
void wordPlay() {
  //  Play with variables: watch something from every file
  //  base
  // baseLibMotto

  //  baseStructMotto;

  //  chore
  // choreBuf

  //  dawo
  // dawoBuf

  //  app  3 variables
  // appMap;

  //  dev  17 variables
  //  devBlame;

  //  flow*  2 variables

  //  mill  4 variables

  //  DawoMill

  //  mission
  //  Mission  class

  //  out  15 variables
  //  placard* : 1

  //  toolsActive;

  //  play with classes
  /*
  da.
  df.
  ch.
  */

  ///  testing dawo
  //  daw... ok

  //  render   //  there are 5 render-functions

  //  No, too much noise.
  //  printBuffers();
}

void playDawoSrcDart() {}
