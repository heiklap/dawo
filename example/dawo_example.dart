// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  *  dawo_example   dawo version   0.0.7. - 18.12.2017
///  *  dawo_example creates 28 screens of console output data presentation.
///  * Find:  :con: :connector: :opCom:  :corporate:

import 'package:dawo/dawo.dart';

///  watch difference, when importing dawo/dawo_src.dart
///  dawo_src only #imports all dawo files except dawo.dart
///  dawo.dart exports: export 'package:dawo/dawo_src.dart';

///

import 'package:dawo/alpha.dart';
import 'package:dawo/beta.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/rumba.dart';
import 'package:dawo/tools.dart';

import 'package:dawo/mis/camp.dart';
import 'package:dawo/mis/chore.dart';
import 'package:dawo/mis/missions.dart';

import 'package:dawo/corp/bind.dart';
import 'package:dawo/corp/connector.dart';
import 'package:dawo/dev/dawo_dev.dart';
import 'package:dawo/src/glb.dart';
import 'package:dawo/src/box_serve.dart';

//  Unused package is marked with grey, and #warning.
//  import 'package:dawo/mill.dart';

//  You can use any name for classes, that you create:
//  var da = new DawoApp('exampleApp', 'Testing in dawo_example');

/// Mill class is planned to be method runner / scheduler of dawo.
//  var mill = new Mill();

//  Example, how extra instance of mission is created:
//  var missionX = new Mission('Mission-class', 'example:dawo_example');

//  Made by Google Stagehand automatically, when creating a new package.
//  This serves as an example of class, and user can develop it further.
var awesome = new Awesome();
//  When you try code below, you can see 6 properties of awesome class.
//  awesome.

//  Used once here to run method roll()
var ch = new CommonChore('ChoreInDawoExample','dawoExample', 'Test-Chore');

//  create classes, that do not already have an instance inside dawo::
var dawoApp = new DawoApp(':play-rumba-test:dawoApp',
    'By: dawo_example.dart: dawoApp rolls missioms');
var rumba = new Rumba();

///  Data fields:
///  Information of #user for :con:  :opCom: and :corporate:
Map<String, String> placardM = {
  'actor': 'D-example',
  'sender': 'Dawo example',
  'receiver': 'D-ex-loops',
  'command': 'D-ex-cmd:',
  'msg': 'D-ex-msg:',
};

///  Local variables for this presentation.
bool _pB = true; //  Boolean value used to control printing.
String dexS = ':d:ex:'; //  Prefix for print messages and easy find.
int dexC = 0; //  counter for activities in this example.
String connectorMsg = ':ORDER of :OUTER process is :ANY KIND ';

///  For 0.0.6, main function is 17.11.2017 separated to small functions.
///  In dawo package there is no main-function. Only in example files.
///  Every dart program starts it's execution from main method.
main() {
  glb.dawoLogo.forEach(print);
  devBox(':d:ex:main:', ['* header *', '* footer *'], [glb.keyWords, glb.keyWordsSmall], 28);
  devBox('By:dev:versions:',['* header *', '* footer *'],  [tl.mapToFineList(dev.later, 75, 20) ,tl.mapToFineList(dev.version008 , 75, 20)], 0);
  var sw = new Stopwatch()..start();
  DateTime start = new DateTime.now();

  ///  Call function that adds #actor and #count to this String and prints it.
  exInfo('==>>==>>==   dawo_example    ==>>==>>==');

  print(':glb:print:states:  set to false. only :buf: used');
  print(glb.prSt);
  print('-- Change print status: glb.setGlbPrint(true or false) ------');
  glb.box(dexS);

  exInfo('==>>==>>==   dawo_example  awesome: ${awesome.isAwesome}');

  ///  All connector activity is marked with: :connector: in output.
  //  exInfo('==>>==>>==   dawo_example calling :connector:    ==>>==>>==');
  //  Later:  connectorOp(dexS); //  function below.

  // This method also returns a StringBuffer, that is not used here.
  rumba.dance(dawoApp); //  15 screens of output.

  exampleMethodsPlay(); //  Add more 13 screens output.
  bind.report('$dexS');
  dawoApp.box(dexS); //  2. time here-

  connectorOp(dexS);
  exInfo('    ==<<==<<==    dawo_example done    ==<<==<<==');

  print("Executing dawo_example.dart took: ${sw.elapsed}us");
  DateTime stop = new DateTime.now();
  print(' \nStopTime::  $stop');
  print(stop.difference(start));
  print('FlowServe calls::   $flowI ');
  boxServeTemplate();
  packDawoMission.joyChr.box(':dawoExample:call:joyChr:box:');
  print('.......... :glb:boxServe:buf: length and names  ................');
  print(glb.boxServeBuffers.length);
  for (var z in glb.boxServeBuffers.keys) {
    print(glb.boxServeBuffers[z].length);
    print(z);
  }
  //  glb.boxServeBuffers.keys.forEach(print);


  //print buffer: print(glb.boxServeBuffers[':dawoHist:dailyAction:friday:6']);
  print('---- main done   ');
} //  -----  end of main.

