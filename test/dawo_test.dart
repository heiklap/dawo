// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
//  dawo version:  0.0.5  6.11.2017

import 'package:dawo/dawo.dart';

import 'package:dawo/dawo_app.dart';

import 'package:dawo/mis/missions.dart';

import 'package:test/test.dart';

void main() {
  //TODO  error
  var missionH = new Mission('mission inDT', 'test');
  print(missionH.name);

  var appX = new DawoApp('d-app', 'test');
  appX.info; //  string

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
