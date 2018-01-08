// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawoApp class
///  Primary functionality:  build, roll and rollMissions.
///  Information about app, hist, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
/// * dawo version:  0.0.75.  -  8.1.2018
/// * devState : 25%    in GitHub : yes
/// * NEXT:  Reconstruct class.  Separate hist to own class.
/// * Problem: dawoApp not instantiated; no access to dawo.version aso.
// hist>  3.5.2014  0.0.1  dawo/lib  dawo_app.   basic status of dawo
//

library dawo_app.dart;

import 'alpha.dart';
import 'beta.dart';
import 'shower.dart';

import 'mis/chore.dart';
import 'mis/missions.dart';

import 'corp/connector.dart';
import 'corp/store.dart';

import 'dev/dawo_dev.dart';

import 'src/glb.dart';

//  for box_serve:
import 'tools.dart';
import 'src/box_serve.dart';

// ignore: unused_field for those wondering.
//  Word: stream  9 / 32  times

///  Getter practice.
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  Buffer also outside class, for testing and adding visibility.
var appBuf = new StringBuffer(); //  not used here

//  TODO  DawoApp class to reconstruct and maybe split to 2.
///  Important dawo Class extends BaseStruct abstract class. (Not Mission!)
///  Class that holds 'soul' of THIS dawo app.
///  Controls Mission-Chore system, #App, & dawo-package development, #Pack.
///  Stop using: extends BaseStruct: constructor / init is not handy
class DawoApp  {
  final String name = 'DawoApp';
  final String version = '0.0.75';
  final String by = 'HKL';
  final String actor = ':DAWO:APP:';
  final String info = 'Innovative & educational small data-handler experimentation.';
  ///  Fields used in init
  String user = ':User:of:dawoApp:';
  String motto = 'Walk the path of innovation and learning..';

  /// Fields describe actions in connector and binding.
  /// This is the language, that app talks in different situations.
  Map<String, String> say = {
    'purpose': ':dawoApp :engage :TextBased dawo-mission-chore system',
    'lang': ':SAMPKLE :LANG :DAWOLANG :TALK :CONTROL :COMMAND :MASTER',
    'area': ':MISSION  :CHORE :APP :HISTORY :CORPORATE :WEB :SERVER :CL',
    'product': ':CORPORATE :PROMOTION :DEV :CHORE',
    'sell': ':UPGRADE :SPECIAL_MODEL :RENT_ME :PRO-VERSION ;',
    'buy': ':ADVICE :FREE-CODE :EXTRA_VERSION :TIME',
    'ask': ':WhatEver :WEB_VERSION :LECTURE :EDUCATION',
    'always': ':Developing :New :Innovation :Suprise :Enthusiasm ',
    'newer': ':NO :UGLY :HUILO :FUDD :SAD :GIVE-UP'
  };


  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  //  like:  ":DAWO-APP:";///  must initialize StringBuffer here
  String seal;
  //  or this emblem.StringBuffer buf = new StringBuffer();
  final String emblem = ':DA:';
  // like:  "      ";  3-5-7 empty marks or something visible.
  String indent;

