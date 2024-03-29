// is governed by a BSD-style license that can be found in the LICENSE file.
//  rumba_test.dart.   6.11.2017    dawo version:  0.0.4  16.10.2017
//

import '../lib/alpha/alpha.dart';
import 'package:dawo/dawo_app.dart';

import 'package:dawo/rumba.dart';

///  main method, that plays other functions
void main() {
  playRumbaTest();
  testWordsVisibility();
}

///  smallest possible way to build and run
void playRumbaTest() {
  print('\n -----------  play rumba test  ----------------------');
  dawoApp.init(':play_rumba_test:','Just rumbaTest.dart');

  var rumba = new Rumba();

  // we got buffer here
  rumba.dance(dawoApp);
  print(':bug:  --ruining rumba_test? ');
  out.outBuffersSizes('rumba_test');

  ///  TODO  this is old, what is new?  devBox ?
  //  out.outBuffersPrint('rumba_test', 'Not-called-strange-parameter');
}

void testWordsVisibility() {}
