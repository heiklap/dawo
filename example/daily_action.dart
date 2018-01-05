// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// ##  Daily:Bundle:  presentation and simulation of dawo events
/// *
/// * HINT:  Run this for one day, by commenting days out;  like  //  friday()
/// * dawo version:  0.0.7. - 18.12.2017  -   devState: 40 %
/// * GitHub:    rows:  550
/// * Connect:  #effort  #Schedule  #Week  #Month  from:  #equ
// * Hist:hkl  27.11.2017  -  0.0.6
//  NEXT:  Construct  auction / bargain in box 16, 140, for say-literals.
//

library dailyBundle;

import 'package:dawo/dawo_app.dart';
import 'package:dawo/shower.dart';

import 'package:dawo/mis/camp.dart';
import 'package:dawo/mis/chore.dart';
//  import 'package:dawo/mis/equipment.dart';
import 'package:dawo/mis/missions.dart';
import 'package:dawo/mis/treaty.dart';

//  import 'package:dawo/corp/bind.dart';
import 'package:dawo/corp/connector.dart';
import 'package:dawo/tools.dart';
import 'package:dawo/src/box_serve.dart';

//  Instance is not created here beginning from 12-2017  0.0.7+
//  DawoApp dawoApp = new DawoApp(':daily:bundle:test:', 'By: :daily:bundle:test:');

///  #FinishLanguege  nippu, kimppu, puntti, nyytti, mytty, paljon rahaa

///
///  TODO  howAbout:
///  TODO  WORD:  daily is 62 times here (word:  20 )  !!  #diurnal

///  Treaty -  15
///  bargain : USE  ONLY IN  16 - 140 box.  3 header in boxServe
///  auction : List<String> auction  in treaty-lib
///  week . 22
///  USE:  period - 0, span - 0,  stretch -    episode -
///  roll :  17  X.
///  change to: revel -16 : hurvitella, rellestää, juhlia, hummailla

var dawoHist = new DawoHist();

///  Choose one existing mission from missionM, like: 'PackDawoMission'
///  Just in case.  Used by vMission,  but  nobody uses it.
Mission pickMission(String _choice) {
  Mission _retMission;
  _retMission = missionM[_choice];
  return _retMission;
}

Map<String, String> weekSayM = {};

List<String> weekSayL = [];

///  Creating instances of Treaty-class for every 5 week day.
///  TODO serialize this with: missionsM
Treaty mondayBundle =
    new Treaty('mondayBundle', 'Monday running', dartlangMission);

///  scout - packDawoMission, short
Treaty tuesdayBundle =
    new Treaty('TuesdayBundle', 'Tuesday running', packDawoMission);

///  myTime,  one screen
Treaty wednesdayBundle =
    new Treaty('WednesdayBundle', 'Wednesday running', myTimeMission);

///  Empty
Treaty thursdayBundle =
    new Treaty('ThursdayBundle', 'Thursday running', helsinkiMission);

///  dawoHist, box, layOut
Treaty fridayBundle =

    ///  Using treaty-class where missions-chores co-operate.
    new Treaty('FridayBundle', 'Friday running', nationalParksMission);

///  PLAN:  5 days collected auction-bilateral data in a box.
///  Usage:  main end.
void weekBox(String caller) {
  treatyBuf.writeln('::buf:  box called for :daily:bundle:  name: ');
  int bufLength = treatyBuf.length;

  ///  Define shapes for week-screen matrix.
  boxServe.init(52, 192, '_'); //  rows, width or: 0 = use default 47, 195
  boxServe.construct(':bargain:week: ', ':daily:bundle:box:week:');

  boxServe.aHeader(0, 80, ' *  dawo  week-marketPlace  * ');

  ///  Make column in middle of the screen.
  ///  Calling from mis/equipment list-table.
  //  not   boxServe.aBox(2,2, 45, 70, equ.allocate(45, 70));
  //  In treaty-class   to run / get    List<String> auction
  boxServe.aBox(2, 2, 45, 70, fridayBundle.auction(45, 70));
  int wRow = 2;
  int wCol = 75;
  //  TODO  This is not material that we want to see in #auction.
  boxServe.aBox(
      wRow, wCol, 20, 25, tl.mapToFineList(mondayBundle.logM, 10, 15));
  wRow = wRow + mondayBundle.logM.length;
  boxServe.aBox(
      wRow, wCol, 20, 25, tl.mapToFineList(tuesdayBundle.logM, 10, 15));
  wRow = wRow + tuesdayBundle.logM.length;
  boxServe.aBox(
      wRow, wCol, 20, 25, tl.mapToFineList(wednesdayBundle.logM, 10, 15));
  wRow = wRow + wednesdayBundle.logM.length;
  boxServe.aBox(
      wRow, wCol, 20, 25, tl.mapToFineList(thursdayBundle.logM, 10, 15));
  wRow = wRow + thursdayBundle.logM.length;
  boxServe.aBox(
      wRow, wCol, 20, 25, tl.mapToFineList(fridayBundle.logM, 10, 15));
  wRow = wRow + fridayBundle.logM.length;

  ///  Present mission say map and other info on right side.
  //  NO  boxServe.aBox(5, 100, 44, 80, tl.mapToFineList(mondayBundle.insider.say,15,45));
  boxServe.aBox(2, 107, 46, 70, weekSayL);

  ///  Save to buffer and print in screen.
  boxServe.show(':box:week:bundle:', 'print', 2);

  ///  Set boxServe ready for next user: clear data.
  boxServe.done(':box:week:bundle:');
} //  -----  weekBox.

