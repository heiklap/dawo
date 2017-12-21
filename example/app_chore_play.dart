// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  app_chore_play.dart   version:  0.0.6.  27.11.2017
//  hist:  7.9.2017

import 'package:dawo/dawo_app.dart';
import 'package:dawo/rumba.dart';
import 'package:dawo/dev/dawo_dev.dart';
import 'package:dawo/mill.dart';
import 'package:dawo/mis/missions.dart';
import 'package:dawo/mis/camp.dart';

import 'package:dawo/mis/chore.dart';
import 'package:dawo/tools.dart';

//  creating instances of classes in upper level

var mill = new Mill();

var mission = new Mission('mission-class', 'test-in:de-test.dart');

var ch = new CommonChore('chore-class', 'appChorePlay', 'Testing in app-bLib-chore-play');

var dawoApp = new DawoApp(':example ', 'Just rumbaTest.dart');
var rumba = new Rumba();

///  use and show App, dawoFlag, BLib-class and Chore
main() {
  //  choreStuff();
    usualChoreStuff();  //  rumba.dance(dawoApp);  dawoApp.roll();
  //  otherStuff();
  //  2.5 screen output =>

  helsinkiMission.joyChr.roll();
  helsinkiMission.joyChr.box(':app:chore:play:');

  packDawoMission.learnChr.roll();
  packDawoMission.learnChr.box(':app:chore:play:example:');

  dartlangMission.peopleChr.roll();
  dartlangMission.peopleChr.box(':app:chore:play:example:');

  myTimeMission.actChr.roll();
  myTimeMission.actChr.box(':app:chore:play:example:');

  myMusicMission.placeChr.roll();
  myMusicMission.placeChr.box(':app:chore:play:example:');

  nationalParksMission.seasonChr.roll();
  nationalParksMission.seasonChr.box(':app:chore:play:example:');
}


void choreStuff(){
  // using ch Chore
  ch.roll();
  ch.info;
  ch.rowInfo();
  ch.reportList(':app:chore:play:example:');
  print(ch.say);
  ch.opCom();
  ch.opJoint();
  print(ch.st);
}




void usualChoreStuff() {

  String xs = '';
  xs = tl.changeLetter('1234567890', 5, 'x');
  print(xs);
  print('==>>==>>====  app_blib_chore example  ==>>==>>====');
  //  TODO Bug: ALREADY INITIALIZED BUILD CHORE

  rumba.dance(dawoApp);

  //  getting something from classes
  print('da-Info::   $dawoApp.info');
  print('mill-active::  $mill.active');
  print('bLibInfo::  $mission.blInfo');
  print('ch-info::   $ch.info');

  //  building all functionality in function::
  //  otherStuff();

  //  testing dawoAppRoll
  print('==>>==>>====  dawo app roll by: :app-lib-chore-play: ==>>==>>====');

  dawoApp.roll();
  dev.showNotes(':app-lib-chore-play:');
  print('  ==<<==<<====  dawo app rol done :app-lib-chore-play: ==<<==<<===');
}

//  all happens here, just presentation
//  classes are not interacting aso.
void otherStuff() {
  print('==>>==>>====  app_blib_chore example otherStuff ==>>==>>====');
  var dawoHist = new DawoHist(); //  new DawoHist class.
  devHelp..line('dawoAppRoll');
  dawoApp.roll();

  //  get something out of these??
  devHelp.line('appMap, flagMap, appPhase,dawo001');
  dawoHist.appMap; //  just to name it
  millMap; //  from mill.
  dawoHist.appPhaseM;
  dawoHist.dawo003;

  //  mill.render();
  devHelp.line('dawoFlags');
  mill.roll();

  //  wanna more: play them
  //  mill.

  devHelp.line('bLib');

  renderMission(':app:chore:play.dart:');

  scout.open(1, 'X');

  //  Do we have hello-function somewhere?
  void helloAppChorePlay() {
    print('helloAppChorePlay');
  }

  scout.roll(4, helloAppChorePlay);

  scout.close(); //  no parameters.

  //  ch.render();
  devHelp.line('render Chore');
  renderChore();

  print('==<<==<<====  app_blib_chore example otherStuff ==<<==<<====');
}

//
