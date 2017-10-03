// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017   dawo version:  0.0.3  25.9.2017

import 'package:dawo/dawo.dart';

import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'package:dawo/base_lib.dart';
import 'package:dawo/base_struct.dart';
import 'package:dawo/dawlib_chore.dart';
import 'package:dawo/dawlib_coll.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/dawo_mill.dart';
import 'package:dawo/missions.dart';
import 'package:dawo/dawo_tools.dart';
import 'package:dawo/rumba.dart';

import 'package:test/test.dart';

void main() {
  //  choose test:  chore or rumba
  //  testChore();
  //  testRumba();


  testPackDawoChore();
}

void testChore() {
  print('==>>==>>==== ch_chore test commonChore roll ==>>==>>==== ');
  var ch = new CommonChore('test-chore', 'test-chore-info');
  ch.buf.writeln('hello world');

  print('\n -----------  clay List test  ----------------------');

  ch.roll();

  print(ch.buf);
  print('  ==<<==<<==== ch_chore test commonChore roll done  ==<<==<<==== ');
}

///  Question: do we have access to PackDawo class without imports?
void testPackDawoChore() {
  print('==>>==>>==== ch_chore test packDawoChore roll ==>>==>>==== ');

  //  PackDawo;  //  no access it all goes via: mission
  //  print(packDawoMission.choreL); //  List is empty.


  //  Should first run packDawoMission.build.

  /// :ASK: for clause can not look inside Class.
  /// for(var x in packDawoMission.choreL) {

  ///  Must #build class, to get chores in place.
  packDawoMission.build();
  for (var x = 0; x < packDawoMission.choreL.length; x++) {
    packDawoMission.choreL[x].roll();
  }
  print('  ==<<==<<==== ch_chore test packDawoChore roll done ==<<==<<==== ');
}

void testRumba() {
  print('\n ==>>==>>==== ch_chore test test_rumba ==>>==>>==== ');
  var dawoApp = new DawoApp('dawoApp-test-Rumba', 'Just choreTest.dart');

  var rumba = new Rumba();
  rumba.dance(dawoApp);
  dev.showNotes(':chore-test:');
  print('  ==<<==<<==== ch_chore test : testRumba done ==<<==<<==== ');
}