///  Main method is starting-point of every Dart application-
void main() {
  dawoApp.init(':dawpApp:daily:bundle:', 'By: :daily:bundle:test:');

  print('----:daily:bundle:  :dawoApp:Roll: start  -----------------------');

  // dawoApp.roll gives quite a long and messy output.
  // but it runs important: _appRollMissions method.
  dawoApp.roll();

  Map<String, String> daInfo1 = {
    '1.  ': 'appRollMissions is mandatory for Mission-Chore system to work,',
    '2.  ': '_appRollMissions(String caller)  !!  private method.',
  };
   List <String> daInfo1L = boxServe.infoBox(daInfo1, 6, 65, 30);
  daInfo1L.forEach(print);
  print(' ');

  Map<String, String> daInfo2 = {
    '1.  ': 'This proves, that dawoApp.appRollMissions is elementary for chores aso.',
    '2.  ': 'But other functionality plays without it.',
    '3.  ': 'Pick Mission from missionM Map with String literal key.',
    '4.  ': 'One of these:     PackDawoMission, HelsinkiMission, DartlangMission,',
    '5.  ': 'MyMusicMission, MyTimeMission, NationalParksMission',
  };

  List <String> daInfo2L = boxServe.infoBox(daInfo2, 6, 70, 40);
  daInfo2L.forEach(print);

  //  variable not used!!
  var wMission = pickMission('PackDawoMission');

  print('------------- :daily:bundle: start  -----------------------');

  ///  Insider = dartlangMission - connector - scout -
  monday(packDawoMission);

  ///  insider = packDawoMission.   scout - packDawoMission, short
  tuesday(dartlangMission);

  /// Insider = myTimeMission,  one screen
  wednesday(nationalParksMission);

  ///  insider =  helsinkiMission     Empty;  myMusicMission
  thursday(myMusicMission);

  ///  nationalParksMission  dawoHist, box, layOut  change it to:
  friday(helsinkiMission);
  print('------------- :daily:bundle: done   -----------------------');

  ///  end-week-procedures, to get material for #auction
  choreEffort(':daily:bundle:week:');
  scheduleBox.roll(':daily:bundle:week:');
  weekBox(':daily:bundle:week:main:');
  print('--------  bilateralM  --------------------');
  List<String> _l = tl.mapToFineList(bilateralM, 15, 40);
  _l.forEach(print);
} //  -----  main

