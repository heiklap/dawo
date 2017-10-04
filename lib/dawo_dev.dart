///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
///  dawo version:  0.0.3  25.9.2017
/// * READY-STATE  40 %  for version 0.0.4     GitHub: yes  29.11.2014
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
///

library dawo_dev.dart;

import 'dart:math'; //  No need for in-max?
import 'package:dawo/dawo_tools.dart';

//TODO  name   PROBLEMS, when using too common names:
//   devTest   =   22  times     CHANGE:   test  ! ??
//   devNote   = 2/16 times
//   cod*          10 times
//   phase          3
//   note          23 ??         CHANGE:   note  !!!
//   test        10/50            CHANGE    test  !!!

///  Not working now; to track readiness
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
  List<DevMessage> devMessageL = []; //  not used

  //--------------------------------------------------------------
// moved list from chore back to dev.. put first, header values there
  List<String> admNotes = ['* *  Team Admin notes:  * *'];
  List<String> devNotes = ['* * Team dev notes: * * '];
  List<String> innoNotes = ['* *  Team inno notes: * * '];
  List<String> howToNotes = ['* * Team HowTo notes: * * '];
  List<String> secNotes = ['* * Team sec notes: * * '];
//--------------------------------------------------------------

  ///  To add developer notes.
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

  ///  More demonstrative presentation method.
  void showNotes(String caller) {
    print('\n ------->>-->>--  dev.showNotes  by: $caller ------->>-->>--   ');
    devBox('By:dev:', [dev.admNotes, dev.devNotes], 0);
    devBox('By:dev:', [dev.innoNotes, dev.howToNotes, dev.secNotes], 0);
    print('\n --<<--<<------------  dev.showNotes  --<<--<<------------   ');
  }

  ///  Old-fashioned list print method.
  void listNotes(String caller) {
    print('\n ------->>-->>--  dev.listNotes  by: $caller ------->>-->>--   ');
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
    print('\n --<<--<<------------  dev.listNotes  --<<--<<------------   ');
  }
} //  -----  class dev

///  create instance of class Dev
var dev = new Dev();

///  Show Lists, like devNotes in nice column-box in console.
///  Can now handle 2 and 3 column cases, and is common-usage function.
///  TODO  Add better row / height decision.
void devBox(String caller, List<List<String>> inList, int forceHeight) {
  final int sW = 210;
  String borderS = ' | ';

  List<String> twoBoxL = []; //  For two columns in console screen.
  List<String> threeBoxL = []; //  For three columns in console screen.
  List<String> fourBoxL = []; //  For four columns in console screen.

  //  ***********  GLORIOUS CODING    ****************
  //  Make sure that list is certain length.
  void addEmpty(List _list, int _height, String _note) {
    while (_list.length < _height) {
      _list.add(_note);
    }
    ; //  while
  } //  addEmpty

  ///  TODO  Build one function for all these 2 X 2 functions.
  ///  PadRight both Colon-Lists items to certain length.
  ///  aColonList and bColonList, int columnTwoWidth
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
  } //  ---------  tuneColumnList

  void devBoxBuild() {
    //  print('>>>>>>>>>>>>>>>>>>>    tBox  calledBy: $caller >>>>>>>>>>>>>>');
    //  int rows = 12;
    int columnTwoWidth = ((sW ~/ 2) - 10); //  when 2 notes in a row

    String markRow = '____'; //  Gonna make this screen-width.
    String padMarkRow = markRow.padRight(sW, '_');
    markRow = padMarkRow;
    markRow.padRight(sW, '-'); //  (sW, '_');

    ///  build two / three-List in parameter -case box;
    ///  Use forceHeight parameter:
    int twoBoxHeight = 15; //  Should be decided by Lists length.
    // Should force length of in-list.
    if (forceHeight > 0) twoBoxHeight = forceHeight;
    int threeBoxHeight = 17;

    ///  Build two-column-area List.  -----------   2 columns.
    if (inList.length == 2) {
      //  Create 2 temp List to be able to modify data.
      List<String> aColonList = [];
      aColonList.addAll(inList[0]);

      List<String> bColonList = [];
      bColonList.addAll(inList[1]);

      addEmpty(aColonList, twoBoxHeight, ' * empty new * ');
      addEmpty(bColonList, twoBoxHeight, ' * empty new * ');

      tuneColumnList(aColonList, columnTwoWidth);
      tuneColumnList(bColonList, columnTwoWidth);

      /// Build #Long-String List of top-area lists and mark borders.
      twoBoxL.add(markRow);
      for (var c = 0; c < twoBoxHeight; c++) {
        String firstData = aColonList[c];
        String secondData = bColonList[c];
        String longS = '$borderS $firstData  $borderS $secondData $borderS ';
        twoBoxL.add(longS);
      }
      twoBoxL.add(markRow);
      twoBoxL.forEach(print);
      print(' ');
    } //  --------------  inList length == 2

    ///  Build three-column-area List.  -----------   3 columns.
    if (inList.length == 3) {
      int columnThreeWidth = ((sW ~/ 3) - 10); //  when 3 notes in a row

      ///  in three List parameter -case:
      List<String> cColonList = [];
      cColonList.addAll(inList[0]);

      List<String> dColonList = [];
      dColonList.addAll(inList[1]);

      List<String> eColonList = [];
      eColonList.addAll(inList[2]);

      ///  Add three-List-case -area Lists to certain length.
      addEmpty(cColonList, threeBoxHeight, ' * empty mc new * ');
      addEmpty(dColonList, threeBoxHeight, ' * empty md new * ');
      addEmpty(eColonList, threeBoxHeight, ' * empty me new * ');

      ///  tune Three-columns-area Lists Strings to certain length.
      tuneColumnList(cColonList, columnThreeWidth);
      tuneColumnList(dColonList, columnThreeWidth);
      tuneColumnList(eColonList, columnThreeWidth);

      threeBoxL.add(markRow);
      for (var c = 0; c < threeBoxHeight; c++) {
        String fData = cColonList[c];
        String sData = dColonList[c];
        String tData = eColonList[c];
        String longS =
            '$borderS $fData $borderS $sData $borderS $tData $borderS';
        threeBoxL.add(longS);
      }
      threeBoxL.add(markRow);
      threeBoxL.forEach(print);
    } // ----------  length inList = 3
  } //  -------------  devBoxBuild

  ///  Give parameters for 2-3- or 4  column boxes-
  devBoxBuild();
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
