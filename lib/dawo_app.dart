///  ##  App class
///  Primary functionality:  engage missions.
///  Some information about app, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
///  dawo version:  0.0.3  25.9.2017
/// * ReadyState:   0 %  for version 0.0.4   in GitHub  yes
/// * hkl  3.5.2014  0.0.1  dawo/lib  dawo_app.   base status of dawo
///  devNote: starting.

library dawo_app.dart;

import 'base_struct.dart';
import 'base_lib.dart';
import 'dawlib_chore.dart';
import 'dawo_dev.dart';
import 'missions.dart';

// ignore: unused_field for those wondering.

///  Getter practice.
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  Buffer also outside class, for testing and adding visibility.
var appBuf = new StringBuffer();
bool pB = false; //  No printing now.

///  Test: Just for testing private variable inside a library.
String _privacyLibraryTest = 'Testing library / part privacy';

///  Every important dawo Class extends BaseStruct abstract class.
///  Class that holds 'soul' of THIS dawo app.
class DawoApp extends BaseStruct {
  String name = 'dawo app';
  String actor = ':DAWO-APP:';
  String infoS = 'giving global variables to dawo_src.dart';
  String motto = 'collect them here and rule them..';

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //  like:  ":DAWO-APP:";///  must initialize StringBuffer here
  String emblem =
      ':D-A:'; //  or this emblem.StringBuffer buf = new StringBuffer();
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.
  String master; //  Object that owns this.

  StringBuffer buf;

  ///  Controlling app state, working-condition-state values.
  bool offB = true;
  bool onB = false;
  bool pauseB;
  bool doneB = false;

  ///  Organize out-buffers to Map for return to package users.
  Map<String, StringBuffer> outMapBuffers = {
    'outHeader': outHeader, //  app - roll

    'outTl': outTl, //  rumba
    'outTMid': outTMid, //   ?  mission
    'outTr': outTr, //  dev

    'outMTop': outMTop, //   m - packDawo
    'outMid': outMid, //  m - dartlang
    'outMBot': outMBot, //  m - helsinki

    'outBl': outBl, //  m - myMusic
    'outBr': outBr, //  m - myTime

    'outFooter': outFooter // m -  nParks
  };

  ///  App-specified fields.
  String agenda = 'dawoApp rolls missioms';
  String msg = 'dawoApp-Message..';
  String develop = 'Under development.. 0 % to:  0.0.4';
  String version = '0.0.3';

  ///  Old marking to find usage of this version in test apps.
  final String version_0_0_02 = 'dawo 0.0.02 - 12 / 2013 hkl';
  String thisVersion; //  users announce their version of dawo
  String latestChange = '23.3.2017. th.12.15';

  ///  Initialize class values to beginning state.
  void init() {
    //  TODO  Actor:  only one actor for now...
    glb.changeActor(':DAWO-APP:');
    //  TODO  Set some field values.
    flowC('  -->-->>--  DawoApp buffer output initialized  ---', pB);

    //  Set fields values.
    flowC('  --<<--<<--  :da:b: init done', pB);
  }

