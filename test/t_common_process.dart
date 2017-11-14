// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017   dawo version:  0.0.5  6.11.2017

import 'package:dawo/dawo.dart';

import 'package:dawo/code_snippets/aldente_func.dart';
import 'package:dawo/code_snippets/bat_loop.dart';
import 'package:dawo/code_snippets/learn_stream_sync.dart';

import 'package:dawo/beta.dart';
import 'package:dawo/alpha.dart';
import 'package:dawo/chore.dart';
import 'package:dawo/effort.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/mill.dart';
import 'package:dawo/missions.dart';
import 'package:dawo/tools.dart';

import 'package:test/test.dart';

void main() {
  print('............ t_common_process  ..................................');
  var ch = new CommonChore('testChoreProcess', 'text process');
  print('............ t_common_process  ..................................');
  ch.buf.writeln(' t_common_process rolling  ');
  print('............ t_common_process  next: ch_roll  ..................');

  ch.roll();
  print('............ t_common_process  ..................................');

  ch.op(ch.placardM);
  print('............ t_common_process  done .............................');
  print(ch.infoS);
  print('............ t_common_process  done All:done  ...................');

  testRenderBetaLib();
}

void testRenderBetaLib() {
  print('............ _lib_test:   next: renderBetaLib................');

  ///  NOTE: This fails, when run under main.
  renderBeta();
  print('............ _lib_test:   next: renderBetaLib................');
}

//
