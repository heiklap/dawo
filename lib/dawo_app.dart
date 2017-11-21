// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  App class
///  Primary functionality:  engage missions.
///  Some information about app, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
///  dawo version:  0.0.5  6.11.2017
/// * ReadyState:  for version 0.0.6  0%  in GitHub  yes
/// * hist>  3.5.2014  0.0.1  dawo/lib  dawo_app.   basic status of dawo
//

library dawo_app.dart;

import 'alpha.dart';
import 'beta.dart';
import 'shower.dart';

import 'mis/chore.dart';
import 'mis/missions.dart';

//  import 'corp/connector.dart';
import 'corp/store.dart';

import 'dev/dawo_dev.dart';

import 'src/glb.dart';

// ignore: unused_field for those wondering.
//  Word: stream  9 times
///  TODO  Add all those nice boxes, schedule, aso here, or think flow better.

///  Getter practice.
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  Buffer also outside class, for testing and adding visibility.
var appBuf = new StringBuffer();
bool _pB = false; //  No printing now.

///  Every important dawo Class extends BaseStruct abstract class.
///  Class that holds 'soul' of THIS dawo app.
class DawoApp extends BaseStruct {
  String name = 'dawo app';
  String actor = ':DAWO-APP:';
  String infoS = 'giving usable variables to dawo_src.dart';
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

