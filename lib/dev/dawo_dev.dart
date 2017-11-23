// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Dev (& team)
///  dev, msg classes and some helper stuff for screen prints and notes.
///  (Team - for many developers working in same project)
///  dawo version: 0.0.5  6.11.2017.   READY-STATE  for version 0.0.6  0%
/// *      GitHub: yes  29.11.2014
/// * Hist:hkl  19.1.2014  0.0.1  dawo/lib  some elementary  dev-tools for dawo
//

library dawo_dev.dart;

import '../shower.dart';
import '../tools.dart';

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
  //  To collect range aso. errors.
  List<String> errorLog = ['* dev errorLog  *'];

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
      ..add('NEXT: User simulated data for actions. Server-client ?.')
      ..add('NEXT; SearchList of important dawo terms to example-file :con:m:')
      ..add('NEXT: ouput clean after: con - corp console schedule.')
      ..add('boxServe: box-output for bind and connector AND to everybody.')
      ..add('Hide  ALL  flow-output. Do it with :glb: user parameters.')
      ..add('Enhancement: folders #corp #mis and #dev to group files.')
      ..add('Extract glb class from beta-library to: src.')
      ..add('Extract GlobalOp from beta to: src as: affair.')
      ..add('Reolve: word-preferences, class to src/  Out of connector class.')
      ..add('Connector class-opJoin  modification')
      ..add(':bind: moved from connector to own library: class Bind in src/.')
      ..add(':bind: / binding in opCom:con: and shower: data and more clarity.')
      ..add('dawo_example.dart had total reconstruct. Was really needed.')
      ..add('Connector & Corporation > opCom console outPut in schedule.')
      ..add('Made shower.scheduleBox() a class.')
      ..add('Solved BUG: m.opRoll: autoRollFunc-Works. #NAME: :courier:Func.')
      ..add('Out-comment all typedef stuff, use effPrint & flowC.')
      ..add('Marked BUG: when mission-render : choreL list is emptyl')
      ..add('Marked BUG: m-render to mission.opRoll: autoRollFunc DoNotWork')
      ..add('Cleared all -not-used-library errors.')
      ..add(combi)
      ..add('beta -library total renovation, and connections to it.')
      ..add('base_struct & base_lib renamed to: alpha and  beta -libraries.')
      ..add('New Store class, all Streams are now: supply and demand.')
      ..add('6 class Group and Member in base_struct. RENAMED: alpha. !!')
      ..add('Corporate class, previous #common operate from beta.dart.')
      ..add('6 Solving chaos : changing names to privat and original ones.')
      ..add('6 Solving chaos : console output is now only 22 screens.')
      ..add('6 solving chaos : :who:did:this: to mark outputs in console.')
      ..add('6 Nearing chaos : was hard to spot: #whoPrintedThisToConsole.')
      ..add('6 typedef effPrint conPrint aso and method inside class.')
      ..add('6 Connector: much activity; ERROR: dartdoc fails.  ')
      ..add('6 dawolang: using 0.0.1 in connector opJoin to check #words.')
      ..add('5  Shorter names, dawo away: connector.dart, mill.dart.')
      ..add('5  Effort-diagonal got recommendation and JSON lists.')
      ..add('5  Only Chore knows the one and only instance of Effort.')
      ..add('5  JSON stuff moved from Effort to clay/user_json.dart.')
      ..add('5  Shower: all screen presentations moved here.')
      ..add('5  Formed iterable-diagonal preentation with boxed add-on-lists.')
      ..add('5  Changed choreL mlists to maps.')
      ..add('5  Splitted cheduleBox functions parts to tools.')
      ..add('5-  Effort class for user-chore-data. And JSON data handling. ')
      ..add('5-02 Cascades in devNotes and names are now: admN, devN aso.')
      ..add('5-01 All in tools removed inside a new Tool, tl class.')
      ..add('10 In analyzis options file: analyzer: strong-mode: true.')
      ..add('9 Added copyright notice to every lib/ file.')
      ..add('8 Changed library dawo_tools name to: tools.dart.')
      ..add('7 Equipment, equ class to keep material and name resources.')
      ..add(
          '6 Missions specific op-methods, cheduleBox for resource allocating.')
      ..add('dev: doneL added to keep track of fast changes. 10.10.17')
      ..add('flowserve: added flowI event counter. In beta: flowI. 10.10.17')
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
    innoN.add('#CallChain, to track call-route of every current command.');
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



