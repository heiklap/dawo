// is governed by a BSD-style license that can be found in the LICENSE file.
//  t_common_process.dart  12.9.2017



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
  rumba.dance(dawoApp);


}

void testWordsVisibility() {


}