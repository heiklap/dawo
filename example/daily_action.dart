// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  DailyAction  simulation of dawo events
///  * QUEST:  howTo use and name dailyAct class.
///  * HINT:  Run this for one day by commenting days out;  like  //  friday()
/// * dawo version:  0.0.6.  -  27.11.2017  -   devState: 0 %
/// * GitHub:
/// * Connect:  #Schedule  #Week  #Month  from:  #equ
// * Hist:hkl  27.11.2017  -  0.0.6
//  NEXT:  :BUB:DEBUG:  in friday..  sw  range error..  175

library dailyAction;

import 'package:dawo/alpha.dart';
import 'package:dawo/beta.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/rumba.dart';

import 'package:dawo/mis/chore.dart';
import 'package:dawo/mis/missions.dart';

import 'package:dawo/corp/bind.dart';
import 'package:dawo/corp/connector.dart';
import 'package:dawo/tools.dart';
import 'package:dawo/src/box_serve.dart';

DawoApp dawoApp = new DawoApp(':dailyAction:test:', 'By: :dailyAction:test:');
var dawoHist = new DawoHist();

StringBuffer dailyBuf = new StringBuffer();

///  QUEST:  HowTo efficiently use this DailyAction class to run dawo-roll?
///  TODO  Tie equ.week and month to get #TimeSchedule
///  TODO  Word:  too much "act"  here, use different term
///  - effect, impact,   doing!!
class DailyAction {
  String name = 'dailyAction';

  ///  Present info for outer process calls.
  Map<String, String> placardM = {
    'actor': 'DailyAct',
    'sender': '_dailyAction:dayX:',
    'receiver': '',
    'command': ':dAct:com:',
    'msg': 'dAct-msg:',
  };

  ///  Used as playBack.
  void dailyCourier() {
    print('::daily:courier::  from :dailyAction:');
  }

  ///
  void _init(int rows, sw, String pM) {
    // boxServe.init(16, 125, '_');
    print('    ----     :dailyAction:method:init:');
  }

  ///  parameter String _job
  void _build() {
    // boxServe.construct(':dailyAction:monday:'); //
    print('    ----     :dailyAction:method:build:');
  }

  ///  rows, screenWidth, padMark
  void roll(String _job, int rows, sw, String pM) {
    print('    ----     :dailyAction:method:roll:');
    //  Mediate parameters
    _init(rows, sw, pM);
    _build();
    print('    ----     :dailyAction:method:roll:ownStuff:');

    ///  call to days job
    //  monday...   aso.
    _show();
    _done();
  }

  ///  boxServe()
  void _show() {
    // boxServe.show(':dailyAction:monday:', 'print');
    print('    ----     :dailyAction:method:show:');
  }

  void _done() {
    // boxServe.done(':dailyAction:monday:test:');
    print('    ----     :dailyAction:method:done:');
  }
}

DailyAction mondayAct = new DailyAction();
DailyAction tuesdayAct = new DailyAction();
DailyAction wednesdayAct = new DailyAction();
DailyAction thursdayAct = new DailyAction();
DailyAction fridayAct = new DailyAction();

///
void main() {
  print('------------- :dawoApp:Roll: start  -----------------------');
  //  this proves, that dawoApp.appRollMissions is elementary for chores aso.
  //  But other functionality plays without it.

  //  NO need: next do it.  dawoApp.appRollMissions(':dailyAction:test:');
  ///  gives too long and messy output.
  dawoApp.roll();
  print('------------- :dailyAction: start  -----------------------');
      monday();
      tuesday();
      wednesday();
      thursday();
    friday();
}

///  Play with mission-op  and connector  courier aso.
void monday() {
  print('--------- :day:monday: ----------------------');
  dartlangMission.showInfo();
  dartlangMission.report(':dailyAct:monday:', true);
  //  Decide, how reasonable is put these functions inside a class.
  connector.scoutJoin(
      mondayAct.placardM, ':actMonday:msg:', ':dailyAction:monday:');
  //  ':dailyAct:monday:', ':receiver:all:', ':key:dailyAct:monday:', ':da:msg:'
  connector.ping(':dailyAct:monday:', ':receiver:all:', ':key:dailyAct:monday:',
      ':da:msg:');
  connectorBuf.write('-->>  :dailyAct:monday: connector :opJoin:ping:done  ');
  dartlangMission.report(':monday:', true);
  dartlangMission.learnChr.roll();
  dartlangMission.scoutInit(2, mondayAct.dailyCourier);
  dartlangMission.scoutOpen(1, mondayAct.dailyCourier); //  ??   openThis

  // PLAY:  #courier func
  dartlangMission.scoutRoll(3, mondayAct.dailyCourier);
  dartlangMission.scoutReport();
  //  not visible  corporate.
  //  No: private   mondayAct.init();
  //  no: private  mondayAct.build();
  //  dawoApp:
  mondayAct.roll(':day:monday:', 16, 125, '_');

  ///  eventually roll init /build / handles the next:
  boxServe.init(16, 125, '_');
  ///  2 parameter is glb-buffer
  boxServe.construct(':dailyAction:monday:', ':dailyAction:monday:'); //

  //  add connector or other stuff  stuff
  //  boxServe.aBox(17, 20, _items, _w, __l)

  boxServe.show(':dailyAction:monday:', 'print');
  boxServe.done(':dailyAction:monday:test:');
  // ?  do we have connector - boxServe ?  No; but box is.
  ///  Agt least "at-the-end-of-the-week" we could get enough con-events.
  connector.box('dailyAct:monday:');

  ///  NEXT:  boxServe #dartlang
  print('--------- :day:monday:done  ----------------------');
}

