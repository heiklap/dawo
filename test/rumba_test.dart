// is governed by a BSD-style license that can be found in the LICENSE file.
//  rumba_test.dart.   12.9.2017    dawo version:  0.0.3  25.9.2017
//



import 'package:dawo/base_struct.dart';
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
  var dawoApp = new DawoApp(':play-rumba-test', 'Just rumbaTest.dart');

  var rumba = new Rumba();

  // we got buffer here
  rumba.dance(dawoApp);

  outBuffersSizes('rumba_test');
  outBuffersPrint('rumba_test', 'Not-called-strange-parameter');

}

void testWordsVisibility() {}
