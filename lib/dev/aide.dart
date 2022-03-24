// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  aide,  helper class is a developer tool.
///  Primary functionality:  Help in developing.
/// * dawo version:   0.3.0.  23.3.2022.
/// * devState : 10%    in GitHub : yes
/// * variables tf & rf seems to bee acronyms for: testFunction & runFunction
///  hist>  9.1.2018  Separated from dawoApp.
//

//  TODO  handle tf and rf variables:  10 x

part of dawo_dev.dart;

///  Helper class, previous name; devHelp
class Aide {
  //  TODO  Aide Constructor: add constructor: (String user, String x)

  /// For future use:  map for testing  dev. #NotUsed
  Map<String, String> normMap = {
    'dawo': 'coding dawo',
    'rest': 'coffee Time',
    'dawoColl': 'W O R K..ing hours',
    'dawoEngine': 'riding home'
  };

  ///  Function for to print devTestMap.  Looks funny :)
  void normMapShow() {
    print(' \n ------------>>-->>-- aide norms  ------------>>-->>--');
    //  Using here new Tools, tl class.
    normMap.forEach(tl.printSS); //  from tools.dart
    print(' \n --<<--<<------------ aide norms  --<<--<<------------');
  }

//  TODO  teamDev: PLAN:  make all 6 tests use same name with
//         parameters: Test, Msg, Line, Begin, End, Return

  ///  TODO  teamDev:   Should this be named to devTestInfo ??  devInfo ??
  ///  report testers info
  num devTest(String unit, String whoDoneThis) {
    if (dev.devTestPhase) {
      DateTime now = new DateTime.now();
      String _s30 = '                              ';
      print('$_s30  DEVELOPMENT TEST --------------------------------------');
      print('$_s30  Testing $unit  Test n:o:  $dev.devTestCount');
      print('$_s30  Tester:  $whoDoneThis');
      print('$_s30  dev test ended    Time: $now ');
      print('');

      //  TODO  aSync stream     devTestStream.
      //  NOTE: Dubious to use dev-class here?
      dev.devTestCount++;
    }
    return dev.devTestCount;
  }

  ///  NOTE  team-team   developers can send messages to each others in test printings
  ///  Simple message to track run and development
  devMsg(String unit, String whoDoneThis) {
    if (dev.devTestPhase) {
      DateTime now = new DateTime.now();
      String _s30 = '                              ';
      print('$_s30  Developers message -----------------------------------');
      print('$_s30  Testing:  $unit Tester:  $whoDoneThis  ');
      print('$_s30  dev msg over:    Time: $now ');
      print('');
    }
  }

  ///  This is (messy) function that is used to run other function in tests
  ///  it is called:     tf(testSomething);
  ///  Problems:   null method do not have... call
  void tf(var rf) {
    String _s = rf;
    var _sType = rf.runtimeType;

  //  TODO  Function  getter  There is no such getter 'runTimeType' in 'Function'
  //  String _sRunTimeType = rf..runTimeType;    //.runTimeType;

    print('b  b  b  b  b  b  b  b  b  b  b  b  b     Beginning:   $_s');
    rf();
    print('runtime type:   $_sType');
    print('e  e  e  e  e  e  e  e  e  e  e  e  e  e   End of +   $_s');
    print('');
  }

  //  TODO  teamDev  Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  Dynamic-parameter-function, that is used to run other function in tests.
  ///  It is  called:     tfDyn(testSomething);
  ///  TODO  Check these String / type errors.
  void tfDyn(String rf()) {
    //A value of type 'toString' cannot be assigned to a variable of type 'String'
    String _s = rf();

    //  howTo get runtime type of function rf()?
    //  String _sType = rf.runTimeType();
    //TODO
    //  There is no such getter 'runTimeType' in 'Function'
    //  String _sRunTimeType = rf..runTimeType;    //.runTimeType;
    print('------------>>-->>--    Beginning:   $_s');
    //  print(_sType);
    rf();
    print('--<<--<<------------    End of test  \n');
  }

  /// TODO  teamDev Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  Present simple message while testing.
  void line(String module) {
    print('------------>>-->>--     Beginning:  $module ');
    print('');
  }

  ///  Present simple DONE message after all tests are done.
  void done(String module) {
    print('--<<--<<------------    $module --<<--<<------------');
    print('All tests done  \n');
  }

  ///  Notate single test end.
  void end(String module) {
    print('--<<--<<------------    End of The:  $module  \n');
  }

  ///  Notate all tests ended.
  void endAll(String module) {
    print('--<<--<<------------  $module endAll  --<<--<<------------');
    print('All tests ended, back to main.dart  \n ');
  }
} //  --------  end of class DawoDevTest
//

///  Renamed class to: Aide in 0.0.75+.
///  Usage:  example/app_chore_play.dart.
var aide = new Aide(); //  Usage: example/app_chore_play.dart
