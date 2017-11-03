// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
///  dawo version: 0.0.4  16.10.2017.   READY-STATE  for version 0.0.5  0%
/// *      GitHub: yes  29.11.2014
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
//

library dawo_dev.dart;

import 'dart:math'; //  No need for in-max?
import 'package:dawo/tools.dart';

//TODO  name   PROBLEMS, when using too common names:
//   devTest   =   22  times     CHANGE:   test  ! ??
//   devNote   = 2/16 times
//   cod*          10 times
//   phase          3
//   note          23 ??         CHANGE:   note  !!!
//   test        10/50            CHANGE    test  !!!
//  #Word  Stream  6

//  New async : plans to make async functions start synchronously.
//  This change is planned for Dart 2.0.
//  TODO  Future foo() async { await null; doSomething(); }
//  TODO  Future bar() async { await null; return doSomething(); }

///  Not working now; to track readiness
num dawoDevReadiness = 94;

///  Buffer also outside class, for testing and adding visibility.
var devBuf = new StringBuffer();

///  Collect dev stuff to Dev class, to help in development of package.
class Dev {
  ///  small mess with variable names
  int devTestCount = 0;
  //  TODO  teamInno   devTeam, should be also instance of #team? class ?
  bool devTestPhase = true; // set this false in production. (newer)

  ///  two members (persons) of devTest team:
//  TODO  teamAdm team_members..  should they be in... team_staff..
  String coderNight = 'Late Night Coder ';
  String coderMorn = 'Earlymorn Coffeeman ';

  /// count.. something
  num coderCount = 0;

  ///  msg named in dev
  String coderBlame = '';

  ///  Generic list to keep and handle all devNotes
  List<DevMessage> devMessageL = []; //  not used
  ///  To handy keep track of fast changes in code:
  List<String> doneL = [];

  ///  First, header values to teamN.
  List<String> admN = ['* *  Team Admin notes:  * *'];
  List<String> devN = ['* * Team dev notes: * * '];
  List<String> innoN = ['* *  Team inno notes: * * '];
  List<String> howToN = ['* * Team HowTo notes: * * '];
  List<String> secN = ['* * Team sec notes: * * '];

  ///  To add developer notes.
  void addNote(List l, String s) {
    l.add(s);
  }

  ///  Fill devNote lists with data. dawo_app calls this in it's build-method!
  void buildNotes(String caller, msg) {
    //  TODO String howTo write many line String.  From dartlang.org
    var interpolation = "interpolation";
    var combi = "a string "
        "that goes over multiple lines "
        "and uses $interpolation "
        r"and \raw strings";
    //  -----  code Sample

    doneL
      ..add('   * * *  doneL to keep track of daily Dawo changes.   * * * ')
      ..add('5  Splitted opSchedule functions parts to tools.')
      ..add('5-  Effort class for user-chore-data. And JSON data handling. ')
      ..add('5-02 Cascades in devNotes and names are now: admN, devN aso.')
      ..add('5-01 All in tools removed inside a new Tool, tl class.')
      ..add('10 In analyzis options file: analyzer: strong-mode: true.')
      ..add('9 Added copyright notice to every lib/ file.')
      ..add('8 Changed library dawo_tools name to: tools.dart.')
      ..add('7 Equipment, equ class to keep material and name resources.')
      ..add(
          '6 Missions specific op-methods, opSchedule for resource allocating.')
      ..add('dev: doneL added to keep track of fast changes. 10.10.17')
      ..add(
          'flowserve: added flowI event counter. In base_lib: flowI. 10.10.17')
      ..add('Mission: shortened arrows: -->-m--> and  <-m--<--. 10.10.17.')
      ..add('Info about older notes should apper in lists.');

    admN
      ..addAll([
        'adm: #Principle: do not mess, keep it simple.',
        'schedule : meeting thursday.'
      ])
      ..addAll(
          ['adm: Must be strict all the time.', 'Keep good care of people.'])
      ..addAll([
        'adm: Week schedule must include total check at least 3 times in a week.',
        'System cleaning of old log-notes is not necessary every week. 2 times in a month is enough.'
      ]);

    devN.addAll([
      'Priority: rumba and web.',
      'Create all instances in the  ?? ri? lib.'
    ]);
    innoN.addAll(['-Counters?', 'Mongo-DB', 'Indexed-DB', 'User-class']);
    howToN
      ..addAll(['Web-html?', 'Typedef?', 'Connector?', 'Streams?', 'Async?'])
      ..addAll(
          ['Name: base-lib?', 'User-action?', 'Print-output-variables-logos.']);
    secN.addAll(
        ['Restrict use of certain methods.', 'Create up-level pass-word.']);
  }