  ///  Organize out.out-buffers to Map for return to package users.
  Map<String, StringBuffer> outMapBuffers = {
    'outHeader': out.outHeader, //  app - roll

    'outTl': out.outTl, //  rumba
    'outTMid': out.outTMid, //   mission
    'outTr': out.outTr, //  dawo-app  dev

    'outMTop': out.outMTop, //   m - packDawo
    'outMid': out.outMid, //  m - dartlang
    'outMBot': out.outMBot, //  m - helsinki

    'outBl': out.outBl, //  m - myMusic
    'outBr': out.outBr, //  m - myTime

    'outFooter': out.outFooter // m -  nParks
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

  //  Setting value for console
  // printing in flowC / flowS. TODO  hklGTry
  void printControl(bool pc) {
    _pB = pc;
    print(':printControl: set to:  $pc');
  }

  ///  Initialize class values to beginning state.
  void init() {
    //  TODO  Actor:  only one actor for now...
    glb.changeActor(':DAWO-APP:');
    //  TODO  Set some field values.
    _flowC('  -->-da->  DawoApp buffer output initialized  ---', _pB);

    //  Set fields values.
    _flowC('  --<-da-<    :da:b: init done', _pB);
  }

  ///  Method for setting class in working condition.
  void build(String emblem, String master) {
    ///  NOTE empty parameter now, not used. For chore.build.
    offB = false; //  off-state ends
    onB = true; //   app is in on

    ///  Build DevNotes.
    dev.buildNotes('By: :D:-A:', 'In Dawo-App-Build');
    initChoreSystem();

    /// Write something #WakeUpSleepyHead to all out.out-buffers.
    out.outHeader.writeln('* * * :out.outHeader:buf: -dawoApp-build:  * * * ');
    out.outTl.writeln('* * * :out.outTl:buf:  -dawoApp-build:  * * * ');
    out.outTMid.writeln('* * * :out.outTMid:buf:  -dawoApp-build:  * * * ');
    out.outTr.writeln('* * * :out.outTr:buf:   -dawoApp-build:  * * * ');

    out.outMTop.writeln('* * * :out.outMTop:buf  -dawoApp-build:  * * * ');
    out.outMid.writeln('* * * :out.outMid:buf:  -dawoApp-build:  * * * ');
    out.outMBot.writeln('* * * :out.outMBot:buf:  -dawoApp-build:  * * * ');

    out.outBl.writeln('* * * :out.outBl:buf  -dawoApp-build:  * * * ');
    out.outBr.writeln('* * * :out.outBr:buf:  -dawoApp-build:  * * * ');
    out.outFooter.writeln('* * * :out.outFooter:buf: -dawoApp-build:  * * * ');

    out.outHeader.writeln('       * * * : app-roll stuff:  * * * ');
    out.outTl.writeln('       * * * : rumba stuff :  * * * ');
    out.outTMid.writeln('* * * : mission stuff:  -dawoApp-build:  * * * ');
    out.outTr.writeln('* * * : dawo-app stuff :  * * * ');

    out.outMTop.writeln('* * * :pack-dawo stuff : -dawoApp-build:  * * * ');
    out.outMid.writeln('     * * * :dartlang stuff:  -dawoApp-build:  * * * ');
    out.outMBot.writeln('   * * * : helsinki stuff:  -dawoApp-build:  * * * ');

    out.outBl.writeln('* * * : my-music-stuff :  -dawoApp-build:  * * * ');
    out.outBr.writeln('* * * : my-time stuff :  -dawoApp-build:  * * * ');
    out.outFooter.writeln('* * * :nat-parks stuff: -dawoApp-build:  * * * ');
    _flowC('  --<-da-<  :da:b:  build done', _pB);
  }

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> out.outMapBuffers
  Map<String, StringBuffer> roll() {
    dev.admN
      ..add('>>ADM:CHECK-IN  dawo_app-roll  >>')
      ..add(':Ar: = in App-Roll. Mark value number: #7: ')
      ..add(':Ar: :Word: Testing: #ALERT #NoAction.')
      ..add(':Ar: :Word: Testing: #ALL #Action.')
      ..add(':Ar: :Word: Testing: #ALL #NoAction.')
      ..add(':Ar: :Word: Testing: #ALL #NoAction.')
      ..add(':Ar: :#ORDER: Short names for coders to use.');

    dev.devN
      ..add(':Ar: :TDev: Habits: keep 3 day off before new version.')
      ..add(':Ar: :TDev: Connect: Try to get :feedback: #Area.')
      ..add(':Ar: :Placement in time and area for objects.')
      ..add(':Ar: :Word: #Picker.')
      ..add(':Ar: :Performance: #?  #CL Long time to render.')
      ..add(':Ar: :NO: list for prohibited #Words for team.')
      ..add(':Ar: :YES: list for only-allowed #Words for team.')
      ..add(':Ar: :SHOW: method; parameter to give #Find this.')
      ..add(':Ar: :TEST:  Benchmark.');

    dev.innoN
      ..add(':Ar: Incremented #Number in new notes.')
      ..add(':Ar: Clean older notes or archive them.')
      ..add(':Ar: Not allowed messages if at least one Legal word.')
      ..add(':Ar: Words: ')
      ..add(':Ar: Words: ## To mark word for consideration as key.')
      ..add(':Ar: Words: ##Carry : R:mediate message to #receiver.')
      ..add(':Ar: Phraseology.')
      ..add(':Ar: #LowLevel talk for dev folks.');

    dev.howToN
      ..add(':Ar: howTo fetch data via HTTP.')
      ..add(':Ar: howTo   getfirst  changeable web pages.')
      ..add(':Ar: howTo Gather devNotes by type.')
      ..add(':Ar: howTo Classify devNotes by value.')
      ..add(':Ar: howTo Add notes last in to list?')
      ..add(':Ar: howTo Send #ALERT #ALL -note => to every List?');

    dev.secN
      ..add(':Ar: #Numbers for #Event:s and #Msg :s. ')
      ..add(':Ar: #FlowC call check for extra innder calls.')
      ..add(':Ar: #Password.')
      ..add(':Ar: #Encrypt :ion.')
      ..add(':Ar: #Force render methods to leave #Stamp or #Logo.')
      ..add(':Ar:  #Force test methods to leave #Stamp or #Logo.')
      ..add(':Ar:  #Prevent deleting notes without notice.')
      ..add(':Ar:  Keep #Track of extra iterators in notes.')
      ..add(':Ar:  #encrypt ed notes not allowed.');

    //  build already does this  dev.buildNotes();
    _flowC(':da:b: DawoApp::roll    $infoS   :: roll engaged ', _pB);

    init(); //  calling init and build methods in this class
    build(':DAWO-APP:', 'DAWO-APP-MASTER:');

    //
    print('-->>-->>--  :dawoapp: calling :collector:  -->>-->>--');
    //  String connectorMsg = ':LOAD :QUIDE again :FOR :ALL #MISSION => :ANSWER';
    //  :dawolang:debug:
    //con.opJoin(betaPlacardM, connectorMsg, ':D:app:');
    //con.roll();

    //  Add code for roll.

    appRollMissions(':DA:-roll ');
    rollStream(':D-A:roll:');
    devStream(':D-A:roll:'); //  TODO  Temp  devStream rolled
    show();
    done();
    //  code here
    return outMapBuffers;
  }

  ///  Roll missions in missionL AND every chore in them.
  void appRollMissions(String caller) {
    String _msg = '-->-da-> app rollMissions  C: $caller -->>-->>----';
    _flowC('$_msg', _pB);
    // roll BLib-class (mission) actually List of missions!
    _flowC('  ***  DAWO-APP  MISSIONS   ***  ', _pB);
    buildMissions('C:dawoApp ');

    ///  TODO Detail printing set false: _pB; make better, valuable solution.
    ///  TODO  Make mission-report return list, for box-output.
    ///  TODO  buildDawo mission
    ///  Added 3. parameter, forceHeight
    ///  NOTE packDawo gets map printed.
    List list1 = packDawoMission.report('C:dawoApp-:rM:', true);
    List list2 = helsinkiMission.report('C:dawoApp-:rM:', _pB);
    devBox('By; dawoApp-:rM:', [list1, list2], 9);

    List list3 = dartlangMission.report('C:dawoApp-:rM:', _pB);
    List list4 = myMusicMission.report('C:dawoApp-:rM:', _pB);
    devBox('By; dawoApp-:rM:', [list3, list4], 9);

    List list5 = myTimeMission.report('C:dawoApp-:rM:', _pB);
    List list6 = nationalParksMission.report('C:dawoApp-:rM:', _pB);
    devBox('By; dawoApp-:rM:', [list5, list6], 9);

    ///  Loop for handling user-actions in Missions.
    //  --
    //  while..
    //  Loop handler
    //  Choose Mission
    //  code
    //  endLoop

    _flowC('      --<----<-- app rollMissions  C: $caller --<----<--', _pB);
    // roll all chores, that are in mission
  }

  ///  TODO devStream  building stream for dev, using elementary Stream example
  ///  DONE Adding caller-parameter
  ///  TODO  WHO IS CALLING THIS ?  Nobody
  void devStream(String caller) {
    _flowC(
        '--- :stream:beg dawoApp rollStream started by: $caller    ---', _pB);
    _flowC(
        '--- :stream:beg dawoApp rollStream started by: $caller    ---', true);
    // demandStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    store.demandStream(
        ':dawoApp:d-s', [agenda, msg, develop, version, msg], 'appListener');
    store.demandStream(
        ':dawoApp:d-s', ['First Book', 'My Book', 'Third Book'], 'appListener');
    _flowC('--- :stream:end dawoApp rollStream done     ---', _pB);
  }

