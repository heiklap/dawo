// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dawo/dawo.dart';

import 'package:dawo/dawo_mission.dart';
import 'package:dawo/mis.dart';
import 'package:dawo/dawo_app.dart';

/* wanna import all of them?
import 'package:dawo/aldente_func.dart';
import 'package:dawo/bat_loop.dart';
import 'package:dawo/dawlib_chore.dart';
import 'package:dawo/dawlib_coll.dart';
import 'package:dawo/dawlib_stream.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/dawo_tools.dart';


*/


import 'package:test/test.dart';



void main() {
  //TODO  error
    var missionH = new Mission('mission inDT', 'test');
    var misJ = new Mis();
  var appX = new DawoApp('d-app', 'test');


  group('A group of tests', () {
    Awesome awesome;

    setUp(() {
      awesome = new Awesome();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
  print('--  some variables  --');

  //  error in library building; away temporarily
  //  devTestPhase;

  print('--  test done  --');

  renderDawo();
}
