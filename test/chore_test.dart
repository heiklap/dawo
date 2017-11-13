// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017   dawo version:  0.0.5  6.11.2017

import 'package:dawo/dawo.dart';

import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'package:dawo/base_lib.dart';
import 'package:dawo/base_struct.dart';
import 'package:dawo/chore.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/mill.dart';
import 'package:dawo/missions.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/tools.dart';
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
  packDawoMission.build(':CHR;test:');
  packDawoMission.choreL[0].roll(); //  roll one, first, chore: packDawo.

  // for (var x in packDawoMission.choreL){
  //   x.roll();
  // }

  print('\n ----------  chore-test chores devBox  -------------------------');
  List<String> _al = packDawoMission.choreL[0].reportList(':chore-test:');
  List<String> _bl = packDawoMission.choreL[1].reportList(':chore-test:');
  List<String> _cl = packDawoMission.choreL[2].reportList(':chore-test:');
  List<String> _dl = packDawoMission.choreL[3].reportList(':chore-test:');
  List<String> _el = packDawoMission.choreL[4].reportList(':chore-test:');
  List<String> _fl = packDawoMission.choreL[5].reportList(':chore-test:');
  List<String> _gl = packDawoMission.choreL[6].reportList(':chore-test:');

  devBox('By:CHORE-TEST:', [_al, _bl], 10);
  devBox('By:CHORE-TEST:', [_cl, _dl], 10);
  devBox('By:CHORE-TEST:', [_el, _fl, _gl], 10);
  print('------------  chore-test chores devBox done -------------------- \n');
  devBox('By:CHORE-TEST:', [_cl, _dl, _al, _bl], 10);

  print('---- one more  chore-test chores devBox done ------------------- \n');
  print('............. by test chore  ..........................');
  print(choreBuf.length);
  print(choreBuf);

  print('............. by test chore 2 ..........................');
  String s = choreBuf.toString();
  List _l = [];
  _l.addAll(s.split('build'));
  //  TODO  Is split-method getting right output?  Try different schemas.
  print('\n * * * helloWorld: choreBuf splitted-by-lineChanges  List coming:');
  _l.forEach(print);
  print(_l.length);
  print('............. by test chore 3 ..........................');

  /*
  for (var x = 0; x < packDawoMission.choreL.length; x++) {
    packDawoMission.choreL[x].roll();
  }
  */

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