  ///  More demonstrative devBox presentation method.
  void showNotes(String caller) {
    print('\n ------->>-->>--  dev.showNotes  by: $caller ------->>-->>--   ');
    devBox('By:dev:', [dev.admN, dev.devN], 0);
    devBox('By:dev:', [dev.innoN, dev.howToN, dev.secN], 0);
    print('--<<--<<------------  dev.showNotes  --<<--<<------------ \n  ');
  }

  ///  Old-fashioned list print method.
  void listNotes(String caller) {
    print('\n ------->>-->>--  dev.listNotes  by: $caller ------->>-->>--   ');
    dev.howToN.add('dev-Show-Notes:  How to add 8-indent in show?  ');
    dev.secN.add('dev-Show-Notes:  howTo keep some notes secret?  Sec? ');
    admN.forEach(print);
    print(' ');
    devN.forEach(print);
    print(' ');
    innoN.forEach(print);
    print(' ');
    howToN.forEach(print);
    print(' ');
    secN.forEach(print);
    print('--<<--<<------------  dev.listNotes  --<<--<<------------ \n ');
  }
} //  -----  class dev

///  Create instance of class Dev.
var dev = new Dev();

///  Show Lists, like devNotes in nice column-box in console.
///  Can now handle 2, 3 and 4 column cases, and is common-usage function.
///  TODO  Add better row / height decision.
///  #QUEST : Surely these 2-3-4 functions can be combined to one, and
///  handle 2-3-4 with parameters. Did it once, but was ugly.
///  TODO  Make return type: SgtringBuffer
StringBuffer devBox(String caller, List<List<String>> inList, int forceHeight) {
  StringBuffer _retBuf = new StringBuffer();
  final int sW = 210;
  String borderS = ' | '; //  In 4 columns is smaller.

  List<String> twoBoxL = []; //  For two columns in console screen.
  List<String> threeBoxL = []; //  For three columns in console screen.
  List<String> fourBoxL = []; //  For four columns in console screen.

  //  ***********  GLORIOUS CODING  byMe :)  ****************
  //  Make sure that list is certain length.
  void addEmpty(List _list, int _height, String _note) {
    while (_list.length < _height) {
      _list.add(_note);
    }
    ; //  -- while
  } //  -- addEmpty

  ///  TODO  Build one function for all these 2 X 2 functions.
  ///  PadRight both Colon-Lists items to certain length.
  ///  aColonList and bColonList, int columnTwoWidth.
  void tuneColumnList(List<String> cL, int width) {
    for (var x = 0; x < cL.length; x++) {
      if (cL[x].length < width) {
        String s = cL[x].padRight(width, '_');
        cL[x] = s;
      }
      if (cL[x].length > width) {
        String s = cL[x].substring(0, width);
        //  TODO  add " >>" for last marks.
        cL[x] = s;
      }
    }
  } //  ---------  tuneColumnList

  ///  Carry the actual List building.
  void devBoxBuild() {
    int columnTwoWidth = ((sW ~/ 2) - 10); //  when 2 notes in a row
    ///  To get nice little header String in top-left corner.
    String topRim = '_devbox___'; //  Widen this later to screen-width.
    String botRim = '____'; //  Widen this later to screen-width.
    String padTopRim = topRim.padRight(sW, '_');
    String padBotRim = botRim.padRight(sW, '_');
    topRim = padTopRim;
    botRim = padBotRim;

    ///  howTo String:  these two lines has no effect:
    topRim.padRight(sW, '_'); //  (sW, '_');
    botRim.padRight(sW, '_'); //  (sW, '_');

    ///  build two / three-List in parameter -case box;
    ///  Use forceHeight parameter:
    int twoBoxHeight = 15; //  TODO  Should be decided by Lists length.
    // Should force length of in-list.
    if (forceHeight > 0) twoBoxHeight = forceHeight;

    int threeBoxHeight = 17;
    if (forceHeight > 0) threeBoxHeight = forceHeight;

    int fourBoxHeight = 17;
    if (forceHeight > 0) fourBoxHeight = forceHeight;

    ///  Build two-column-area List.  -----------   2 columns.
    if (inList.length == 2) {
      //  Create 2 temp List to be able to modify data.
      List<String> aColonList = [];
      aColonList.addAll(inList[0]);

      List<String> bColonList = [];
      bColonList.addAll(inList[1]);

      addEmpty(aColonList, twoBoxHeight, '_');
      addEmpty(bColonList, twoBoxHeight, '_');

      tuneColumnList(aColonList, columnTwoWidth);
      tuneColumnList(bColonList, columnTwoWidth);

      /// Combine short List-rows to #Long-String and add borderMarks.
      twoBoxL.add(topRim);
      for (var c = 0; c < twoBoxHeight; c++) {
        String firstData = aColonList[c];
        String secondData = bColonList[c];
        String longS = '$borderS $firstData  $borderS $secondData $borderS ';
        twoBoxL.add(longS);
      }
      twoBoxL.add(botRim);
      twoBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(twoBoxL);
      _retBuf.write(' ');
      print(' ');
    } //  --  inList length == 2

    ///  Build three-column-area List.  -----------   3 columns.
    if (inList.length == 3) {
      int columnThreeWidth = ((sW ~/ 3) - 10); //  when 3 notes in a row

      ///  3-case; Create 3 new List to modify data:
      List<String> cColonList = [];
      cColonList.addAll(inList[0]);

      List<String> dColonList = [];
      dColonList.addAll(inList[1]);

      List<String> eColonList = [];
      eColonList.addAll(inList[2]);

      ///  Add three-List-case -area Lists to certain length if needed.
      addEmpty(cColonList, threeBoxHeight, '_');
      addEmpty(dColonList, threeBoxHeight, '_');
      addEmpty(eColonList, threeBoxHeight, '_');

      ///  Tune Three-columns-area Lists items to certain length.
      tuneColumnList(cColonList, columnThreeWidth);
      tuneColumnList(dColonList, columnThreeWidth);
      tuneColumnList(eColonList, columnThreeWidth);

      ///  Form the actual matrix for printing.
      threeBoxL.add(topRim);
      for (var c = 0; c < threeBoxHeight; c++) {
        String fData = cColonList[c];
        String sData = dColonList[c];
        String tData = eColonList[c];
        String longS =
            '$borderS $fData $borderS $sData $borderS $tData $borderS';
        threeBoxL.add(longS);
      }
      threeBoxL.add(botRim);
      threeBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(threeBoxL);
      _retBuf.write(' ');
    } // ----------  length inList = 3

    ///  Build four-column-area List.  -----------   4 columns.
    if (inList.length == 4) {
      int columnFourWidth = ((sW ~/ 4) - 4); //  when 4 notes in a row
      String borderS = '|';

      ///  in three List parameter -case:
      List<String> fColonList = [];
      fColonList.addAll(inList[0]);

      List<String> gColonList = [];
      gColonList.addAll(inList[1]);

      List<String> hColonList = [];
      hColonList.addAll(inList[2]);

      List<String> iColonList = [];
      iColonList.addAll(inList[3]);

      ///  Add four-List-case -area Lists to certain length if needed.
      addEmpty(fColonList, threeBoxHeight, '_');
      addEmpty(gColonList, threeBoxHeight, '_');
      addEmpty(hColonList, threeBoxHeight, '_');
      addEmpty(iColonList, threeBoxHeight, '_');

      ///  Tune Four-columns-area Lists Items to certain length.
      tuneColumnList(fColonList, columnFourWidth);
      tuneColumnList(gColonList, columnFourWidth);
      tuneColumnList(hColonList, columnFourWidth);
      tuneColumnList(iColonList, columnFourWidth);

      ///  Start forming this overly-tight mess of funny data.
      fourBoxL.add(topRim);
      for (var c = 0; c < fourBoxHeight; c++) {
        String fData = fColonList[c];
        String gData = gColonList[c];
        String hData = hColonList[c];
        String iData = iColonList[c];
        String longS = '$fData  $gData  $hData  $iData $borderS';
        //  '| $fData $borderS $gData $borderS $hData $borderS $iData $borderS';
        fourBoxL.add(longS);
      }
      fourBoxL.add(botRim);
      fourBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(fourBoxL);
      _retBuf.write(' ');
    } // --  length inList = 4
  } //  -------------  devBoxBuild

  devBoxBuild(); //  Call function.
  return _retBuf;
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

///  NOTE: Messages might be something that demand immediately action.
///  For more complicated cases of note-message-handling.
class DevMessage {
  var messageL = ['* * *  DevMessages   * * *', '', ''];

  ///  Map for devMessages.
  Map<String, String> messageM = {'': ''};
  void messageAdd() => print('addNewMessage();');

  void show() => print('Showing all Dev-messages..');
//  #Code #Sample
//  add code:
//  devTestStream.join('New one')         //  add some streams
//    .join(String 'Second one')
//    .add('we are shutting down!');
// ('New note joined to devStream');
} //--------------------------------------------------  class end DevMessage

///  Creating instance of (mostly unused) DevMessage class:
///  dm  would be better.
var devM = new DevMessage();

///  Creating Glorious :) DevTest class; implement it as:  new dt()
///  Collect all my own devTests inside a class.
///  howTo avoid calling it devTest.devTest  lol
class DevHelp {
  //  TODO  DevHelp Constructor: add constructor: (String user, String x)

  /// For future use:  map for testing  dev. #NotUsed
  Map<String, String> normMap = {
    'dawo': 'coding dawo',
    'rest': 'coffee Time',
    'dawoColl': 'W O R K..ing hours',
    'dawoEngine': 'riding home'
  };

  ///  Function for to print devTestMap.  Looks funny :)
  void normMapShow() {
    print(' \n ------------>>-->>-- devHelp norms  ------------>>-->>--');
    //  Using here new Tools, tl class.
    normMap.forEach(tl.printSS); //  from tools.dart
    print(' \n --<<--<<------------ devHelp norms  --<<--<<------------');
  }

//  TODO  teamDev: PLAN:  make all 6 tests use same name with
//         parameters: Test, Msg, Line, Begin, End, Return

  /// TODO  teamDev:   Should this be named to devTestInfo ??  devInfo ??
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

//  TODO  aSync stream     devTestStream.
      //  NOTE: Dubious to use dev-class here?
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

//  TODO  teamDev  Function   make  rbFunc, rnFunc, rsFunc (runStringFunc returns String)

  ///  Dynamic-parameter-function, that is used to run other function in tests.
  ///  It is  called:     tfDyn(testSomething);
  ///  TODO  Check these String / type errors.
  void tfDyn(var rf) {
    //A value of type 'toString' cannot be assigned to a variable of type 'String'
    String _s = rf.toString;

    //  Can we get runtime type toString?
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

///  Renamed class to: devHelp in 0.0.3.
///  dh  would be nice name.
var devHelp = new DevHelp();

///  #howTo do these?
void addDawoDevNotes() {
  print('--  empty addDevNotes function  --');
  //  code here.
  print('--  not clear yet, how this must be done  -- \n');
}
