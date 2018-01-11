// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawoApp class
///  Primary functionality:  build, roll and rollMissions.
///  Information about app, hist, and little controls.
///  Program might have a certain amount of 'self consciousness'. This is start.
/// * dawo version:  0.0.75.  -  8.1.2018
/// * devState : 25%    in GitHub : yes
/// * NEXT:  Reconstruct class.  Separate hist to own class.
/// * dawoApp instantiated inside app; it now has access to dawo.version aso.
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

//  part 'dev/dawo_hist.dart';
//  part 'dev/dev_notes.dart';

//  Word: stream  13 / 35  times

///  Getter practice.
num dawoAppReadiness = 95; //  changed: 2.5.2015

///  Buffer also outside class, for testing and adding visibility.
var appBuf = new StringBuffer(); //  not used here

///  Class that holds 'soul' of THIS dawo app.
///  Controls Mission-Chore system, #App, & dawo-package development, #Pack.
class DawoApp {
  final String name = 'DawoApp';
  final String version = '0.0.75+';
  final String by = 'HKL';
  final String actor = ':DAWO:APP:';
  final String info =
      'Innovative & educational small data-handler experimentation.';

  ///  Fields filled in init: user and motto;
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
  //  like:  ":DAWO:APP:";///  must initialize StringBuffer here
  String seal;
  //  or this emblem.StringBuffer buf = new StringBuffer();
  final String emblem = ':DA:';
  // like:  "      ";  3-5-7 empty marks or something visible.
  String indent;

  bool _pB = false; //  No printing now. use printControl to change it.
  StringBuffer buf = new StringBuffer();

  ///  4 Map variables to indicate dawoApp's state / working-condition.
  Map<String, bool> st = {
    'wake': true,
    'work': false,
    'pause': false,
    'done': false,
  };

  ///  Package information.
  Map<String, String> package = {
    'agenda': 'Data-handling app package',
    'msg': 'This is a process for learning.',
    // :DEBUG:TEST:   Who uses this??  --- :stream: #phase:1 bLib:demandStream Listened
    'develop': 'Under development.. from 0.0.7+ to 0.1.0.',
    // :DEBUG:TEST:   Who uses this??  :  :stream: #phase:1 bLib:demandStream Listened
    'pack: version': 'Version: 0.0.75+ ',
    'pub': 'Published 8.1.2018',
  };

  ///  Organize out.out-buffers to Map for return to package users.
  ///  Default users for buffers, used in:
  Map<String, StringBuffer> outMapBuffers = {
    'outHeader': out.outHeader, //  app - roll

    'outTl': out.outTl, //  rumba
    'outTMid': out.outTMid, //   mission
    'outTr': out.outTr, //  dawo:app  dev

    'outMTop': out.outMTop, //   m - packDawo
    'outMid': out.outMid, //  m - dartlang
    'outMBot': out.outMBot, //  m - helsinki

    'outBl': out.outBl, //  m - myMusic
    'outBr': out.outBr, //  m - myTime

    'outFooter': out.outFooter // m -  nParks
  };

  ///  Value to control console printing in flowC / flowServe.
  void printControl(bool pc) {
    _pB = pc;
    print('     :dawoApp:printControl: set to:  $pc');
  }

  ///  set class values to beginning state.?
  void init(String _user, _motto) {
    //  TODO  Actor:  only one actor for now... But class Actor in alpha.dart
    //  #Actor is longTimeProject / idea to mark active object. Not used 007.
    glb.changeActor(':DAWO:APP:');
    user = _user;
    motto = _motto;
    st['wake'] = true;
    //  if buffer set:
    //  _flowC('  -->-da->  DawoApp buffer output initialized  ---', _pB);
    _flowC('  --<-da-<    :da:i: init done', _pB);
  }

  ///  Method for further building app and mission system in working condition.
  void build(String emblem) {
    ///  NOTE empty parameter now, not used. For chore.build.
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   working state begins

    ///  Build DevNotes.
    dev.buildNotes('By: :D:-A:', 'In Dawo:App-Build');
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

  ///  #run-like method
  ///  return:  Map<String, StringBuffer> out.outMapBuffers
  Map<String, StringBuffer> roll() {
    //  Calling:  dev/dev_notes.dart
    fillNotes();
    //  build already does this::  dev.buildNotes();
    _flowC(':da:r: DawoApp::roll    $info   :: roll engaged ', _pB);

    // done by user  init(); //  calling init and build methods in this class
    build(':DAWO:APP:');
    //
    print('-->>-->>--  :dawoApp: calling :connector:  -->>-->>--');
    String connectorMsg = ':LOAD :QUIDE again :FOR :ALL #MISSION => :ANSWER';
    connector.join(name, betaPlacardM, connectorMsg, ':D:app:');
    connector.roll();

    ///  appRollMissions is mandatory for Mission-Chore system to work.
    ///  Made private with: _  =>   _appRollMissions.
    _appRollMissions(':DA:roll:'); //
    ///  Experiment to use some Streams: Quest: find good use-case.
    rollStream(':DA:roll:2');
    devStream(':DA:roll:3');

    ///  This is the right place, if package user wants to add "run"-function.
    //  user defined:  run();
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
    _flowC('  ***  :DAWO-:APP:  MISSIONS   ***  ', _pB);

    ///  Calling method in missions.dart
    buildMissions('Caller:dawoApp:');

    ///  TODO Detail printing set false / true or by _pB;
    ///  NOTE: packDawo gets map printed here: true!
    print(packDawoMission.placardM);

    ///  Send 2 lists to devBox to get nice screen printing.
    List list1 = packDawoMission.report('C:dawoApp:rM:', true);
    List info1 = tl.mapToFineList(packDawoMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list1, info1], 10);
    print(packDawoMission.placardM);

    print(helsinkiMission.placardM);
    List list2 = helsinkiMission.report('C:dawoApp:rM:', _pB);
    List info2 = tl.mapToFineList(helsinkiMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list2, info2], 10);

