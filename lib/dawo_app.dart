///  ##  App class
///  Primary functionality:  engage missions.
///  Some information about app, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
/// * ReadyState:   99 %  for version 0.0.2   in GitHub  yes
/// * hkl  3.5.2014  0.0.1  dawo/lib  dawo_app.   base status of dawo
///  Almost all parts changed to libraries

library dawo_app.dart;

import 'base_struct.dart';
import 'dawo_dev.dart';
import 'dawo_mission.dart';

// ignore: unused_field for those wondering

///  getter practice
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  buffer also outside class, for testing and adding visibility
var appBuf = new StringBuffer();

///  10 StringBuffers named for output to screen areas
StringBuffer outHeader = new StringBuffer();
StringBuffer outTl = new StringBuffer();    //  rumba
StringBuffer outTMid = new StringBuffer();
StringBuffer outTr = new StringBuffer();    //  appRoll
StringBuffer outMTop = new StringBuffer();  //  helsinki
StringBuffer outMid = new StringBuffer();   //  dartlang
StringBuffer outMBot = new StringBuffer();  //  n-parks
StringBuffer outBl = new StringBuffer();
StringBuffer outBr = new StringBuffer();
StringBuffer outFooter = new StringBuffer();

///  Just for testing private variable inside a library.
String _privacyLibraryTest = 'Testing library / part privacy';

///  Every important dawo Class extends BaseStruct abstract class.
///  Class that holds 'soul' of THIS dawo app.
class DawoApp extends BaseStruct {
  String name = 'dawo app';
  String infoS = 'giving global variables to dawo_src.dart';
  String motto = 'collect them here and rule them..';

  ///  must initialize StringBuffer here
  StringBuffer buf = new StringBuffer();

  ///  controlling app state, working-condition-state values
  bool offB = true;
  bool onB = false;
  bool pauseB;
  bool doneB = false;



  ///  organize out-buffers to Map for return
  Map<String, StringBuffer> outMapBuffers = {
           'outHeader':  outHeader,
           'outTl':  outTl,
           'outTMid':  outTMid,
           'outTr':  outTr,
           'outMTop':  outMTop,
           'outMid':  outMid,
           'outMBot':  outMBot,
           'outBl':  outBl,
           'outBr':  outBr,
           'outFooter':  outFooter
  };




  ///  app-specified fields
  String agenda = 'using app in dawo package';
  String msg = 'Message..';
  String develop = 'Under development.. 30% to:  0.0.3';
  String version = '0.0.2';

  ///  Old marking to find usage of this version in test apps.
  final String version_0_0_02 = 'dawo 0.0.02 - 12 / 2013 hkl';
  String thisVersion; //  users announce their version of dawo
  String latestChange = '23.3.2017. th.12.15';

  ///  initialize class values to beginning state
  void init() {
    //TODO  set some field values
    buf.writeln('---  DawoApp buffer output initialized  ---');

    //  set fields values
    buf.writeln('init done');
  }

  ///  method for setting class in working condition
  void build() {
    offB = false; //  off-state ends
    onB = true; //   app is in on
    /// write something to all out-buffers
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
  Map roll() {
    dev.admNotes.add('>>  dawo_app is rolling  >>');
    dev.buildNotes();
    buf.writeln('DawoApp::roll    $infoS   :: roll engaged ');
    init(); //  calling init and build methods in this class
    build();
    //  code for roll

    rollMissions('C:DawoApp-roll ');

    show();
    done();
    //  code here
    return outMapBuffers;
  }

  ///  roll missions in missionL AND every chore in them
  void rollMissions(String caller) {
    print('\n ************ app rollMissions  C: $caller *****************');
    // roll BLib-class (mission) actually List of missions!
    print('\n  ***  DAWO-APP  MISSIONS   ***  \n');
    buildMissions('C:dawoApp ');

    helsinkiMission.report('C:dawoApp-RM');
    dartlangMission.report('C:dawoApp-RM');
    myMusicMission.report('C:dawoApp-RM');
    myTimeMission.report('C:dawoApp-RM');
    nationalParksMission.report('C:dawoApp-RM');

    print('\n **************   app rollMissions  C: $caller *************');
    // roll all chores, that are in mission
  }

  ///  Show method to be developed further.
  void show() {
    print(buf);
  }

  ///  presentation method
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

/// models and sample maps ; for later usage and playing
Map<String, String> appMap = {
  'name': 'dawo App',
  'infoS': 'dartang pub package for education',
  'creator': 'me',
  'version': '0.0.2',
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

/// map to hold development status of this app / version
Map<String, String> dawo002M = {
  'devStateNum': '99% to  0.0.2',
  'devSituation': 'Ready to Publish',

  ///  Find, where in my test-folders is THIS  version used?
  'version': '0.0.2',
  'published': 'Yes, Pub',

  ///  next-version-info might be useful for my different tests and devNotes
  'next version': '0.0.3. ~25.9.2017',

  'author': 'Heikki Lappalainen',
  'webPage': 'https://github.com/heiklap/dawo',
  'started': '15.7.2013   hkl  ',
  'purpose': 'Education, Learning  '
};

//
