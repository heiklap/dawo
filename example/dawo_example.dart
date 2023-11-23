// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
///  *  dawo_example   dawo version:   1.1.0.  23.11.2023.
///  *  dawo_example creates 45 screens of console output data presentation.
///  *               28 was previous output, so may be some repetition.
///  * Find:  :con: :connector: :opCom:  :corporate:
///  * DONE:  make this inside class

///  watch difference, when importing dawo/dawo_src.dart
///  dawo_src only #imports all dawo files except dawo.dart
///  dawo.dart exports: export 'package:dawo/dawo_src.dart';

///
///   hklTry  NOT    import 'package:dawo/dawo.dart';

import 'package:dawo/alpha/alpha.dart';
import 'package:dawo/beta/beta.dart';

import 'package:dawo/corp/corp.dart';
import 'package:dawo/dev/dawo_dev.dart';
//  import 'package:dawo/mis/camp.dart';

import 'package:dawo/gear/gear.dart';

import 'package:dawo/mis/mis.dart';
import 'package:dawo/tools/tools.dart';
import 'package:dawo/venue/venue.dart';

import 'package:dawo/dawo_app.dart';
import 'package:dawo/rumba.dart';

import 'package:dawo/dawo_src.dart';


//  Unused package is marked with grey, and #warning.
//  import 'package:dawo/mill.dart';

//  You can use any name for classes, that you create:
//  var da = new DawoApp('exampleApp', 'Testing in dawo_example');

/// Mill class is planned to be method runner / scheduler of dawo.
//  var mill = new Mill();

//  Example, how extra instance of mission is created:
//  var missionX = new Mission('Mission-class', 'example:dawo_example');

///  Made by Google Stagehand automatically, when creating a new package.
///  This serves as an example of class, and user can develop it further.
///  (When you try code below, you can see 6 properties of awesome class.)
///  You can develop this class further in it's own folder.
Awesome awesome = Awesome();

///  Used once here to run method roll()
///  2. parameter must be class with name and say properties
BlanketChore ch =
    BlanketChore('ChoreInDawoExample', 'myMusicMission', 'Test-Chore');

//  create classes, that do not already have an instance inside dawo::
//  Instance is not created here beginning from 12-2017  0.0.7+
//  var dawoApp = new DawoApp(':play-rumba-test:dawoApp',
//    'By: dawo_example.dart: dawoApp rolls missions');
Rumba rumba = Rumba();

///  Local variables for this presentation.
bool _pB = true; //  Boolean value used to control printing.
String dexS = ':d:ex:'; //  Prefix for print messages and easy find.
int dexC = 0; //  counter for activities in this example.

///  Form  message row to easy-find and print it if: _pB
///  Callers:   21 x
void exInfo(String msg) {
  dexC++;
  String dexCS = dexC.toString();
  //  String: -exInfo appended here, as an example. It is 16 times in output.
  String _msg = ' -exInfo $dexS $dexCS $msg';
  if (_pB) print(_msg);
} //     -----     exInfo

///
//-  Make this a class
class ExPlay {
  String connectorMsg = ':ORDER of :OUTER process is :ANY KIND ';

  ///  Data fields:
  ///  Information of #user for :con:  :opCom: and :corporate:
  Map<String, String> placardM = {
    'actor': 'D-example',
    'sender': 'Dawo example',
    'receiver': 'D-ex-loops',
    'command': 'D-ex-cmd:',
    'msg': 'D-ex-msg:',
  };

  ///  copied to dawo-dev_box.dart
  void glbAndDevBox() {
    glb.dawoLogo.forEach(print);
    devBox(':d:ex:main:', ['* header *', '* footer *'],
        [glb.keyWords, glb.keyWordsSmall], 28);
    devBox(
        'By:dev:versions:',
        ['* header *', '* footer *'],
        [
          tl.mapToFineList(dev.later, 75, 20),
          tl.mapToFineList(dev.version008, 75, 20)
        ],
        24);
    devBox(
        'By:dev:versions:',
        ['* header *', '* footer *'],
        [
          tl.mapToFineList(dev.plugins, 75, 20),
          tl.mapToFineList(dev.version0075, 75, 20)
        ],
        24);
    print(':glb:print:states:  set to false. only :buf: used');
    print(glb.prSt);
    print('-- Change print status: glb.setGlbPrint(true or false) ------');
    glb.box(dexS);
  } //     -----     glbAndDevBox

