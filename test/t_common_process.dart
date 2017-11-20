// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017   dawo version:  0.0.5  6.11.2017


import 'package:dawo/beta.dart';

import 'package:dawo/mis/chore.dart';



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
  renderBeta('Call by  t_common_process.dart:');
  print('............ _lib_test:   next: renderBetaLib................');
}

//
