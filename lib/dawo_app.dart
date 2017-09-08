///  ##  App class
///  Some information about app, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
/// * ReadyState:   95 %  for version 0.0.1   in GitHub  yes
/// * hkl  3.5.2014  0.0.1  dawo/lib  dawo_app.   base status of dawo
///  Almost all parts changed to libraries

library dawo_app.dart;

import 'base_struct.dart';

// ignore: unused_field for those wondering

///  getter practice
num dawoAppReadiness = 95; //  changed: 2.5.2015

var appBuf = new StringBuffer();

///
String _privacyLibraryTest = 'Testing library / part privacy';

///  This abstract class has wiped out
//  abstract class DawoAppBase extends baseStruct {


///  class that holds 'soul' of THIS dawo app
class DawoApp extends baseStruct {
  //  overrides DawoAppBase fields
  String name = 'dawo app';
  String info = 'giving global variables to dawo_src.dart';
  String motto = 'collect them here and rule them..';

  ///  must initialize StringBuffer here
  StringBuffer buf = new StringBuffer();

  bool offB = true;
  bool onB = false;
  bool pauseB;
  bool doneB = false;

  ///  app-specified fields
  String agenda = 'using app in dawo package';
  String msg = 'Message..';
  String develop = 'Under development.. 30% to:  0.0.2';
  String version = '0.0.1';
//  Old marking to find usage of this version in test apps.
  final String version_0_0_02 = 'dawo 0.0.02 - 12 / 2013 hkl';
  String thisVersion; //  users announce their version of dawo
  String latestChange = '23.3.2017. th.12.15';


  ///  initialize class values to beginning state
  void init(){
    //TODO  set some field values
    buf.writeln('---  DawoApp buffer output initialized  ---');

    //  set fields values
    buf.writeln('init done');
  }
  ///  method for setting class in working condition
  void build(){
    offB = false;   //  off-state ends
    onB = true;     //   app is in on
    buf.writeln('build done');
  }
  ///  #run-like method
  void roll(){
    buf.writeln('DawoApp::    $info   :: roll engaged ');
    init();   //  calling init and build methods in this class
    build();
    //  code for roll
    //  rollMissions
    show();
    done();
    //  code here
  }

  ///  roll missions in missionL AND every chore in them
  void rollMissions() {
    // roll BLib-class (mission) actually List of missions!
    // roll all chores, that are in mission
  }


  void show(){
    print(buf);
  }
  ///  presentation method
  void done(){
    print('DawoApp::    $info   :: engaged ');
    //  code here
    buf.write('---  DawoApp buffer output app: done  ---');
    print(buf);
    buf.clear();  //  empty buffer
  }

  DawoApp(this.name, this.agenda);
}

//TODO  teamInno    -------- plan for controlling  this apps states and behaviour
///     low level work-flow "flags" are in dawlib.....
///  will eventually be some kind of #mill, that controls all #job's
///  keeps track of the privileges and performance of the assignments.
///  names might be:  millRoll  and millFlag
class DawoFlag {
  int tempo = 6;
  int rounds = 1;

  int jobInQueue = 0;
  int jobsDone = 0;

  bool on = false;
  bool active = false;
  bool paused = false;
  bool stopped = false;


  String userChoice = '-';
  String autoChoice = '1';

  void roll(){
    print('DawoFlag::  $tempo  $rounds    :: engaged ');
    //  code here
  }
}

/// models and sample maps ; for later usage and playing
Map<String, String> appMap = {
  'name': 'dawo App',
  'info': 'dartang pub package for education',
  'creator': 'me',
  'version': '0.0.1',
  'active': '0',
  'stopped': '0',
  'paused': '0',
  'userChoise': '-',
  'autoChoise': '1'
};

/// TODO  teamNext  for to use in next versions
/// NOTE:  int '1'  do not give error...  how about int?
Map<int, String> flagMap = {
  '1': 'M',
  '2': 'T',
  '3': 'W',
  '4': 'T',
  '5': 'F',
  '6': 'S',
  '7': 'S',
  '8': 'X',
  '9': 'X'
};

/// TODO  teamInno    this map is for testing work-flow routines
Map<String, String> appPhase = {
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
Map<String, String> dawo001 = {
  'devStateNum': '94% to  0.0.1',
  'devSituation': 'Under development',

  ///  Find, where in my test-folders is THIS  version used?
  'version': '0.0.01',
  'published': 'Yes, Pub',

  ///  next-version-info might be useful for my different tests and devNotes
  'next version': '0.0.2. ~ 20.09.2015',

  'author': 'Heikki Lappalainen',
  'webPage': 'https://github.com/heiklap/dawo',
  'started': '15.7.2013   hkl  ',
  'purpose': 'Education  '
};

//