  bool _pB = false; //  No printing now.
  StringBuffer buf = new StringBuffer();

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': true,
    'work': false,
    'pause': false,
    'done': false,
  };


  ///  Package material:
  Map<String, String> pack = {
    'agenda': 'dawoApp rolls missioms',
    'msg': 'dawoApp-Message..',
    // :DEBUG:TEST:   Who uses this??  --- :stream: #phase:1 bLib:demandStream Listened
    'develop': 'Under development.. 0 % to:  0.0.7+ ',
   // :DEBUG:TEST:   Who uses this??  :  :stream: #phase:1 bLib:demandStream Listened
    'pack: version': ' pack: 0.0.75 ',
    '': '',
  };


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
  //  String agenda = 'dawoApp rolls missions';
  //  String msg = 'dawoApp-Message..';
  //  String develop = 'Under development.. 0 % to:  0.0.7+ ';
  //  String version = '0.0.75 ';

  //  Setting value for console
  // printing in flowC / flowS. TODO  hklGTry
  void printControl(bool pc) {
    _pB = pc;
    print(':printControl: set to:  $pc');
  }

  ///  Initialize class values to beginning state.
  ///  Start using parameters:  String _user, _motto  ?
  void init(String _user, _motto) {
    //  TODO  Actor:  only one actor for now... But class Actor in alpha.dart
    glb.changeActor(':DAWO-APP:');
    user = _user;
    motto = _motto;
    st['wake'] = true;
    //  TODO  Set some field values.
    _flowC('  -->-da->  DawoApp buffer output initialized  ---', _pB);

    //  Set fields values.
    _flowC('  --<-da-<    :da:b: init done', _pB);
  }

  ///  Method for setting class in working condition.
  void build(String emblem) {
    ///  NOTE empty parameter now, not used. For chore.build.
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   working state begins

    ///  Build DevNotes.
    dev.buildNotes('By: :D:-A:', 'In Dawo-App-Build');
    initChoreSystem(); //  just ome notes to chore...

    /// Write something #WakeUpSleepyHead to all out.out-buffers.
    out.outHeader.writeln('* * * :out.outHeader:buf: :dawoApp:build:  * * * ');
    out.outTl.writeln('* * * :out.outTl:buf:  :dawoApp:build:  * * * ');
    out.outTMid.writeln('* * * :out.outTMid:buf:  :dawoApp:build:  * * * ');
    out.outTr.writeln('* * * :out.outTr:buf:   :dawoApp:build:  * * * ');

    out.outMTop.writeln('* * * :out.outMTop:buf  :dawoApp:build:  * * * ');
    out.outMid.writeln('* * * :out.outMid:buf:  :dawoApp:build:  * * * ');
    out.outMBot.writeln('* * * :out.outMBot:buf:  :dawoApp:build:  * * * ');

    out.outBl.writeln('* * * :out.outBl:buf  :dawoApp:build:  * * * ');
    out.outBr.writeln('* * * :out.outBr:buf:  :dawoApp:build:  * * * ');
    out.outFooter.writeln('* * * :out.outFooter:buf: :dawoApp:build:  * * * ');

    out.outHeader.writeln('       * * * : app-roll stuff:  * * * ');
    out.outTl.writeln('       * * * : rumba stuff :  * * * ');
    out.outTMid.writeln('* * * : mission stuff:  :dawoApp:build:  * * * ');
    out.outTr.writeln('* * * : dawoApp stuff :  * * * ');

    out.outMTop.writeln('* * * :packDawo stuff : :dawoApp:build:  * * * ');
    out.outMid.writeln('     * * * :dartlang stuff:  :dawoApp:build:  * * * ');
    out.outMBot.writeln('   * * * : helsinki stuff:  :dawoApp:build:  * * * ');

    out.outBl.writeln('* * * : myMusic-stuff :  :dawoApp:build:  * * * ');
    out.outBr.writeln('* * * : myTime stuff :  :dawoApp:build:  * * * ');
    out.outFooter.writeln('* * * :natParks stuff: :dawoApp:build:  * * * ');
    _flowC('  --<-da-<  :da:b:  build done', _pB);
  }

  ///  Roll, next, calls this.
  void fillNotes() {
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
      ..add('full of extensions, macros, rules, and more.  bazel')
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
  }

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> out.outMapBuffers
  Map<String, StringBuffer> roll() {
    fillNotes();
    //  build already does this  dev.buildNotes();
    _flowC(':da:b: DawoApp::roll    $info   :: roll engaged ', _pB);

    // done by user  init(); //  calling init and build methods in this class
    build(':DAWO-APP:');
    //
    print('-->>-->>--  :dawoapp: calling :connector:  -->>-->>--');
    String connectorMsg = ':LOAD :QUIDE again :FOR :ALL #MISSION => :ANSWER';
    connector.join(name, betaPlacardM, connectorMsg, ':D:app:');
    connector.roll();
    ///  appRollMissions is mandatory for Mission-Chore system to work.
    ///  Made private with: _  =>   _appRollMissions.
    _appRollMissions(':DA:roll:'); //
    rollStream(':DA:roll:2');
    devStream(':DA:roll:3'); //  TODO  Temp  devStream rolled
    show('noPrint, buf, test');
    box(':dawo:app:roll:');
    ///  This is not "terminate".
    done();
    //  code here
    return outMapBuffers;
  }

  ///  This is mandatory for Mission-Chore system to work.
  ///  Roll missions in missionL AND every chore in them.
  void _appRollMissions(String caller) {
    String _msg = '-->-da-> app rollMissions  C: $caller -->>-->>----';
    _flowC('$_msg', _pB);
    // roll BLib-class (mission) actually List of missions!
    _flowC('  ***  DAWO-APP  MISSIONS   ***  ', _pB);

    ///  Calling method in missions.dart
    buildMissions('C:dawoApp ');

    ///  TODO Detail printing set false: _pB; make better, valuable solution.
    ///  TODO  Make mission-report return list, for box-output.
    ///  TODO  buildDawo mission
    ///  Added 3. parameter, forceHeight
    ///  NOTE packDawo gets map printed.
    print(packDawoMission.placardM);
    List list1 = packDawoMission.report('C:dawoApp:rM:', true);
    List info1 = tl.mapToFineList(packDawoMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list1, info1], 10);
    print(packDawoMission.placardM);

    print(helsinkiMission.placardM);
    List list2 = helsinkiMission.report('C:dawoApp:rM:', _pB);
    List info2 = tl.mapToFineList(helsinkiMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list2, info2], 10);

    print(dartlangMission.placardM);
    List list3 = dartlangMission.report('C:dawoApp:rM:', _pB);
    List info3 = tl.mapToFineList(dartlangMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list3, info3], 10);

    print(myMusicMission.placardM);
    List list4 = myMusicMission.report('C:dawoApp:rM:', _pB);
    List info4 = tl.mapToFineList(myMusicMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list4, info4], 10);

    print(myTimeMission.placardM);
    List list5 = myTimeMission.report('C:dawoApp:rM:', _pB);
    List info5 = tl.mapToFineList(myTimeMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list5, info5], 10);

    print(nationalParksMission.placardM);
    List list6 = nationalParksMission.report('C:dawoApp:rM:', _pB);
    List info6 = tl.mapToFineList(nationalParksMission.say, 10, 80);
    devBox('By; dawoApp:rM:', ['* header *', '* footer *'], [list6, info6], 10);

    _flowC('      --<----<-- app rollMissions  C: $caller --<----<--', _pB);
    // roll all chores, that are in mission
  } //  -----  appRollMissions

  ///  TODO devStream  building stream for dev, using elementary Stream example
  ///  NAME:  Change to:  fix** ?
  ///  TODO  WHO IS CALLING THIS ?  roll method above.
  void devStream(String caller) {
    _flowC('--:stream:beg dawoApp rollStream started by: $caller   --', _pB);
    _flowC('-- :stream:beg dawoApp rollStream started by: $caller ---', true);
    // demandStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    store.demandStream(
        //  [agenda, msg, develop, version] don't work anymore: hklTry: pack
        ':dawoApp:river:',
        tl.mapToList(pack),
        'appListener');
    store.demandStream(
        ':dawoApp:river:', ['First Book', 'My Book', 'Third Book'], 'appListener');
    _flowC('--- :stream:end dawoApp rollStream done     ---', _pB);
  }

  ///  calling beta demandStream, elementary Stream example
  ///  TODO  Make usage of this async and somebody to wait it.
  ///  #TODO  make this use #iterable parameter; dev.admN / where #ALL
  ///  Usage:  roll-method above.
  void rollStream(String _cl) {
    _flowC('--- :stream:beg dawoApp rollStream started by: $_cl    ---', _pB);
    // demandStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    store.demandStream(
        //  [agenda, msg, develop, version] don't work anymore: hklTry: pack
        ':dawoApp:river:',
        tl.mapToList(pack),
        'appListener');

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
    store.demandStream(':dawoApp:river:ADM:', _queryL, 'appListener');
    //  TODO Stream: meaningful : streams from doneL / devN important
    _flowC('--- :stream:end dawoApp rollStream done  by: $_cl    ---', _pB);
  }

  ///  Using boxServe-class for to construct this info-box.
  void box(String caller) {
    buf.writeln(':da:box:start: C:$caller 123456789-23456789-23456789');
    print('-->>-->>-- :da:box:start: C:$caller  -->>-->>-- ');
    //  use: boxServe  OR  create own class here
    //  TODO  set min-max values
    final int _sw = 198; //  screen width, changed later =>
    final int _rc = 37; //  row count
    //  ???  Keep matrix here on callers side all the time
    List<String> _dapMatrix = new List(_rc);
    String boxHeader = ':da:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');

    boxServe.init(_rc, _sw, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':da:box: ', ':da:box:'); //  :BUG: C: $caller');

    int r9 = 9; //  row anchor

    ///  Method cascades makes this look nicer.
    boxServe.aHeader(1, 4, '* *  States * * ');
    boxServe.aBox(2, 7, 6, 16, tl.mapToListB(st));

    boxServe.aHeader(1, 60, ' *  DAWO APP INFO  *');

    boxServe.aBox(2, 22, 4, 7, ['name:', 'Info:', 'User:', 'Motto:']);
    boxServe.aBox(2, 30, 4, 48, ['$name', '$info', '$user', '$motto']);

    boxServe.aBox(2, 80, 4, 20, ['Agenda', 'Develop', 'Msg:', 'Versions']);
    boxServe.aBox(2, 92, 5, 20, ['______', '________', '______', '____']);

    boxServe.aHeader(r9 - 2, 7, 'Buffer:');
    boxServe.aBox(r9 - 1, 6, 28, 38, buf.toString().split('\n'));
    boxServe.vertLine(r9 - 1, 5, 28); //  phases

    boxServe.aHeader(r9, 50, '* Plans: *');
    boxServe
        .aBox(r9 + 1, 50, 4, 20, ['Plans: ', 'More plans', 'xxxx', 'yyyyy']);
    boxServe.vertLine(r9, 49, 7); //   plans

    boxServe.aHeader(r9, 80, '* reserved *');
    boxServe.aBox(r9 + 1, 80, 5, 15, [
      'A',
      'B',
      'C',
      'C',
    ]);

    boxServe.aHeader(r9, 100, '* Clients *');
    boxServe.aBox(r9 + 1, 100, 5, 15, [
      'State',
      'Set',
      'Puf',
      'Print',
    ]);

    boxServe.vertLine(1, 117, 23); //  Up-right edge
    boxServe.vertLine(1, 139, 23); //  Up-right edge
    boxServe.aHeader(1, 120, '* Actions *');

    boxServe.show(boxHeader, 'print', 4);
    boxServe.done(boxHeader);
    print('--<<--<<  boxHeader boxServe  done  --<<--<<--  ');
  } //  -----  box

  ///  Show-method to be developed further.
  ///  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'
  void show(String action) {
    if (_pB) {
      print(buf);
      print('-->>-->>----  dawoApp show -->>-->>----');
      print(out.outTr);
      print('--<<--<<----  dawoApp show done --<<--<<----');
    }
  }

  ///  After presentation method; done, if #doneB.
  void done() {
    _flowC('-->-da->  DawoApp.done    $info   :: engaged ', _pB);
    st['wake'] = false;
    st['work'] = false;
    st['done'] = true;
    out.outTl.writeln('out.outTl-dawoApp-done:');
    out.outTMid.writeln('out.outTMid-dawoApp-done:');
    out.outTr.writeln('out.outTr-dawoApp-done:');
    out.outMTop.writeln('out.outMTop-dawoApp-done:');
    out.outMid.writeln('out.outMid-dawoApp-done:');
    out.outMBot.writeln('out.outMBot-dawoApp-done:');
    out.outBl.writeln('out.outBl-dawoApp-done:');
    out.outBr.writeln('out.outBr-dawoApp-done:');
    out.outFooter.writeln('out.outFooter-dawoApp-done:');
    //  code here
    _flowC('  --<-da-<  :da:b: --  DawoApp buffer output app: done  --', _pB);
    if (_pB) print(buf);
    //  buf.clea--<-da-<  DawoApp.done  done  --<<--<<---- ', _pB);
  }

  //  Changed using new fields user and purpose.
  //  Stop using constructor
  //  DawoApp(this.user, this.motto);

  ///  Every important library has it's own flowC function. #Library #Privacy!!
  ///  Calling print/print-to-buffer function from beta.
  ///  Getting local variables; Actor and Buffer right.
  ///  Location of: _flowC inside OR outside of class?
  void _flowC(String msg, bool p) {
    ///  call flowServe with #LOCAL variables
    ///  :DAWO-APP:  is too long.
    flowServe(':DA:', out.outTr, msg, p);
  }
} //  ----------  class DawoApp

