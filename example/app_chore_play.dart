// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.
///
///  app_chore_play.dart   version:  0.0.6.  27.11.2017
///   hist:  7.9.2017
//

import 'package:dawo/dawo_app.dart';
import 'package:dawo/rumba.dart';
import 'package:dawo/dev/dawo_dev.dart';
import 'package:dawo/gear/gear.dart';
import 'package:dawo/mis/mis.dart';

import '../lib/tools/tools.dart';

//  creating instances of classes in upper level

///  Mill is not functional yet
Mill mill = Mill();

Mission mission = Mission('mission-class', 'test-in:de-test.dart');

///  NOTE:  chore #master field must have name of mission-with-say field.
BlanketChore ch = BlanketChore('chore-class', 'appChorePlay', 'Testing in app-chore-play');

///  Soon (in next version) instance of dawoApp is created inside Dawo
//  Beginning 23.12.2017 instance of DawoApp is created inside package.
//  var dawoApp = new DawoApp(':example ', 'Just rumbaTest.dart');
Rumba rumba = Rumba();

///  use and show App, dawoFlag and Chore
main() {
  dawoApp.init(':app_chore_play:','Testing in app_chore_play' );

  //  choreStuff();
  //  usualChoreStuff();  // including:  rumba.dance(dawoApp);  dawoApp.roll();

  ///  This is independent command, and can run alone.
  //  but it is obligatory / demand for chore.render.
    dawoApp.roll(); //  hklTry

  ///  NOTE:  can this be run independently:  Yes, if :
  ///  master in chore is set to: existing mission with say-field.
  ///  render-function in chore.dart
  renderChore();

  //  sixChoreBox();
  //  otherStuff();
  //  2.5 screen output =>
}



void sixChoreBox() {

  print('-->-->--  6 chore ;roll:box:  -->-->--');
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

  print('--<--<--  6 chore ;roll:box:  done --<--<--');
}


void choreStuff(){
  // using ch Chore
  ch.roll();
  ch.info;
  ch.rowInfo();
  ch.reportList(':app:chore:play:example:');
  print(ch.say);
  ch.popularCom();
  ch.popularJoint();
  print(ch.st);
}




void usualChoreStuff() {

  String xs = '';
  xs = tl.changeLetter('1234567890', 5, 'x');
  print(xs);
  print('==>>==>>====  app_chore_play example  ==>>==>>====');
  //  TODO Bug: ALREADY INITIALIZED BUILD CHORE

  rumba.dance(dawoApp);

  //  getting something from classes
  print('da-Info::   $dawoApp.info');
  print('mill-active::  $mill.active');
  print('Mission_blInfo::  $mission.blInfo');
  print('ch-info::   $ch.info');

  //  building all functionality in function::
  //  otherStuff();

  //  testing dawoAppRoll
  print('==>>==>>====  dawo app roll by: :app-lib-chore-play: ==>>==>>====');

  dawoApp.roll();
  dev.showMemos(':app-lib-chore-play:');
  print('  ==<<==<<====  dawo app rol done :app-lib-chore-play: ==<<==<<===');
}

//  all happens here, just presentation
//  classes are not interacting aso.
void otherStuff() {
  print('==>>==>>====  app_chore_play example otherStuff ==>>==>>====');
  DawoHist dawoHist = DawoHist(); //  new DawoHist class.
  aide..line('dawoAppRoll');
  dawoApp.roll();

  //  get something out of these??
  aide.line('appMap, flagMap, appPhase,dawo001');
  dawoHist.appMap; //  just to name it
  millMap; //  from mill.
  dawoHist.appPhaseM;
  dawoHist.dawo003;

  //  mill.render();
  aide.line('dawoFlags');
  mill.roll();

  //  wanna more: play them
  //  mill.

  aide.line('Other_stuff');

  renderMission(':app:chore:play.dart:');

  scout.open(1, 'X');

  //  Do we have hello-function somewhere?
  void helloAppChorePlay() {
    print('helloAppChorePlay');
  }

  scout.roll(4, helloAppChorePlay);

  scout.close(); //  no parameters.

  //  ch.render();
  aide.line('render Chore');
  renderChore();

  print('==<<==<<====  app_chore_play example otherStuff ==<<==<<====');
}

//