  ///  Dawo history play and box
  ///  Caller: main
  void boxHistTemplate() {
    print('---------- :boxServe:dawoLogo: :temporary:hack:   ----------------');
    DawoHist dawoHist = DawoHist();
    dawoHist.init();
    dawoHist.build('_emblemString', '_masterString');
    dawoHist.roll();
    dawoHist.buf.writeln(':dawoHist:template:');

    ///  TODO  hosTo handle:  in boxServe there are:  title and footer.
    ///  Table name and glb.buffer name
    //  boxServe.construct(':dHst:dAc:tmpl:', ':dawoHist:template:');
    ///  BaseStruct fields:  boxLayoutDap(BaseStruct _model, String _rubric)
    //  TODO  0.9.6.  boxLayoutDap(dawoHist, ':dawoHist:template:');
    dawoHist.box('dawo:example'); //  2022.4.2.

  } //     -----      boxHistTemplate

  ///  :box:statistics: in glb
  void glbBoxShow() {
    packDawoMission.joyChr.box(':dawoExample:call:joyChr:box:');
    print('> > >  :box:statistics:     :glb:boxServe:buf: length and names  > > >');
    print(glb.boxServeBuffers.length);
    for (var z in glb.boxServeBuffers.keys) {
      //  howTo NULL
      //  The property 'length' can't be unconditionally accessed because
      //  the receiver can be 'null'.
      //  Try making the access conditional (using '?.') or adding a null check
      //  to the target ('!').
      //  hklTry: NULL  OK  with .?
      print(glb.boxServeBuffers[z]?.length);
      print(z);
    }  //  for
    print('< < <    :box:statistics:     :glb:boxServe:buf: length and names < < < ');
    //  glb.boxServeBuffers.keys.forEach(print);
  }      //     -----     glbBoxShow

  //
  void infoBoxPlay() {
    //  testing infoBox in boxServe
    //  infoBox(Map<String,String> inM, int _k, _v, [int margin]){
    //  using:  dawoApp.say.
    /// NOTE  all Map to List rows, here 8, are printed.
    /// hklTry:   create List first
    ///
    List<String> infoOne = [];
    //  List<String> infoOne = boxServe.infoBox(dawoApp.say, 8, 57, 9);
    infoOne.addAll(infoBox(dawoApp.say, 8, 57, 9)); //  ;

    infoOne.forEach(print);
    //   packDawoMission.say
    print('----  second info box  ----');
    List<String> infoTwo = infoBox(packDawoMission.say, 8, 40, 19);
    infoTwo.forEach(print);
    //  TODO  out.done
  } //     -----     infoBoxPlay

  ///
  void bufferPlay() {
    ///  Nice-looking name- size- info of default buffers.
    Map<String, String> _xM = Map();
    _xM = outBuffersInfoMap(':dawoExample', 'Not used parameeter');
    print('....... printing outBufMap map  ....................');
    _xM.forEach((k, v) {
      print('$k $v');
    });
    print(tl.mapToFineList(_xM, 20, 20));
    print('....... printing outBufMap map  done ....................');
  }

  //
  void boxServePlay() {
    print('....... printing boxServe logM print  ....................');
    // unused::  Map<String, List<String>> _logM = {};
    for (var x in boxServe.logM.keys) {
      print(x);
      print(boxServe.logM[x]);
    }
    print('....... printing boxServe logM print  done ....................');
  }

  ///  To allow easy-run of these 8 separated activities.
  ///  Caller:  main
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
  } //     -----     exampleMethodsPlay

  ///  All connector activity is marked with: :connector: in output.
  ///  Later:  connectorOp(dexS); //  function below.
  ///  Place where :corporate:  :opCom:  and :connector: play together.
  ///  caller:   main 1
  void connectorOp(String caller) {
    connector.join('DawoExample', placardM, connectorMsg, ':Dawo:example:');
    connector.roll();
    connector.box(':d:ex:');
  } //     -----     connectorOp