  ///  calling beta demandStream, elementary Stream example
  ///
  ///  #TODO  make this use #iterable parameter; dev.admN / where #ALL
  ///
  void rollStream(String _cl) {
    _flowC('--- :stream:beg dawoApp rollStream started by: $_cl    ---', _pB);
    // demandStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    store.demandStream(
        ':dawoApp-r:s:', [agenda, msg, develop, version], 'appListener');

    ///  calling stream on dev.admN list certain items:
    ///  insertAll(int index, Iterable<E> iterable) → void
    ///  Create List, that is used in Stream.
    List<String> _queryL = ['* First _queryL item *'];

    //  TODO  make common procedure for to find #Lang #word's.
    for (var x = 0; x < dev.admN.length; x++) {
      if (dev.admN[x].indexOf('schedule') > -1) {
        _queryL.add(dev.admN[x]);
      }
    }
    //  When using : StrInList in tools:
    //  _queryL.addAll(tl.StrInList(dev.admN, 'schedule'));
    //  store demandStream acts nicely with 0-length list

    store.demandStream(':dawoApp-r:s:ADM:', _queryL, 'appListener');
    //  TODO Stream: meaningful : streams from doneL / devN important
    _flowC('--- :stream:end dawoApp rollStream done  by: $_cl    ---', _pB);
  }

  ///  Show-method to be developed further.
  void show() {
    if (_pB) {
      print(buf);
      print('-->>-->>----  dawoApp show -->>-->>----');
      print(out.outTr);
      print('--<<--<<----  dawoApp show done --<<--<<----');
    }
  }

  ///  After presentation method; done, if #doneB.
  void done() {
    _flowC('-->-da->  DawoApp.done    $infoS   :: engaged ', _pB);
    out.outTl.writeln('out.outTl-dawoApp-done:');
    out.outTMid.writeln('out.outMid-dawoApp-done:');
    out.outTr.writeln('out.outTr-dawoApp-done:');
    out.outMTop.writeln('out.outtop-dawoApp-done:');
    out.outMid.writeln('out.outMid-dawoApp-done:');
    out.outMBot.writeln('out.outBot-dawoApp-done:');
    out.outBl.writeln('out.outBl-dawoApp-done:');
    out.outBr.writeln('out.outBr-dawoApp-done:');
    out.outFooter.writeln('out.outFooter-dawoApp-done:');
    //  code here
    _flowC('  --<-da-<  :da:b: --  DawoApp buffer output app: done  --', _pB);
    if (_pB) print(buf);
    //  buf.clea--<-da-<  DawoApp.done  done  --<<--<<---- ', _pB);
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
///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right.
void _flowC(String msg, bool p) {
  ///  call flowServe with #LOCAL variables
  ///  :DAWO-APP:  is too long.
  flowServe(':D-A:', out.outTr, msg, p);
}

///  To print outPutBuffers.  //  not called
///  Using new outBufM Map
///  TODO  Make this show in proper screen areas with devBox.
void outBuffersPrint(String caller, String notCalled) {
  print(' -->>-->>----  :D-A:   out.outBuffers  by: $caller  -->>-->>-- ');
  int i = 0;
  int mLength = out.outBufM.length;
  for (var x = 0; x < mLength; x++) {
    String _bufNameS = out.outBufM.keys.elementAt(i);
    i++;
    print('\n * * * * * * * * * *    $_bufNameS   * * * * * * * * * *  ');

    print(out.outBufM[_bufNameS]); //  print

    print('* * * * * * * * * *    $_bufNameS   done  * * * * * * *  ');
  }

  print('     --<<--<<----  :D-A:   out.outBuffers  C: $caller  done ');
}

//
