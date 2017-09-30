///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
///  dawo version:  0.0.3  25.9.2017
/// * READY-STATE  0 %  for version 0.0.4     GitHub: yes  29.11.2014
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
///

library dawo_dev.dart;

import 'dart:math';
import 'package:dawo/dawo_tools.dart';

//TODO  name   PROBLEMS, when using too common names:
//   devTest   =   22  times     CHANGE:   test  ! ??
//   devNote   = 2/16 times
//   cod*          10 times
//   phase          3
//   note          23 ??         CHANGE:   note  !!!
//   test        10/50            CHANGE    test  !!!

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

  ///  Fill devNote lists with data. dawo_app calls this in it's build-method!
  void buildNotes(String caller, msg) {
    admNotes.addAll(['adm: #Principle: do not mess, keep it simple.']);
    admNotes.addAll(
        ['adm: Must be strict all the time.', 'Keep good care of people.']);
    admNotes.add(
        'adm: Week schedule must include total check at least 3 times in a week.  System cleaning of old log-notes is not necessary every week. 2 times in a month is enough.');

    devNotes.addAll([
      'priority : rumba and web',
      'Create all instances in the  ?? ri? lib.'
    ]);
    innoNotes.addAll(['-Counters?', 'Mongo-DB', 'Indexed-DB', 'User-class']);
    howToNotes
        .addAll(['Web-html?', 'typedef?', 'connector?', 'Streams?', 'Async?']);
    howToNotes
        .addAll(['base-lib?', 'user-action?', 'print-output-variables-logos']);
    secNotes.addAll(
        ['Restrict use of certainn methdos', 'Create up-level pass-word']);
  }

  void showNotes(String caller) {
    print('\n ------->>-->>--  dev.showNotes  by: $caller ------->>-->>--   ');
    dev.howToNotes.add('dev-Show-Notes:  How to add 8-indent in show?  ');
    dev.secNotes.add('dev-Show-Notes:  howTo keep some notes secret?  Sec? ');
    admNotes.forEach(print);
    print(' ');
    devNotes.forEach(print);
    print(' ');
    innoNotes.forEach(print);
    print(' ');
    howToNotes.forEach(print);
    print(' ');
    secNotes.forEach(print);
    print('\n --<<--<<------------  dev.showNotes  --<<--<<------------   ');
  }
} //  -----  class dev

///  create instance of class Dev
var dev = new Dev();