///  Play with mission-op  and connector  courier aso.
///  'mondayBundle', 'Monday running', dartlangMission
///  called with:  packDawoMission, insider = dartlangMission
void monday(Mission _mission) {
  print('---- :day:monday: using: mondayBundle  ------------');
  mondayBundle.logM
      .putIfAbsent('Day monday beginning', () => 'msg: in :daily:work:');

  //  hlTry:  set mission inside class.
  mondayBundle.outsider = _mission;

  _mission.showInfo();
  _mission.report(':daily:Bundle:monday:', true);
  //  Is it reasonable to put these functions inside a class?!
  connector.join('Daily:bundle:Monday:', mondayBundle.placardM,
      ':actMonday:msg:', ':daily:bundle:monday:');
  //  ':daily:Bundle:monday:', ':receiver:all:', ':key:daily:Bundle:monday:', ':da:msg:'
  connector.ping(':daily:Bundle:monday:', ':receiver:all:',
      ':key:daily:Bundle:monday:', ':da:msg:');
  connectorBuf.write('-->>  :daily:Act:monday: connector :opJoin:ping:done  ');
  _mission.report(':monday:', true);
  _mission.learnChr.roll();
  scout.init(2, mondayBundle.dailyCourier);
  scout.open(1, mondayBundle.dailyCourier); //  ??   openThis

  // PLAY:  #courier func
  scout.roll(3, mondayBundle.dailyCourier);
  scout.report();

  //  No access: private!   mondayBundle.init();  mondayBundle.build();
  ///  revel is #roll method in Treaty class
  mondayBundle.revel(':day:monday:', 16, 105, '_');

  ///  eventually revel init /build / handles the next:
  boxServe.init(16, 125, '_');

  ///  2. parameter is String for: glb-buffer.
  boxServe.construct(':daily:bundle:monday:', ':daily:bundle:monday:'); //
  //  add connector or other stuff  stuff
  //  boxServe.aBox(17, 20, _items, _w, __l)
  boxServe.show(':daily:bundle:monday:', 'print', 6);
  boxServe.done(':daily:bundle:monday:test:');

  _mission.actChr.box(':daily:bundle:monday:M:actChr:');

  // ?  do we have connector - boxServe ?  No; but box is.
  ///  At least "at-the-end-of-the-week" we could get enough con-events.
  connector.box('daily:Bundle:monday:');
  mondayBundle.logM
      .putIfAbsent('Day monday done', () => 'msg: in :daily:work:');

  ///   howTo access mission: #outer is here and it and #innera re inTreaty
  ///  Every "day" has it's say to send to weekSayList.
  ///  Objects say-map is modified for list; key-7, value-55 marks
  weekSayL.addAll(tl.mapToFineList(_mission.say, 7, 55));

  ///  NEXT:  boxServe #dartlang
  print('--------- :day:monday:done  ----------------------');
} //  -----  monday

///  #insider is a mission class that is inside Treaty-class.
///  xxxBundle is a Treaty class that has these two mission inside it.
///  Called here with : dartlangMission, insider = packDawoMission
void tuesday(Mission _mission) {
  print('--------- :day:tuesday:---- $_mission.name ------------------');
  tuesdayBundle.logM
      .putIfAbsent('Day tuesday beginning', () => 'msg: in :daily:work:');
  tuesdayBundle.outsider = _mission;
  tuesdayBundle.revel(':day:tuesday:', 16, 105, '_');
  scout.report();

  ///  Report for Mission from parameter.  _ is just for clarity.
  _mission.report(':daily:bundle:test:', true);
  _mission.joyChr.box(':daily:bundle::day:tuesday:');
  tuesdayBundle.logM
      .putIfAbsent('Day tuesday done', () => 'msg: in :daily:work:');
  weekSayL.addAll(tl.mapToFineList(_mission.say, 7, 55));
  print('--------- :day:tuesday:---- $_mission.name done ------------');
} //  -----  tuesday

///  called here with nationalParksMission,  insider = myTimeMission
void wednesday(Mission _mission) {
  print('--------- :day:wednesday: ----------------------');
  wednesdayBundle.logM
      .putIfAbsent('Day wednesday beginning', () => 'msg: in :daily:work:');
  wednesdayBundle.outsider = _mission;

  ///  Using mission directly by it's instance, not by function parameter.
  myTimeMission.showInfo();
  myTimeMission.report(':daily:Bundle:wednesday:', true);
  //  Decide, how reasonable is put these functions inside a class.
  connector.join('Daily:bundle:Wednesday', wednesdayBundle.placardM,
      ':actWednesday:msg:', ':daily:bundle:wednesday:');

  ///
  connector.ping(':daily:Bundle:wednesday:', ':receiver:all:',
      ':key:daily:Bundle:wednesday:', ':da:msg:');
  connectorBuf
      .write('-->>  :daily:Bundle:wednesday: connector :opJoin:ping:done  ');
  myTimeMission.report(':wednesday:', true);

  ///  We can use this mission also via parameter. It is the same instance.
  _mission.learnChr.roll();

  ///  Scout is kind of #joint system.
  ///  #courier is modeling remote process.
  scout.init(2, wednesdayBundle.dailyCourier);
  scout.open(1, wednesdayBundle.dailyCourier); //  ??   openThis

  // PLAY:  #courier func
  scout.roll(3, wednesdayBundle.dailyCourier);
  scout.report();

  ///  :day:Bundle's _init and _build methods are inside #roll = revel.
  wednesdayBundle.revel(':day:wednesday:', 16, 105, '_');

  ///  Make another box directly:
  boxServe.init(16, 105, '_');
  boxServe.construct(':daily:bundle:wednesday:', ':daily:bundle:wednesday:'); //
  //  add connector or other stuff  stuff
  //  boxServe.aBox(17, 20, _items, _w, __l)
  boxServe.show(':daily:bundle:wednesday:', 'print', 6);
  boxServe.done(':daily:bundle:wednesday:test:');

  ///  Maybe at the end of week we get enough connector events.
  connector.box('daily:act:wednesday:');
  _mission.peopleChr.box('daily:Bundle:wednesday:');

  ///  NEXT:  boxServe #myTime
  wednesdayBundle.logM
      .putIfAbsent('Day wednesday done', () => 'msg: in :daily:work:');
  weekSayL.addAll(tl.mapToFineList(_mission.say, 7, 55));
  print('--------- :day:wednesday:done  ----------------------');
} //  -----  wednesday

