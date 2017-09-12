// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017


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
import 'package:dawo/dawo_mission.dart';
import 'package:dawo/dawo_tools.dart';

import 'package:test/test.dart';



void main() {
  print('............ t_common_process  ..................................');
  var ch = new CommonChore('test-chore', 'test-chore-info');
  ch.buf.writeln('hello world');

  print(ch.buf);




}