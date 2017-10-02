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
import 'dawo_mission.dart';

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

  ///  must initialize StringBuffer here
  StringBuffer buf = new StringBuffer();

  ///  Controlling app state, working-condition-state values.
  bool offB = true;
  bool onB = false;
  bool pauseB;
  bool doneB = false;

  ///  Organize out-buffers to Map for return to package users.
  Map<String, StringBuffer> outMapBuffers = {
    'outHeader': outHeader,
    'outTl': outTl,
    'outTMid': outTMid,
    'outTr': outTr,
    'outMTop': outMTop,
    'outMid': outMid,
    'outMBot': outMBot,
    'outBl': outBl,
    'outBr': outBr,
    'outFooter': outFooter
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
    buf.writeln('---  DawoApp buffer output initialized  ---');

    //  Set fields values.
    buf.writeln(':da:b: init done');
  }

  ///  Method for setting class in working condition.
  void build() {
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
    outMTop.writeln('* * * :outtMop:buf  -dawoApp-build:  * * * ');
    outMid.writeln('* * * :outMid:buf:  -dawoApp-build:  * * * ');
    outMBot.writeln('* * * :outMBot:buf:  -dawoApp-build:  * * * ');
    outBl.writeln('* * * :outBl:buf  -dawoApp-build:  * * * ');
    outBr.writeln('* * * :outBr:buf:  -dawoApp-build:  * * * ');
    outFooter.writeln('* * * :outFooter:buf:  -dawoApp-build:  * * * ');

    buf.writeln(':da:b:  build done');
  }

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> outMapBuffers
  Map<String, StringBuffer> roll() {
    dev.admNotes.add('>>ADM:CHECK-IN  dawo_app-roll  >>');

    //  build already does this  dev.buildNotes();
    buf.writeln(':da:b: DawoApp::roll    $infoS   :: roll engaged ');
    init(); //  calling init and build methods in this class
    build();
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

    ///  TODO Detail printing set false; make better, global solution.
    ///  TODO  Make mission-report return list, for box-output.
    helsinkiMission.report('C:dawoApp-RM', false);
    dartlangMission.report('C:dawoApp-RM', false);
    myMusicMission.report('C:dawoApp-RM', false);
    myTimeMission.report('C:dawoApp-RM', false);
    nationalParksMission.report('C:dawoApp-RM', false);

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
    buf.write(':da:b: ---  DawoApp buffer output app: done  ---');
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
