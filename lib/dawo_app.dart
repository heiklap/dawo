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
import 'dawo_dev.dart';
import 'dawo_mission.dart';

// ignore: unused_field for those wondering.

///  Getter practice.
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  Buffer also outside class, for testing and adding visibility.
var appBuf = new StringBuffer();


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
    buf.writeln('init done');
  }

  ///  Method for setting class in working condition.
  void build() {
    offB = false; //  off-state ends
    onB = true; //   app is in on
    /// Write something #WakeUpSleepyHead to all out-buffers.
    outHeader.writeln('outHeader-dawoApp-build:');
    outTl.writeln('outTl-dawoApp-build:');
    outTMid.writeln('outMid-dawoApp-build:');
    outTr.writeln('outTr-dawoApp-build:');
    outMTop.writeln('outtop-dawoApp-build:');
    outMid.writeln('outMid-dawoApp-build:');
    outMBot.writeln('outBot-dawoApp-build:');
    outBl.writeln('outBl-dawoApp-build:');
    outBr.writeln('outBr-dawoApp-build:');
    outFooter.writeln('outFooter-dawoApp-build:');

    buf.writeln('build done');
  }

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> outMapBuffers
  Map<String, StringBuffer> roll() {
    dev.admNotes.add('>>  dawo_app is rolling  >>');
    dev.buildNotes();
    buf.writeln('DawoApp::roll    $infoS   :: roll engaged ');
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
    String _msg = '\n ************ app rollMissions  C: $caller ***************';
    flowC('$_msg', true);
    // roll BLib-class (mission) actually List of missions!
    flowC('\n  ***  DAWO-APP  MISSIONS   ***  \n', true);
    buildMissions('C:dawoApp ');

    helsinkiMission.report('C:dawoApp-RM');
    dartlangMission.report('C:dawoApp-RM');
    myMusicMission.report('C:dawoApp-RM');
    myTimeMission.report('C:dawoApp-RM');
    nationalParksMission.report('C:dawoApp-RM');

    print('\n **************   app rollMissions  C: $caller *************');
    // roll all chores, that are in mission
  }

  ///  calling base>_lib commonStream, elementary Stream example
  void rollStream() {
    flowC('\n--- :stream:beg dawoApp rollStream started     ---', true);
    // commonStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    commonStream('dawoApp', [agenda, msg, develop, version], 'appListener');
    print('\n--- :stream:end dawoApp rollStream done     ---');
  }

  ///  Show-method to be developed further.
  void show() {
    print(buf);
    print('------------------------');
    print(outTr);

  }

  ///  After presentation method; done, if #doneB.
  void done() {
    print('DawoApp::done    $infoS   :: engaged ');
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
    buf.write('---  DawoApp buffer output app: done  ---');
    print(buf);
    //  buf.clear(); //  empty buffer
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

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p){
  ///  call flowServe with #LOCAL variables
  flowServe(':DAWO-APP:', outTr  , msg, p);
}

///  To print outPutBuffers.
void printBuffers() {
  print('\n .......  dawoApp outBuffers  ............................');
  print(outHeader);
  print('.. outHeader  .................................');

  print(outTl);
  print('.. outTl .................................');

  print(outTMid);
  print('.. outTMid .................................');

  print(outTr);
  print('..  outTr  .................................');

  print(outMTop);
  print('.. outMTop  .................................');

  print(outMid);
  print('..  outMid  .................................');

  print(outMBot);
  print('..  outMBot  .................................');

  print(outBl);
  print('..  outBl  .................................');

  print(outBr);
  print('..  outBr  .................................');

  print(outFooter);
  print('..  outFooter  .................................');
  print('.......  dawoApp outBuffers  done  ...................... \n');
}

//