//  TODO  #IDEA: for courier carrier, to do something really nice.
//  :courier: marks this message carriage functions activity.
  void courierMessage() => print('d-ex-exmpl: * *  :courier: Mission!. * * ');

  ///  This class instance has been created in dawo, and it is usable here.
  ///  caller:  exampleMethodsPlay
  void exampleMission() {
    exInfo(' ==<<==<<==    roll mission op/ init -open - roll: -close==<<==');
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
  } //     -----     exampleMission

  ///  Caller:  Example Methods Play
  void lonelySampleChore() {
    exInfo('\n ==>>==>>==   rolling lonelySampleChore    ==>>==>>==');

    ///  Sample lonely Chore, that is created here
    ch.roll();

    ///  TODO  This chore do not have master field set.
    ch.master = 'MyMusicMission';
    ch.box(':app:chore:play:');
    exInfo('    ==<<==<<==    rolling lonelySampleChore: done    ==<<==<<==');
  } //     -----     lonelySampleChore

  ///  Caller   ExampleMethodsPlay
  void sampleDawoBuffers() {
    exInfo('\n ==>>==>>==   rolling sampleDawoBuffers    ==>>==>>==');
    out.outBuffersSizes(':dawoExample:');
    outBuffersPrint('$dexS dawoExample', 'no-prevent-printing');
    exInfo('    ==<<==<<==    rolling sampleDawoBuffers: done    ==<<==<<==');
  } //     -----     sampleDawoBuffers

  ///  Caller:  ExampleMethodsPlay
  void sampleJsonData() {
    exInfo('\n ==>>==>>==   rolling sampleJsonData    ==>>==>>==');
    exInfo('==>>==>>==   encoded - decoded    ==>>==>>==');
    exInfo('==>>==>>==   chore > effort > user_json render   ==>>==>>===');
    choreToEffortUserJson(':d:ex:');
    exInfo('    ==<<==<<==    encoded - decoded   done    ==<<==<<==');
    exInfo('    ==<<==<<==    rolling sampleJsonData: done    ==<<==<<==');
  } //     -----     sampleJsonData

  ///  Calller:  ExampleMethodsPlay
  void connectorExampleReport() {
    exInfo('==>>==>>==   calling :connector: report    ==>>==>>==');

    connector.report();
    exInfo('    ==<<==<<==    :connector: report done    ==<<==<<==');
  } //     -----     connectorExampleReport

} //     -----     ExPlay

ExPlay exPlay = ExPlay();

///  caller: main here     usage:
///  Last method in main
void mxxPlay() {
  String mxChainSSample = ':97531mx13579:';
  String mxChainS = ':97531 mx1 3579:';
  store.callMxx('dawo:ex:');

  camp.callMxx('dawo:ex:');

  affair.actMxx('dawo:ex:');

  corporate.actMxx('from:dawo:ex:');
  ///  Show all mixin data
  //  previous out:   mxC.mxBossBox('from:dawo_example:');
  //  call to venue mixin_box   function
  mxBossBox('from:dawo_example:');
}


///  For version: 0.5.0, class ExPlay keeps methods in easy, visual form.
///  In dawo package there is no main-function. Only in example files.
///  Every dart program starts it's execution from main method.
main() {
  var sw = Stopwatch()..start();
  DateTime start = DateTime.now();
  dawoApp.init(':dawo_example:', 'Testing in dawo_example');
  exInfo('==>>==>>==   dawo_example  awesome: ${awesome.isAwesome}');
  awesome.motto; //  just to name it
  exInfo('==>>==>>==   dawo_example  glbAndDevBox  ==>>==>>== ');
  exPlay.glbAndDevBox();

  ///  Call function that adds #actor and #count to this String and prints it.
  exInfo('==>>==>>==   dawo_example rumba.dance-dawoApp   ==>>==>>==');
  // This method also returns a StringBuffer, that is not used here.
  rumba.dance(dawoApp); //  23 screens of output.

  exPlay.exampleMethodsPlay(); //  Add more 13 screens output.
  //  Class Bind keeps and handles message-based bindings between objects.
  bind.report('$dexS');

  exInfo('==>>==>>==   dawo_example calling :connector:    ==>>==>>==');
  exPlay.connectorOp(dexS);
  exInfo('    ==<<==<<==    dawo_example done  connector:  ==<<==<<==');

  exPlay.boxHistTemplate();
  exPlay.glbBoxShow();
  exPlay.infoBoxPlay();
  exPlay.bufferPlay();

  dawoApp.box(dexS); //  3. time here-

  print("Executing dawo_example.dart took: ${sw.elapsed}us");
  DateTime stop = DateTime.now();
  print(' \nStopTime::  $stop');
  print(stop.difference(start));
  print('FlowServe calls::   $flowI ');
  glb.boxStatsShow(':by:dawoExample');
  glb.devBoxStatsShow(':by:dawoExample');
  //print buffer: print(glb.boxServeBuffers[':dawoHist:dailyAction:friday:6']);
  mxxPlay();
  print('---- main done   ');
} //     -----     end of main.

///  For to check variables visibility.
///  Caller:    Not used
void wordPlayUnUsed() {
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
} //     -----     wordPlay

///  Empty not used method.
void playDawoSrcDartUnUsed() {}
