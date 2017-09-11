// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  app_lib_chore_play.dart   version 0.0.2  11.9.2017

import 'package:dawo/dawo.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/dawo_mill.dart';
import 'package:dawo/dawo_mission.dart';

import 'package:dawo/dawlib_chore.dart';

//  dawlib is part of src: so bring dawlib_base via this
import 'package:dawo/dawo_src.dart';

//  THIS DO NOT BRING ALL LIBS WITH IT
//import 'package:dawo/dawo_src.dart';


//  creating instances of classes in upper level
var da = new DawoApp('dawoApp', 'testing in app_bLib_chore play.dart');
var df = new DawoMill();

var mission = new Mission('mission-class', 'test-in:de-test.dart');

var ch = new CommonChore('chore-class', 'Testing in app-bLib-chore-play');

///  create instance of DevTest class
var dt = new DevTest();

///  use and show App, dawoFlag, BLib-class and Chore
main() {


  //  getting something from classes
  print('da-Info::   $da.info');
  print('df-active::  $df.active');
  print('bLibInfo::  $mission.blInfo');
  print('ch-info::   $ch.info');


  //  building all functionality in function::
    rumba();

  //  testing dawoAppRoll
  print('========  dawo app roll =================');

  da.roll();
  print('========  dawo app roll   done=================');
}

//  all happens here, just presentation
//  classes are not interacting aso.
void rumba(){


  dt.devTestLine('dawoAppRoll');
  da.roll();

  //  get something out of these??
  dt.devTestLine('appMap, flagMap, appPhase,dawo001');
  appMap;
  millMap;
  appPhaseM;
  dawo002M;

  //  df.render();
  dt.devTestLine('dawoFlags');
  df.roll();

  //  wanna more: play them
  //  df.

  dt.devTestLine('bLib');

  renderMission();

  mission.opOpen(1, 'X');

  mission.opRoll(4, print('x'));

  mission.opClose(2, print('hello'));

  //  ch.render();
  dt.devTestLine('render Chore');
  renderChore();

  dt.devTestEnd('app-flag-bLib-chore-play');
}

//