  ///  Method for setting class in working condition.
  void build(String emblem, String master) {
    ///  NOTE empty parameter now, not used. For chore.build.
    offB = false; //  off-state ends
    onB = true; //   app is in on

    ///  Build DevNotes.
    dev.buildNotes('By: :DAWO-APP:', 'In Dawo-App-Build');
    initChoreSystem();

    /// Write something #WakeUpSleepyHead to all out-buffers.
    outHeader.writeln('* * * :outHeader:buf:   -dawoApp-build:  * * * ');
    outTl.writeln('* * * :outTl:buf:  -dawoApp-build:  * * * ');
    outTMid.writeln('* * * :outTMid:buf:  -dawoApp-build:  * * * ');
    outTr.writeln('* * * :outTr:buf:   -dawoApp-build:  * * * ');
    outMTop.writeln('* * * :outMTop:buf  -dawoApp-build:  * * * ');
    outMid.writeln('* * * :outMid:buf:  -dawoApp-build:  * * * ');
    outMBot.writeln('* * * :outMBot:buf:  -dawoApp-build:  * * * ');
    outBl.writeln('* * * :outBl:buf  -dawoApp-build:  * * * ');
    outBr.writeln('* * * :outBr:buf:  -dawoApp-build:  * * * ');
    outFooter.writeln('* * * :outFooter:buf:  -dawoApp-build:  * * * ');

    flowC('  --<<--<<--  :da:b:  build done', pB);
  }

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> outMapBuffers
  Map<String, StringBuffer> roll() {
    dev.admNotes.add('>>ADM:CHECK-IN  dawo_app-roll  >>');
    dev.admNotes.add(':Ar: = in App-Roll. Mark value number: #7: ');
    dev.admNotes.add(':Ar: :Word: Testing: #ALERT #NoAction.');
    dev.admNotes.add(':Ar: :Word: Testing: #ALL #Action.');
    dev.admNotes.add(':Ar: :Word: Testing: #ALL #NoAction.');
    dev.admNotes.add(':Ar: :Word: Testing: #ALL #NoAction.');
    dev.admNotes.add(':Ar: :#ORDER: Short names for coders to use.');

    dev.devNotes.add(':Ar: :TDev: Habits: keep 3 day off before new version.');
    dev.devNotes.add(':Ar: :TDev: Connect: Try to get :feedback: #Area.');
    dev.devNotes.add(':Ar: :Placement in time and area for objects.');
    dev.devNotes.add(':Ar: :Word: #Picker.');
    dev.devNotes.add(':Ar: :Performance: #?  #CL Long time to render.');
    dev.devNotes.add(':Ar: :NO: list for prohibited #Words for team.');
    dev.devNotes.add(':Ar: :YES: list for only-allowed #Words for team.');
    dev.devNotes.add(':Ar: :SHOW: method; parameter to give #Find this.');
    dev.devNotes.add(':Ar: :TEST:  Benchmark.');

    dev.innoNotes.add(':Ar: Incremented usage-counter in old notes.');
    dev.innoNotes.add(':Ar: Clean older notes or archive them.');
    dev.innoNotes.add(':Ar: Not allowed messages if at least one Legal word.');
    dev.innoNotes.add(':Ar: Words: ');
    dev.innoNotes.add(':Ar: Words: ## To mark word for consideration as key');
    dev.innoNotes.add(':Ar: Words: ##Carry in Rumba to medagte message.');
    dev.innoNotes.add(':Ar: Phraseoloy');
    dev.innoNotes.add(':Ar: #LowLevel talk for dev folks.');

    dev.howToNotes.add(':Ar: howTo fetch data via HTTP.');
    dev.howToNotes.add(':Ar: howTo   getfirst  changeable web pages.');
    dev.howToNotes.add(':Ar: howTo Gather devNotes by type.');
    dev.howToNotes.add(':Ar: howTo Classify devNotes by value.');
    dev.howToNotes.add(':Ar: howTo Add notes last in to list?');
    dev.howToNotes.add(':Ar: howTo Send #ALERT #ALL note to every List?');

    dev.secNotes.add(':Ar: #Numbers for #Event:s and #Msg :s. ');
    dev.secNotes.add(':Ar: #FlowC call check for extra innder calls.');
    dev.secNotes.add(':Ar: #Password.');
    dev.secNotes.add(':Ar: #Encrypt :ion.');
    dev.secNotes.add(':Ar: #Force render methods to leave #Stamp or #Logo.');
    dev.secNotes.add(':Ar:  #Force test methods to leave #Stamp or #Logo.');
    dev.secNotes.add(':Ar:  #Prevent deleting notes without notice.');
    dev.secNotes.add(':Ar:  Keep #Track of extra iterators in notes.');
    dev.secNotes.add(':Ar:  #encrypt ed notes not allowed.');

    //  build already does this  dev.buildNotes();
    flowC(':da:b: DawoApp::roll    $infoS   :: roll engaged ', pB);

    init(); //  calling init and build methods in this class
    build(':DAWO-APP:', 'DAWO-APP-MASTER:');

    //  Add code for roll.

    appRollMissions('C:DawoApp-roll ');
    rollStream();
    show();
    done();
    //  code here
    return outMapBuffers;
  }

  ///  Roll missions in missionL AND every chore in them.
  void appRollMissions(String caller) {
    String _msg = '\n -->>-->>---- app rollMissions  C: $caller -->>-->>----';
    flowC('$_msg', pB);
    // roll BLib-class (mission) actually List of missions!
    flowC('\n  ***  DAWO-APP  MISSIONS   ***  \n', pB);
    buildMissions('C:dawoApp ');

    ///  TODO Detail printing set false: pB; make better, global solution.
    ///  TODO  Make mission-report return list, for box-output.
    ///  TODO  buildDawo mission
    ///  Added 3. parameter, forceHeight
    ///  NOTE packDawo gets map printed.
    List list1 = packDawoMission.report('C:dawoApp-:rM:', true);
    List list2 = helsinkiMission.report('C:dawoApp-:rM:', pB);
    devBox('By; dawoApp-:rM:', [list1, list2], 9);

    List list3 = dartlangMission.report('C:dawoApp-:rM:', pB);
    List list4 = myMusicMission.report('C:dawoApp-:rM:', pB);
    devBox('By; dawoApp-:rM:', [list3, list4], 9);

    List list5 = myTimeMission.report('C:dawoApp-:rM:', pB);
    List list6 = nationalParksMission.report('C:dawoApp-:rM:', pB);
    devBox('By; dawoApp-:rM:', [list5, list6], 9);

    flowC('\n      --<----<-- app rollMissions  C: $caller --<----<--', pB);
    // roll all chores, that are in mission
  }

  ///  calling base>_lib commonStream, elementary Stream example
  void rollStream() {
    flowC('\n--- :stream:beg dawoApp rollStream started     ---', pB);
    // commonStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    commonStream('dawoApp', [agenda, msg, develop, version], 'appListener');
    flowC('\n--- :stream:end dawoApp rollStream done     ---', pB);
  }