    print(dartlangMission.placardM);
    List list3 = dartlangMission.report('C:dawoApp:rM:', _pB);
    List info3 = tl.mapToFineList(dartlangMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list3, info3], 10);

    print(myMusicMission.placardM);
    List list4 = myMusicMission.report('C:dawoApp:rM:', _pB);
    List info4 = tl.mapToFineList(myMusicMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list4, info4], 10);

    print(myTimeMission.placardM);
    List list5 = myTimeMission.report('C:dawoApp:rM:', _pB);
    List info5 = tl.mapToFineList(myTimeMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list5, info5], 10);

    print(nationalParksMission.placardM);
    List list6 = nationalParksMission.report('C:dawoApp:rM:', _pB);
    List info6 = tl.mapToFineList(nationalParksMission.say, 10, 80);
    devBox(
        'By; :dawoApp:rM:', ['* header *', '* footer *'], [list6, info6], 10);

    _flowC('      --<----<-- app rollMissions  C: $caller --<----<--', _pB);
    // roll all chores, that are in mission
  } //  -----  appRollMissions

  ///  TODO devStream  building stream for dev, using elementary Stream example
  ///  NAME:  Change to:  fix** ?
  ///  Stream experiment.  Caller: ?  roll method above.
  void devStream(String caller) {
    _flowC('--:stream:beg dawoApp rollStream started by: $caller   --', _pB);
    _flowC('-- :stream:beg dawoApp rollStream started by: $caller ---', true);
    // demandStream('dawoApp', ['34 TIMES', 'No any times', 'Occasionally 7 times'], 'appListener' );
    //  calling it with dawoApp class properties
    store.demandStream(
        //  [agenda, msg, develop, version] don't work anymore: hklTry: pack
        ':dawoApp:river:',
        tl.mapToList(package),
        'appListener');
    store.demandStream(':dawoApp:river:',
        ['First Book', 'My Book', 'Third Book'], 'appListener');
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
        tl.mapToList(package),
        'appListener');

    ///  calling stream on dev.admN list certain items:
    ///  insertAll(int index, Iterable<E> iterable) → void
    ///  Create List, that is used in Stream.
    List<String> _queryL = ['* First _queryL item *'];

    //  TODO  find #Lang #word's function, make it.
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
    //  TODO  set min-max values for row / width.
    final int _sw = 198; //  screen width.
    final int _rc = 37; //  row count.

    String boxHeader = ':da:box:';
    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');

    boxServe.init(_rc, _sw, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':da:box: ', ':da:box:');

    int r9 = 9; //  row anchor

    ///  Method cascades would make this look nicer.
    boxServe.aHeader(1, 4, '* *  States * * ');
    ///  row, column, list-items, width.
    boxServe.aBox(2, 7, 6, 16, tl.mapToListB(st));

    boxServe.aHeader(1, 60, ' *  DAWO APP INFO  *');

    boxServe.aBox(2, 22, 4, 7, ['name:', 'Info:', 'User:', 'Motto:']);
    boxServe.aBox(2, 30, 4, 48, ['$name', '$info', '$user', '$motto']);
    ///  TODO  Bring real data.
    boxServe.aBox(2, 80, 4, 20, ['Agenda', 'Develop', 'Msg:', 'Versions']);
    boxServe.aBox(2, 92, 5, 20, ['______', '________', '______', '____']);

    boxServe.aHeader(r9 - 2, 7, 'Buffer:');
    //  List 28 items, 38 width. Note handy split = toList -method.
    boxServe.aBox(r9 - 1, 6, 28, 38, buf.toString().split('\n'));
    boxServe.vertLine(r9 - 1, 5, 28); //  phases

    boxServe.aHeader(r9, 50, '* Plans: *');
    boxServe
        .aBox(r9 + 1, 50, 4, 20, ['Plans: ', 'More plans', 'xxxx', 'yyyyy']);
    boxServe.vertLine(r9, 49, 7); //   plans

    boxServe.aHeader(r9, 80, '* reserved *');
    ///  More simulated data.
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

    ///  At the end print some vertical lines.
    boxServe.vertLine(1, 117, 23); //  Up-right edge
    boxServe.vertLine(1, 139, 23); //  Up-right edge
    boxServe.aHeader(1, 120, '* Actions *');
    ///  'print' makes this visible in screen.  Margin: 4.
    boxServe.show(boxHeader, 'print', 4);
    boxServe.done(boxHeader);
    print('--<<--<<  $boxHeader boxServe  done  --<<--<<--  ');
  } //  -----  box

  ///  Show-method to be developed further.
  ///  actions like: 'print, buf, pause, hello-World!, info:Watch, act:dim'
  void show(String action) {
    if (_pB) {
      print('-->>-->>----  dawoApp show -->>-->>----');
      print(buf);
      print(out.outTr);
      print('--<<--<<----  dawoApp show done --<<--<<----');
    }
  }

  ///  After presentation method; done, if #doneB.
  void done() {
    _flowC('-->-da->  DawoApp.done    $info   :: engaged ', _pB);
    //  st['wake'] = false;
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
    _flowC('  --<-da-<  :da:d: --  DawoApp buffer output app: done  --', _pB);
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
    ///  :DAWO:APP:  is too long.
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
