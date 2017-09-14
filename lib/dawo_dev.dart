///  ##  Dev & team
///  Some helper stuff for screen prints and notes.
///  Team - for many developers working in same project
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
/// * READY-STATE  99%  for version 0.0.2     GitHub: yes  29.11.2014

library dawo_dev.dart;

import 'package:dawo/dawo_tools.dart';

//  No idea yet, how and where notes are added, leaving that to 0.0.3

//TODO  name   PROBLEMS, when using too common names:
//   devTest   =   26  times     CHANGE:   test  ! ??
//   devNote   =    6 times
//   cod            3 times
//   phase          3
//   note          23            CHANGE:   note  !!!
//   test          54            CHANGE    test  !!!

///  Not working now; to track readyness
num dawoDevReadiness = 94;

///  buffer also outside class, for testing and adding visibility
var devBuf = new StringBuffer();

//TODO  teamInno   devTeam should be one instance of team class !!
bool devTestPhase = true; // set this false in production. (newer)

///  two members (persons) of devTest team:
//TODO  teamAdm team_members..  should they be in... team_staff..
///  First coder name
String devTestNight = 'Late Night Coder ';

///  Second coder name
String devTestMorn = 'Earlymorn Coffeeman ';

/// count.. something
num devTestCount = 0;

///  msg named in dev
String devBlame = '';

//TODO  teamHowTo lists: add:   automatize adding notes to lists?
//TODO  teamInno  notes:  automatic roll of createNotes.? no; events..?

//TODO  teamHowTo stream    define a stream transformer
/*
var transformer = new StreamTransformer.fromHandlers(handleData: (value, sink) {
// create two new values from the original value
sink.add("Message: $value")
  .add("Body: $value");
});

// transform the stream and listen to its output
stream.transform(transformer).listen((value) => print("listen: $value"));

//TODO  teamEdu  devNotes..  instead of TO-DO-notes..
//TODO  teamEdu  ..for to not spam dawo package with -notes

var devTestStreamData = ['devTestStream, for notes and testing',
                         'Next note.. aso'
                         ]; // later more notes to come...
var devTestStream = new Stream.fromIterable(devTestStreamData);
*/

///  Generic list to keep and handle all devNotes
List<DevNote> devNoteL = [];

///   for simple:  "hello-I-am"  -tests
/// TODO  name    can not be this name  it is already used ??
class DevNote {
  var noteL = ['* * *  DevNotes   * * *', '', ''];

  ///  Map for devNotes
  Map<String, String> noteM = {'': ''};
  void noteAdd() => print('addNewNote();');

  void notesShow() => print('Showing all notes..');
//  add code:
//  devTestStream.join('New one')         //  add some streams
//    .join(String 'Second one')
//    .add('we are shutting down!');
// ('New note joined to devStream');
} //--------------------------------------------------  class end DevNote

///  creating Glorious :) DevTest class; implement it as:  new dt()
///  collect all my own devTests under a class
class DevTest {
  //  TODO  add constructor: (String user, String x)

  /// for future use:  map for testing  dev
  Map<String, String> devTestMap = {
    'dawo': 'coding dawo',
    'rest': 'coffee Time',
    'dawoColl': 'W O R K..ing hours',
    'dawoEngine': 'riding home'
  };

  ///  function for to print devTestMap
  void devTestMapShow() {
    devTestMap.forEach(printSS); //  from dawo_tools.dart
  }

//TODO  teamDev: PLAN:  make all 6 tests use same name with
//         parameters: Test, Msg, Line, Begin, End, Return

  /// TODO  teamDev:   should this be named to devTestInfo ??  devInfo ??
  /// report testers info
  num devTest(String unit, String whoDoneThis) {
    if (devTestPhase) {
      DateTime now = new DateTime.now();

      String _s30 = '                              ';
      print(
          '$_s30  DEVELOPMENT TEST ------------------------------------------------');
      print('$_s30  Testing $unit  Test n:o:  $devTestCount');
      print('$_s30  Tester:  $whoDoneThis');
      print('$_s30  dev test ended    Time: $now ');
      print('');

//TODO  aSync stream     devTestStream.
      devTestCount++;
    }
    return devTestCount;
  }

  /// NOTE  team-team   developers can send messages to each others in test printings
  /// Simple message to track run and development
  devMsg(String unit, String whoDoneThis) {
    if (devTestPhase) {
      DateTime now = new DateTime.now();

      String _s30 = '                              ';
      print(
          '$_s30  Developers message ---------------------------------------');
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

//TODO  Function  getter  There is no such getter 'runTimeType' in 'Function'
//  String _sRunTimeType = rf..runTimeType;    //.runTimeType;

    print('b  b  b  b  b  b  b  b  b  b  b  b  b     Beginning:   $_s');
    rf();
    print('runtime type:   $_sType');
    print('e  e  e  e  e  e  e  e  e  e  e  e  e  e   End of +   $_s');
    print('');
  }
//TODO  teamDev  Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  Dynamic-parameter-function, that is used to run other function in tests
  ///  it is  called:     tfDyn(testSomething);
  void tfDyn(var rf) {
    //A value of type 'toString' cannot be assigned to a variable of type 'String'
    String _s = rf.toString;

    //  can we get runtime type toString?
    String _sType = rf.runTimeType();
    //TODO
    //  There is no such getter 'runTimeType' in 'Function'
    //  String _sRunTimeType = rf..runTimeType;    //.runTimeType;
    print('--------------------------------- Beginning:   $_s');
    print(_sType);
    rf();
    print('---------------------------------------- End of test');
    print('');
  }

  /// TODO  teamDev Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  present simple message while testing
  void devTestLine(String module) {
    print('---------------------------------------- Beginning:  $module ');
    print('');
  }

  ///  present simple DONE message after all tests are done
  void devTestsDone(String module) {
    print('----------  $module ----------------------------------------');
    print('All tests done  ');
  }

  ///  notate single test end
  void devTestEnd(String module) {
    print('---------------------------------------- End of The:  $module  ');
    print(' ');
  }

  ///  notate all tests ended
  void devTestsEnd(String module) {
    print('----------  $module ----------------------------------------');
    print('All tests ended, back to main.dart   ');
  }
} //  --------  end of class DawoDevTest
//

///  howTo do these?
void addDawoDevNotes() {
  print('--  empty addDevNotes function  --');
  //  code here.
  print('--  not clear yet, how this must be done  -- \n');
}
