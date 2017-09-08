// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dawo/dawo.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';

import 'package:dawo/dawlib_chore.dart';

//  dawlib is part of src: so bring dawlib_base via this
import 'package:dawo/dawo_src.dart';

//  THIS DO NOT BRING ALL LIBS WITH IT
//import 'package:dawo/dawo_src.dart';


//  creating instances of classes in upper level
var da = new DawoApp('dawoApp', 'testing in app_bLib_chore play.dart');
var df = new DawoFlag();
var bLib = new BLib('bLib-class', 'test-in:de-test.dart');
var ch = new CommonChore('chore-class', 'Testing in app-bLib-chore-play');

///  use and show App, dawoFlag, BLib-class and Chore
main() {


  //  getting something from classes
  print('da-Info::   $da.info');
  print('df-active::  $df.active');
  print('bLibInfo::  $bLib.blInfo');
  print('ch-info::   $ch.info');


  //  building all functionality in function::
  //  rumba();

  //  testing dawoAppRoll
  print('========  dawo app roll =================');

  da.roll();
  print('========  dawo app roll   done=================');
}

//  all happens here, just presentation
//  classes are not interacting aso.
void rumba(){


  devTestLine('dawoAppRoll');
  da.roll();

  //  get something out of these??
  devTestLine('appMap, flagMap, appPhase,dawo001');
  appMap;
  flagMap;
  appPhase;
  dawo001;

  //  df.render();
  devTestLine('dawoFlags');
  df.roll();

  //  wanna more: play them
  //  df.

  devTestLine('bLib');

  renderBLib();

  bLib.blOpOpen(1, 'X');

  bLib.blOpRoll(4, print('x'));

  bLib.blOpClose(2, print('hello'));

  //  ch.render();
  devTestLine('render Chore');
  renderChore();

  devTestEnd('app-flag-bLib-chore-play');
}

//