///  Show devNotes in nice box in console.
void devBox(String caller) {
  print('>>>>>>>>>>>>>>>>>>>    tBox  calledBy: $caller >>>>>>>>>>>>>>');
  final int sW = 210;
  int rows = 12;
  int columnTopWidth = ((sW ~/ 2) - 10); //  when 2 notes in a row
  ///  not used yet
  int columnMidWidth = ((sW ~/ 3) - 10); //  when 3 notes in a row

  String padRightHelperS = '';
  String blankS = padRightHelperS.padRight(columnTopWidth, ' '); //  for what?

  List<String> tBoxL = []; //  Top area of console screen.
  List<String> mBoxL = []; //  Mid area of console screen.

  String borderS = ' | ';

  String markRow = '____'; //  Gonna make this screen-width.
  String padMarkRow = markRow.padRight(sW, '_');
  markRow = padMarkRow;
  markRow.padRight(sW, '-'); //  (sW, '_');

  ///  build top box;  admNotes, devNotes.
  final int tBoxHeight = 15; //  max(dev.admNotes.length, dev.devNotes.length);
  final int mBoxHeight = 17; //  max(dev.admNotes.length, dev.devNotes.length);

  int admNotesLength = dev.admNotes.length; //  not used.
  int devNotesLength = dev.devNotes.length;

  //  Create 2 temp List to be able to modify data.
  List<String> aColonList = [];
  aColonList.addAll(dev.admNotes);
  List<String> bColonList = [];
  bColonList.addAll(dev.devNotes);

  ///  Add all mid-area Lists.
  /*
  print('============= mid area lists ===================================');
  dev.innoNotes.forEach(print);
  dev.howToNotes.forEach(print);
  dev.secNotes.forEach(print);
  print('==<<<<<< ==== mid area lists ===================================');
  print(dev.innoNotes.length);
  print(dev.howToNotes.length);
  print(dev.secNotes.length);
  */

  List<String> cColonList = [];
  cColonList.addAll(dev.innoNotes);

  List<String> dColonList = [];
  dColonList.addAll(dev.howToNotes);

  List<String> eColonList = [];
  eColonList.addAll(dev.secNotes);

  //  print('hello mid List!!');
  //  Printing lists only if with parameters
  //  cColonList.forEach(print);
  //  dColonList.forEach(print);
  //  eColonList.forEach(print);

  //  print('============= mid area lists ===================================');

  //  ***********  GLORIOUS CODING    ****************
  //  Make sure that list is certain length.
  void addEmpty(List _list, int _height, String _note) {
    while (_list.length < _height) {
      _list.add(_note);
    }
    ; //  while
  }

  addEmpty(aColonList, tBoxHeight, ' * empty new * ');
  addEmpty(bColonList, tBoxHeight, ' * empty new * ');

  ///  Add mid-area Lists to certain length.
  addEmpty(cColonList, mBoxHeight, ' * empty mc new * ');
  addEmpty(dColonList, mBoxHeight, ' * empty md new * ');
  addEmpty(eColonList, mBoxHeight, ' * empty me new * ');

  ///  TODO  Build one function for all these 2 X 2 functions.
  ///  PadRight both Colon-Lists items to certain length.
  ///  aColonList and bColonList, int columnTopWidth
  void tuneColumnList(List<String> cL, int width) {
    for (var x = 0; x < cL.length; x++) {
      if (cL[x].length < width) {
        String s = cL[x].padRight(width, '-');
        cL[x] = s;
      }
      if (cL[x].length > width) {
        String s = cL[x].substring(0, width);
        //  TODO  add " >>" for last marks.
        cL[x] = s;
      }
    }
  }

  tuneColumnList(aColonList, columnTopWidth);
  tuneColumnList(bColonList, columnTopWidth);

  ///  tune Mid-area Lists Strings to certain length.
  tuneColumnList(cColonList, columnMidWidth);
  tuneColumnList(dColonList, columnMidWidth);
  tuneColumnList(eColonList, columnMidWidth);

  /// Build #Long-String List of top-area lists and mark borders.
  tBoxL.add(markRow);
  for (var c = 0; c < tBoxHeight; c++) {
    String firstData = aColonList[c];
    String secondData = bColonList[c];
    String longS = '$borderS $firstData  $borderS $secondData $borderS ';
    tBoxL.add(longS);
  }
  tBoxL.add(markRow);

  ///  Build mid-area List.
  mBoxL.add(markRow);
  for (var c = 0; c < mBoxHeight; c++) {
    String fData = cColonList[c];
    String sData = dColonList[c];
    String tData = eColonList[c];
    String longS = '$borderS $fData $borderS $sData $borderS $tData $borderS';
    mBoxL.add(longS);
  }
  mBoxL.add(markRow);

  tBoxL.forEach(print);
  print(' ');
  mBoxL.forEach(print);
} //  ----------  devBox

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
} //--------------------------------------------------  class end DevMessage

//  creating instance:
var devM = new DevMessage();

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
    print(' \n ------------>>-->>-- devHelp norms  ------------>>-->>--');
    normMap.forEach(printSS); //  from dawo_tools.dart
    print(' \n --<<--<<------------ devHelp norms  --<<--<<------------');
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
    print('------------>>-->>--    Beginning:   $_s');
    print(_sType);
    rf();
    print('--<<--<<------------    End of test  \n');
  }

  /// TODO  teamDev Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  present simple message while testing
  void line(String module) {
    print('------------>>-->>--     Beginning:  $module ');
    print('');
  }

  ///  present simple DONE message after all tests are done
  void done(String module) {
    print('--<<--<<------------    $module --<<--<<------------');
    print('All tests done  \n');
  }

  ///  notate single test end
  void end(String module) {
    print('--<<--<<------------    End of The:  $module  ');
    print(' ');
  }

  ///  notate all tests ended
  void endAll(String module) {
    print('--<<--<<------------  $module endAll  --<<--<<------------');
    print('All tests ended, back to main.dart  \n ');
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