  ///  Show-method to be developed further.
  void show() {
    if (pB) {
      print(buf);
      print('-->>-->>----  dawoApp show -->>-->>----');
      print(outTr);
      print('--<<--<<----  dawoApp show done --<<--<<----');
    }
  }

  ///  After presentation method; done, if #doneB.
  void done() {
    flowC('-->>-->>----  DawoApp.done    $infoS   :: engaged ', pB);
    outTl.writeln('outTl-dawoApp-done:');
    outTMid.writeln('outMid-dawoApp-done:');
    outTr.writeln('outTr-dawoApp-done:');
    outMTop.writeln('outtop-dawoApp-done:');
    outMid.writeln('outMid-dawoApp-done:');
    outMBot.writeln('outBot-dawoApp-done:');
    outBl.writeln('outBl-dawoApp-done:');
    outBr.writeln('outBr-dawoApp-done:');
    outFooter.writeln('outFooter-dawoApp-done:');
    //  code here
    flowC('  --<<--<<--  :da:b: --  DawoApp buffer output app: done  --', pB);
    if (pB) print(buf);
    //  buf.clear(); //  empty buffer
    flowC('     --<<--<<----  DawoApp.done  done  --<<--<<---- \n', pB);
  }

  DawoApp(this.name, this.agenda);
} //  ----------  class DawoApp

/// Models and sample maps ; for later usage and playing.
Map<String, String> appMap = {
  'name': 'dawo App',
  'infoS': 'dartang pub package for education',
  'creator': 'me',
  'version': '0.0.3',
  'active': '0',
  'stopped': '0',
  'paused': '0',
  'userChoise': '-',
  'autoChoise': '1'
};

/// TODO  teamInno    this map is for testing work-flow routines
Map<String, String> appPhaseM = {
  'closed': '',
  'dance': 'galop',
  'dancer': 'LateNightCoder',
  'tempo': '7',
  'time': '18',
  'active': '0',
  'paused': '0',
  'danceQueue: ': 'yes',
  'danceDone:  ': 'no',
  'stopped': '0'
};

/// Map to hold development status of this app / version.
Map<String, String> dawo003 = {
  'devStateNum': '99% to  0.0.3',
  'devSituation': 'Ready to Publish',

  ///  Find, where in my test-folders is THIS  version used?
  'version': '0.0.3',
  'published': 'Yes, Pub',

  ///  next-version-info might be useful for my different tests and devNotes
  'next version': '0.0.4. ~15.10.2017',

  'author': 'Heikki Lappalainen',
  'webPage': 'https://github.com/heiklap/dawo',
  'started': '15.7.2013   hkl  ',
  'purpose': 'Education, Learning  '
};

///  Every important library has it's own flowC function. #Library #Privacy!!
///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p) {
  ///  call flowServe with #LOCAL variables
  flowServe(':DAWO-APP:', outTr, msg, p);
}

///  To print outPutBuffers.  //  not called
///  TODO  Prevent temporarily usage of this.
///  TODO  Make header to show Buffers sizes.
void printBuffers(String caller, String notCalled) {
  print('\n -->>-->>----  :dawoApp: outBuffers  -->>-->>----');
  print('\n * * * * * * * * * *    outHeader   * * * * * * * * * *  ');
  print(outHeader);
  print('* * * * * * * * * *    outHeader   * * * * * * * * * *  ');

  print('\n * * * * * * * * * *    outTl   * * * * * * * * * *  ');
  print(outTl);
  print(' * * * * * * * * * *    outTl   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outTMid   * * * * * * * * * *  ');
  print(outTMid);
  print(' * * * * * * * * * *    outTMid   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outTr   * * * * * * * * * *  ');
  print(outTr);
  print(' * * * * * * * * * *    outTr   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outMTop   * * * * * * * * * *  ');
  print(outMTop);
  print('\n * * * * * * * * * *    outMTop   * * * * * * * * * *  ');

  print('\n * * * * * * * * * *    outMMid   * * * * * * * * * *  ');
  print(outMid);
  print(' * * * * * * * * * *    outMMid   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outMBot   * * * * * * * * * *  ');
  print(outMBot);
  print('* * * * * * * * * *    outMBot   * * * * * * * * * *  \n ');

  print('\n * * * * * * * * * *    outBl   * * * * * * * * * *  ');
  print(outBl);
  print('\* * * * * * * * * *    outBl   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outBr   * * * * * * * * * * ');
  print(outBr);
  print(' * * * * * * * * * *    outBr   * * * * * * * * * *  \n');

  print('\n * * * * * * * * * *    outFooter   * * * * * * * * * *  ');
  print(outFooter);
  print(' * * * * * * * * * *    outFooter   * * * * * * * * * *  \n');

  print('     --<<--<<----  :dawoApp: outBuffers  done  --<<--<<----   \n');
}

//
