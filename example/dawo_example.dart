// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dawo/dawo.dart';

///  watch difference, when importing dawo/dawo_src.dart
///  dawo_src only #imports all dawo files except dawo.dart
///  dawo.dart exports: export 'package:dawo/dawo_src.dart';
import 'package:dawo/dawo_src.dart';

// wanna import all of them?
import 'package:dawo/aldente_func.dart';
import 'package:dawo/bat_loop.dart';
import 'package:dawo/dawlib_chore.dart';
import 'package:dawo/dawlib_coll.dart';
import 'package:dawo/dawlib_stream.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/dawo_dev.dart';
import 'package:dawo/dawo_tools.dart';

//

//  create classes::
var da = new DawoApp('exampleApp', 'Testing in dawo_example');
var df = new DawoFlag();
var bLib = new BLib('bLib-class', 'example:dawo_example');
var ch = new SuperChore();

main() {
  var awesome = new Awesome();
  print('awesome: ${awesome.isAwesome}');

  //  play with classes
  /*
  da.
  df.
  bLib.
  ch.
  */

  ///  testing dawo
  //  daw... ok
}


void playDawoSrcDart() {


}
