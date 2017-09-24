///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
///  dawo version:  0.0.3  25.9.2017
/// * READY-STATE  0 %  for version 0.0.4     GitHub: yes  29.11.2014
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
///

library dawo_dev.dart;

import 'package:dawo/dawo_tools.dart';

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

///  collect dev stuff to Dev class
class Dev {
  ///  small mess with variable names
  int devTestCount = 0;
  //TODO  teamInno   devTeam should be one instance of team class !!
  bool devTestPhase = true; // set this false in production. (newer)

  ///  two members (persons) of devTest team:
//TODO  teamAdm team_members..  should they be in... team_staff..
  String coderNight = 'Late Night Coder ';
  String coderMorn = 'Earlymorn Coffeeman ';

  /// count.. something
  num coderCount = 0;

  ///  msg named in dev
  String coderBlame = '';

  ///  Generic list to keep and handle all devNotes
  ///  To keep Class DevMessages instances
  List<DevMessage> devMessageL = [];

  //--------------------------------------------------------------
// moved list from chore back to dev.. put first, header values there
  List<String> admNotes = ['* *  Team Admin notes:  * *'];
  List<String> devNotes = ['* * Team dev notes: * * '];
  List<String> innoNotes = ['* *  Team inno notes: * * '];
  List<String> howToNotes = ['* * Team HowTo notes: * * '];
  List<String> secNotes = ['* * Team sec notes: * * '];
//--------------------------------------------------------------

  ///  to add developer notes
  void addNote(List l, String s) {
    l.add(s);
  }

  void buildNotes() {
    admNotes.addAll(['adm: principle: do not mess, keep it simple']);
    devNotes.addAll(
        ['priority : rumba and web', 'Create all instances in theri lib.']);
    innoNotes.addAll(['-Counters?', 'Mongo-DB', 'Indexed-DB', 'User-class']);
    howToNotes
        .addAll(['Web-html?', 'typedef?', 'connector?', 'Streams?', 'Async?']);
    howToNotes
        .addAll(['base-lib?', 'user-action?', 'print-output-variables-logos']);
    secNotes.addAll(
        ['Restrict use of certainn methdos', 'Create up-level pass-word']);
  }

  void showNotes() {
    print('\n ------  dev.showNotes  ------------------   ');
    admNotes.forEach(print);
    print(' ');
    devNotes.forEach(print);
    print(' ');
    innoNotes.forEach(print);
    print(' ');
    howToNotes.forEach(print);
    print(' ');
    secNotes.forEach(print);
    print(' ');
  }
} //  -----  class dev

///  create instance of class Dev
var dev = new Dev();

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

///  Messages might be something that demand immediately action.
///  For more complicated cases of note-message-handling.
class DevMessage {
  var messageL = ['* * *  DevMessages   * * *', '', ''];

  ///  Map for devMessages
  Map<String, String> messageM = {'': ''};
  void messageAdd() => print('addNewMessage();');

  void show() => print('Showing all Dev-messages..');
//  add code:
//  devTestStream.join('New one')         //  add some streams
//    .join(String 'Second one')
//    .add('we are shutting down!');
// ('New note joined to devStream');
} //--------------------------------------------------  class end DevNote

///  creating Glorious :) DevTest class; implement it as:  new dt()
///  collect all my own devTests under a class
///  howTo avoid calling it devTest.devTest  lol
class DevHelp {
  //  TODO  add constructor: (String user, String x)

  /// for future use:  map for testing  dev
  Map<String, String> normMap = {
    'dawo': 'coding dawo',
    'rest': 'coffee Time',
    'dawoColl': 'W O R K..ing hours',
    'dawoEngine': 'riding home'
  };

  ///  function for to print devTestMap
  void normMapShow() {
    print(' \n ------- devHelp norms  ------------------------');
    normMap.forEach(printSS); //  from dawo_tools.dart
  }

//TODO  teamDev: PLAN:  make all 6 tests use same name with
//         parameters: Test, Msg, Line, Begin, End, Return

  /// TODO  teamDev:   should this be named to devTestInfo ??  devInfo ??
  /// report testers info
  num devTest(String unit, String whoDoneThis) {
    if (dev.devTestPhase) {
      DateTime now = new DateTime.now();

      String _s30 = '                              ';
      print('$_s30  DEVELOPMENT TEST --------------------------------------');
      print('$_s30  Testing $unit  Test n:o:  $dev.devTestCount');
      print('$_s30  Tester:  $whoDoneThis');
      print('$_s30  dev test ended    Time: $now ');
      print('');

//TODO  aSync stream     devTestStream.
      //  dubious to use dev-class here?
      dev.devTestCount++;
    }
    return dev.devTestCount;
  }

  /// NOTE  team-team   developers can send messages to each others in test printings
  /// Simple message to track run and development
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
  void line(String module) {
    print('---------------------------------------- Beginning:  $module ');
    print('');
  }

  ///  present simple DONE message after all tests are done
  void done(String module) {
    print('----------  $module ----------------------------------------');
    print('All tests done  ');
  }

  ///  notate single test end
  void end(String module) {
    print('---------------------------------------- End of The:  $module  ');
    print(' ');
  }

  ///  notate all tests ended
  void endAll(String module) {
    print('----------  $module ----------------------------------------');
    print('All tests ended, back to main.dart   ');
  }
} //  --------  end of class DawoDevTest
//

///  renamed class to: devHelp
var devHelp = new DevHelp();

///  howTo do these?
void addDawoDevNotes() {
  print('--  empty addDevNotes function  --');
  //  code here.
  print('--  not clear yet, how this must be done  -- \n');
}
