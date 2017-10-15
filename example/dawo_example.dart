// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo_example   dawo version  0.0.4  16.10.2017

import 'package:dawo/dawo.dart';

///  watch difference, when importing dawo/dawo_src.dart
///  dawo_src only #imports all dawo files except dawo.dart
///  dawo.dart exports: export 'package:dawo/dawo_src.dart';
//  import 'package:dawo/dawo_src.dart';

// wanna import all of them?
import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'package:dawo/base_lib.dart';
import 'package:dawo/base_struct.dart';
import 'package:dawo/chore.dart';
import 'package:dawo/dawlib_coll.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/dawo_mill.dart';
import 'package:dawo/missions.dart';
import 'package:dawo/tools.dart';
import 'package:dawo/rumba.dart';

//

//  create classes::
var da = new DawoApp('exampleApp', 'Testing in dawo_example');
var df = new DawoMill();

var missionX = new Mission('Mission-class', 'example:dawo_example');

var ch = new CommonChore('ChoreInDawoExample', 'Test-Chore');

main() {
  print('==>>==>>====      dawo_example          ==>>==>>====');
  //  By Google Stagehand example
  var awesome = new Awesome();
  print(':DAWO:EXAMPLE:  awesome: ${awesome.isAwesome}');

  var dawoApp = new DawoApp(':play-rumba-test:dawoApp',
      'By: dawo_example.dart: dawoApp rolls missioms');
  var rumba = new Rumba();

  // This also returns a StringBuffer.
  rumba.dance(dawoApp);
  print('==<<==roll mission op/ init -open - roll: -close    ==<<==<');

  void helloMission() => print('hello Mission!');
  print('  rolling mission op-functions  ');

  ///  Eventually opRoll handles all these others.
  packDawoMission.opInit(1, 'empty parameter');
  packDawoMission.opOpen(2, 'second empty parameter');
  packDawoMission.opRoll(3, helloMission);
  packDawoMission.opClose(4, helloMission);
  packDawoMission.opSchedule();
  packDawoMission.opReport();

  print('==<<==<<====      dawo_example buffers:     ==<<==<<====');

  out.outBuffersSizes('dawo_example');
  outBuffersPrint('dawo_example', 'no-prevent-printing');

  print('==<<==<<====      dawo_example done     ==<<==<<====');
}

///
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