///  Create an instance of DawoApp. With default constructor.
var dawoApp = new DawoApp();

///  To print outPutBuffers.  //  not called
///  Using new outBufM Map
///  TODO  Make this show in proper screen areas with devBox.
void outBuffersPrint(String caller, String notCalled) {
  print(' -->>-->>----  :DA:   out.outBuffers  by: $caller  -->>-->>-- ');
  int i = 0;
  int mLength = out.outBufM.length;
  for (var x = 0; x < mLength; x++) {
    String _bufNameS = out.outBufM.keys.elementAt(i);
    i++;
    print('\n * * * * * * * * * *    $_bufNameS   * * * * * * * * * *  ');

    print(out.outBufM[_bufNameS]); //  print

    print('* * * * * * * * * *    $_bufNameS   done  * * * * * * *  ');
  }

  print('     --<<--<<----  :DA:   out.outBuffers  C: $caller  done ');
}

///  Keeping historical aso. info about dawo.
///  Just testing: implements, here.
class DawoHist implements BaseStruct {
  String name = 'dawoHist';
  String info = 'Historical and old stuff of dawo.';
  Map<String, String> say;
  String motto = 'Keeping this stuff out of dawoApp';

  //  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  String clause; //  Combination of #LANG words in sentence.
  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //  like:  ":DAWO-HIST:";
  String emblem = ':dawoHist:'; //  or this emblem.
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.
  String master = ':dawoApp:'; //  Object that owns this.