///
void tuesday() {
  print('--------- :day:tuesday:---- helsinkiMission------------------');
  helsinkiMission.scoutReport();
  packDawoMission.report(':dailyAction:test:', false);
}

///
void wednesday() {
  print('--------- :day:wednesday: ----------------------');
  myTimeMission.showInfo();
  myTimeMission.report(':dailyAct:wednesday:', true);
  //  Decide, how reasonable is put these functions inside a class.
  connector.scoutJoin(
      wednesdayAct.placardM, ':actWednesday:msg:', ':dailyAction:wednesday:');
  //  ':dailyAct:wednesday:', ':receiver:all:', ':key:dailyAct:wednesday:', ':da:msg:'
  connector.ping(':dailyAct:wednesday:', ':receiver:all:', ':key:dailyAct:wednesday:',
      ':da:msg:');
  connectorBuf.write('-->>  :dailyAct:wednesday: connector :opJoin:ping:done  ');
  myTimeMission.report(':wednesday:', true);
  myTimeMission.learnChr.roll();
  myTimeMission.scoutInit(2, wednesdayAct.dailyCourier);
  myTimeMission.scoutOpen(1, wednesdayAct.dailyCourier); //  ??   openThis

  // PLAY:  #courier func
  myTimeMission.scoutRoll(3, wednesdayAct.dailyCourier);
  myTimeMission.scoutReport();
  //  not visible  corporate.
  //  No: private   wednesdayAct.init();
  //  no: private  wednesdayAct.build();
  //  dawoApp:
  wednesdayAct.roll(':day:wednesday:', 16, 125, '_');

  ///  eventually roll init /build / handles the next:
  boxServe.init(16, 125, '_');
  boxServe.construct(':dailyAction:wednesday:', ':dailyAction:wednesday:'); //

  //  add connector or other stuff  stuff
  //  boxServe.aBox(17, 20, _items, _w, __l)

  boxServe.show(':dailyAction:wednesday:', 'print');
  boxServe.done(':dailyAction:wednesday:test:');
  // ?  do we have connector - boxServe ?  No; but box is.
  ///  At least "at-the-end-of-the-week" we could get enough con-events.
  connector.box('dailyAct:wednesday:');

  ///  NEXT:  boxServe #myTime
  print('--------- :day:wednesday:done  ----------------------');
}

///
void thursday() {
  print('--------- :day:thursdayday:---empty-------------------');
}

///  Playing new DawoHist class in #template #boxLayoutX in boxServe library.
void friday() {
  print('------ :friday: and :fridayAct: ------------------------------');
  print('--------- :day:friday:--empty init build roll--------------------');
  //  no: private  fridayAct.init();

  //  no: private  fridayAct.build();
  fridayAct.roll(':dailyAction:friday:', 36, 175, '_'); //  dawoApp

  print('--------- :day:friday:--- boxServe-------------------');

  ///  Using dawoHist in this presentation, so put data to buffer
  //TODO  ??  dawoHist.init();
  //  ALREADY INITIALIZED BUILD CHORE  in  ChoreBuild

  print('--------- :dawo:hist:build: :day:friday: -------------------');
  dawoHist.build('_emblemString', '_masterString');
  dawoHist.roll();
  dawoHist.buf.writeln(':dailyAction:friday:');
  print('--------- :dawo:hist:build: :day:friday: done -------------------');

  //  :BUG:  hklTry:  195  boxServe.init(36, 175, '_');
  //  :BUG:DEBUG:  175..  try:  195
  boxServe.init(36, 175, '_');
  boxServe.construct(':dawoHist:dailyAction:friday:', ':dailyAction:Friday:');

  ///  BaseStruct fields:  boxLayoutDap(BaseStruct _model, String _rubric)
  ///  NOTE: boxLayoutX  in boxServe library.
  boxLayoutDap(dawoHist, ':dawoHist:dailyAction:friday:');
  //  add connector or other stuff  stuff
  boxServe.aHeader(16, 20, '* connector joinLog * ');
  boxServe.aBox(17, 20, 18, 50, connector.joinLog);
  boxServe.aHeader(16, 90, '* connector inMsgLog * ');
  boxServe.aBox(17, 85, 18, 50, connector.inMsgL);


  //  :BUB:DEBUG:
  // RANGE ERROR!! boxServe.aBox(17, 138, 14, 40, tl.mapToListO(connector.scoutM));
  // RANGE ERROR! boxServe.aBox(17, 138, 14, 40, tl.mapToListO(connector.scoutM));
  ///  16, 130..  hklTry add both..
  boxServe.aHeader(25, 130, '* connector memberM * ');
  // "30,142" = 2 errors               134 brings error
  //  boxServe.aBox(30,142, 14, 40, tl.mapToListO(connector.scoutM));
  boxServe.aBox(26,132, 14, 40, tl.mapToListO(connector.scoutM));
  //  OK  boxServe.aBox(2, 2, 14, 40, tl.mapToListO(connector.scoutM));
 //OK boxServe.aBox(2, 2, 14, 40, tl.mapToListO(connector.scoutM));

  boxServe.show(':dailyAction:test:', 'print');
  boxServe.done(':dailyAction:test:');
  print('------ :friday: and :fridayAct: done  -------------------------');
}