///  From dailyAction
void boxServeTemplate() {
  print('---------- :boxServe:dawoLogo: :temporary:hack:   ----------------');
  DawoHist dawoHist = new DawoHist();
  dawoHist.init();
  dawoHist.build('_emblemString', '_masterString');
  dawoHist.roll();
  dawoHist.buf.writeln(':dailyAction:friday:');

  ///  TODO  hosTo handle:  in boxServe there are:  title and footer.
  boxServe.init(36, 175, '_');

  ///  Table name and glb.buffer name
  boxServe.construct(
      ':dawoHist:dailyAction:friday:', ':dawoHist:dailyAction:friday:');

  ///  BaseStruct fields:  boxLayoutDap(BaseStruct _model, String _rubric)
  boxLayoutDap(dawoHist, ':dawoHist:dailyAction:friday:');
  boxServe.show(':dailyAction:test:', 'print');
  boxServe.done(':dailyAction:test:');
}

///  To allow easy-run of these 8 separated activities.
void exampleMethodsPlay() {
  exampleMission();

  ///  Calling Class scheduleBox method, in dawo/shower.dart
  ///  Nice screen of collected data in boxed for,
  scheduleBox.roll('$dexS');

  lonelySampleChore();
  sampleDawoBuffers();

  exInfo('==>>==>>==   calling choreEffort---------- dawo sets, goals:');
  choreEffort('$dexS');
  exInfo('    ==<<==<<==    calling choreEffort done  dawo sets, goals:');

  sampleJsonData();
  connectorExampleReport();
  //  deprecated  schedulePlay();
}

///  Form  message row to easy-find and print it if: _pB
void exInfo(String msg) {
  dexC++;
  String dexCS = dexC.toString();
  //  String: -exInfo appended here, as an example. It is 16 times in output.
  String _msg = ' -exInfo $dexS $dexCS $msg';
  if (_pB) print(_msg);
}

///  Place where :corporate:  :opCom:  and :connector: play together.
void connectorOp(String caller) {
  connector.join('DawoExample', placardM, connectorMsg, ':Dawo:example:');
  connector.roll();
  connector.box(':d:ex:');
}

//  TODO  #IDEA: for courier carrier, to do something really nice.
//  :courier: marks this message carriage functions activity.
void courierMessage() => print('d-ex-exmpl: * *  :courier: Mission!. * * ');

///  This class instance has been created in dawo, and it is usable here.
void exampleMission() {
  exInfo('    ==<<==<<==    roll mission op/ init -open - roll: -close==<<==');
  exInfo('\n ==>>==>>==   rolling :packDawo:Mission:    ==>>==>>==');

  ///  Eventually opRoll handles all these others.
  scout.init(1, 'empty parameter');
  scout.open(2, 'second empty parameter');
  //  calls void function that prints a String.
  //  In front of String is line feed, and another String with interpolation.
  exInfo('\n $dexS-:dw:ex: -----------  rolling :courier:Message: ------ ');
  scout.roll(3, courierMessage);
  exInfo('  - -:dw:ex: -----  rolling :courier:mission: opFunc  done ---\n');
  scout.close(); //  No  parameters.
  scout.report();

  exInfo('    ==<<==<<==    rolling :packDawo:Mission: done    ==<<==<<==');
  //  When you print row below, you can see all methods.
  //  packDawoMission.
}

///
void lonelySampleChore() {
  exInfo('\n ==>>==>>==   rolling lonelySampleChore    ==>>==>>==');

  ///  Sample lonely Chore, that is created here
  ch.roll();
  ch.box(':app:chore:play:');
  exInfo('    ==<<==<<==    rolling lonelySampleChore: done    ==<<==<<==');
}

///
void sampleDawoBuffers() {
  exInfo('\n ==>>==>>==   rolling sampleDawoBuffers    ==>>==>>==');
  out.outBuffersSizes('dawo_example');
  outBuffersPrint('$dexS dawo_example', 'no-prevent-printing');
  exInfo('    ==<<==<<==    rolling sampleDawoBuffers: done    ==<<==<<==');
}

///
void sampleJsonData() {
  exInfo('\n ==>>==>>==   rolling sampleJsonData    ==>>==>>==');
  exInfo('==>>==>>==   encoded - decoded    ==>>==>>==');
  exInfo('==>>==>>==   chore > effort > user_json render   ==>>==>>===');
  choreToEffortUserJson(':d:ex:');
  exInfo('    ==<<==<<==    encoded - decoded   done    ==<<==<<==');
  exInfo('    ==<<==<<==    rolling sampleJsonData: done    ==<<==<<==');
}

///
void connectorExampleReport() {
  exInfo('==>>==>>==   calling :connector: report    ==>>==>>==');

  connector.report();
  exInfo('    ==<<==<<==    :connector: report done    ==<<==<<==');
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

///  Empty not used method.
void playDawoSrcDart() {}