  bool _pB = true; //  yes / no printing now.
  StringBuffer buf = new StringBuffer();

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': false,
    'work': false,
    'pause': false,
    'done': false,
  };

  ///  Old marking to find usage of this version in test apps.
  final String version_0_0_02 = 'dawo 0.0.02 - 12 / 2013 hkl';
  String thisVersion; //  users announce their version of dawo
  String latestChange = '23.3.2017. th.12.15';

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

  /// Models and sample maps ; for later usage and playing.
  Map<String, String> appMap = {
    'name': 'dawo App',
    'info': 'dartang pub package for education',
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

  ///  Method for setting class field values.
  ///  TODO  add parameters
  void init() {
    buf.writeln(':buf:dawoHist:  init-empty ow-done.');
    print('------------ :dawoHist: init done-------------------------');
  }

  ///  Method for setting class in working condition.
  void build(String _emblem, String _master) {
    buf.writeln(':buf:dawoHist:  build-empty ow-done.');
    print('------------ :dawoHist: build done-------------------------');
  }

  ///  #run-like method, it my have sub-methods; do, run.
  void roll() {
    print('------------ :dawoHist:roll done -------------------------');
  }

  ///  Calling boxServe-class for info.
  void box(String caller) {
    buf.writeln(':dawoHist:box:start: C:$caller 123456789-23456789-23456788');
    print('-->>-->>-- :dawoHist:box:start: C:$caller  -->>-->>-- ');
    //  use: boxServe  OR  create own class here
    //  TODO  set min-max values
    //  :BOX:SW:  was 190
    final int _sw = 200; //  screen width, changed later =>
    final int _rc = 37; //  row count
    //  ???  Keep matrix here on callers side all the time
    List<String> _dawoHistMatrix = new List(_rc);
    String boxHeader = ':dawoHist:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
    //  :BUG:  Clear old lists first. ??
    //  :BOX:SW:  was 190
    boxServe.init(_rc, 200, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(
        ':dawoHist:box: ', ':dawoHist:box:'); //  :BUG: C: $caller');

    int r9 = 9; //  anchor for row.
  }

  ///  Presentation method.
  void show(String action) {}
  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'

  ///  Close method.
  void done() {}

  ///  Every important library has it's own flowC function. #Library #Privacy!!
  ///  Calling print/print-to-buffer function from beta.
  ///  Getting local variables; Actor and Buffer right.
  void _flowC(String msg, bool p) {
    ///  call flowServe with #LOCAL variables
    ///  :dawoHist:  is too long.
    flowServe(':dHist:', buf, msg, p);
  }
} //  -----  class DawoHist

//