///  called here with : myMusicMission : insider = helsinkiMission
void thursday(Mission _mission) {
  print('--------- :day:thursday: ---empty-------------------');
  thursdayBundle.logM
      .putIfAbsent('Day thursday beginning', () => 'msg: in :daily:work:');
  thursdayBundle.outsider = _mission;
  //  Two boxes to make output.
  thursdayBundle.revel(':day:thursday:', 16, 125, '_');
  _mission.learnChr.box(':day:thursday:');
  thursdayBundle.logM
      .putIfAbsent('Day thursday done', () => 'msg: in :daily:work:');
  weekSayL.addAll(tl.mapToFineList(_mission.say, 7, 55));
  print('--------- :day:thursday: ---done-------------------');
} //  -----  thursday

///  called here with : helsinkiMission,  insider = nationalParksMission
void friday(Mission _mission) {
  fridayBundle.logM
      .putIfAbsent('Day friday beginning', () => 'msg: in :daily:work:');
  fridayBundle.outsider = _mission;
  print('------ :friday: and :fridayBundle: ------------------------------');
  print('--------- :day:friday:--empty init build revel--------------------');
  //  no: private  fridayBundle.init();

  //  no: private  fridayBundle.build();
  fridayBundle.revel(':day:friday:', 46, 105, '_'); //  dawoApp

  print('--------- :day:friday:--- boxServe-------------------');

  boxServe.init(36, 185, '_');
  boxServe.construct(':connector:day:friday:', ':daily:bundle:Friday:');
  history();

  boxServe.aHeader(16, 20, '* connector joinLog * ');
  boxServe.aBox(17, 20, 18, 50, connector.joinLog);
  boxServe.aHeader(16, 90, '* connector inMsgLog * ');
  boxServe.aBox(17, 85, 18, 50, connector.inMsgL);

  boxServe.aHeader(25, 130, '* connector memberM * ');

  boxServe.aBox(26, 132, 14, 40, tl.mapToListO(connector.joinM));
  //  OK  boxServe.aBox(2, 2, 14, 40, tl.mapToListO(connector.scoutM));
  //OK boxServe.aBox(2, 2, 14, 40, tl.mapToListO(connector.scoutM));

  boxServe.show(':daily:bundle:test:', 'print', 6);
  boxServe.done(':daily:bundle:test:');

  fridayBundle.logM
      .putIfAbsent('Day friday done', () => 'msg: in :daily:work:');

  weekSayL.addAll(tl.mapToFineList(_mission.say, 7, 55));
  print('------ :friday: and :FridayBundle: done  -------------------------');
} //  -----  friday

///  Used on:  friday
void history() {
  ///  Using dawoHist in this presentation, so put data to buffer
  //TODO  ??  dawoHist.init();
  //  ALREADY INITIALIZED BUILD CHORE  in  ChoreBuild

  print('--------- :dawo:hist:build: :day:friday: -------------------');
  dawoHist.build('_emblemString', '_masterString');
  dawoHist.roll();
  dawoHist.buf.writeln(':daily:bundle:friday:');
  print('--------- :dawo:hist:build: :day:friday: done -------------------');

  ///  BaseStruct fields:  boxLayoutDap(BaseStruct _model, String _rubric)
  ///  NOTE: boxLayoutX  in boxServe library.
  boxLayoutDap(dawoHist, ':dawoHist:daily:bundle:friday:');
  //  add connector or other stuff  stuff
}

//
