// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be found in the
// LICENSE file.
///  ##  connecting  ( as #client's) app - mission - chore together,
///  mediating them. separate objects work together in outer processes,
///  using #LANG -specific commands to configure their proceedings.
///  using #dawolang package in path dependency
///  method String weightString(String _aS) checks #C messages
///   dawo version:  0.0.8.  -  13.3.2019  * devState : 15 %
///
/// * devState: 30%
/// * Hist: hkl  10.9.2017  0.0.1  dawo/lib  connector.dart
/// #name:  connector ..is not nice. change to: ______ ??
/// #unite-6  merge-0  mix-0  blend-0  pool-0    unify-0
/// #name: placard : 1 !!

/// App -mission - chore work together in same sphere, and there is something,
/// that they have in common; abstraction layer, in which they work together.
///
/// * Every #little operation is "connector-operation", and connector has
/// * knowledge for all of them and can interact with them.
/// * Sending messages between objects. Stance, approach
/// * "Connector-operations" have access to certain up-level variables.
/// *   * * *   companions in process  * * *
/// * Using :affair: class to operate, for :corporate: or :mission: system.
/// * #LANG : command-words to give regulated behaviour to user actions.
/// * ADD IS-GLOBAL bool field to :affair: classes.
/// * Connector might change objects precedence in Mill-op.
/// * Might trig some action in their connected sister-operations.
//  * Find common interests, i've been here.. follow-me, give-take
/// * In roll -> loop should be phase where :con:objects are checked.

//  NOTE:
//  devNote: tracking begins.

library connector;

//  TODO  import 'dart:intl';

///  path dependency
import 'package:dawolang/dawolang.dart' as d_lang;

import 'affair.dart';
import 'bind.dart';

import '../mis/missions.dart';

import '../src/box_serve.dart';

import '../alpha.dart';
import '../beta.dart';

import '../shower.dart';
import '../tools.dart';

import '../mis/equipment.dart';

///  Buffering out-data ( #clayOut )
StringBuffer connectorBuf = new StringBuffer();

///  This other motto is just for to get more visibility to word: connector.
String connectorMotto = 'connecting app, mission, chore; mediating them';

///  ***********************************************************************
/*      connector:  getting some idea, how to accomplish this. 10 %
        Not much of this functionality is yet done.
        
        Name:   #connector is not the right one. Not nice.
        #clients: = app - mission's - chore's

* Get "service calls" from #members:  app - mission - chore; and solve them.
* Have rules of privilege for precedence of missions - chores.
* #Mill is separate job-keep-them-in-privileged-order processor.
* feed > mill commands-messages-flags-schedules; "work-orders".
* #C should have access to class-buffers to seek data.
* Special language #Lang, to force commands to certain shape, and
* send messages.
* #baton : to carry only-one-can-have-at-a-same-time magic thing.
*
* COMMAND ROLL:
* 1. get command, handle parameters, handle #LANG-message.
* 2. Check command against rules. Take - return - reject.
* 3. Full-fill command;  void obey(sender, receiver, baton, msg, flags)
* 4. Get answer, serve back. #Report operations shows total results.
* 5. Mark done.
*
* Questions:
* 1. Where do connector work?  Is it upper-level loop?
*    ..  or is it available all the time.  No need to wake it.
* 2. Where, how, and why is #connector invoked?
* 3. ?
*
* IDEA:  All (commands) might happen in #mill. ( an order processor system ).
* IDEA:  #Callback-like service calls. Maybe later, now just: #order, #turn.
* IDEA:  #serviceKey #baton, that only one client can have at a time.
* IDEA:  Privilege key.
*
* MAYBE: Incoming commands have certain form. Classes?  Strings?
* MAYBE: Access to #GOAL aso. variables.
* MAYBE:
*
* NOT:  Handle #area #resource #time #money aso. properties.
* NOT:

 */
///  ***********************************************************************

//  typedef _conPrint = List<String> Function <String>(String);
//  typedef _conPrint = List<String> Function <String>(String);
//  typedef int Compare(Object a, Object b);
//  typedef void _ConPrint(String msg);

/*
void _conPrint(String msg){
  if (_pB) print(msg);
}

typedef  _conPrint =  void _conPrint(String msg);
*/

//
///  This class gets same structures from alpha, as other important classes.
///  Connecting clients (app-mission-chore) to work together.
class Connector extends BaseStruct {
  bool _pB = false; //  false;   //  To control printing in _flowC method.
  String name = 'connector class';
  String info = 'App - mission - chore conScout #corporate.process via #LANG';
  //  TODO  #lang  won for connector
  ///  Connector might be a technical thing, not needing a say map. Or?
  Map<String, String> say = {
    'purpose': 'con: technical',
    'lang': ':LANG :LISTEN',
    'area': ':TO-camp : TO-scout',
    'product': ':MEDIATE',
    'sell': 'con: BIND :PING',
    'buy': 'con: :NO',
    'ask': ':placard :msg',
    'always': ':MEMBER :MSG :COM',
    'newer': 'con::NO :UGLY'
  };

  String motto = 'Give objects long, powerful extra hand.';

  ///  devNote: IDEA: Fields for to better shape outPut stuff in console.
  String seal = ":CONNECTOR:"; //  like:  ":CONNECTOR:";
  /// .. or this:  emblem can be used in _flowC
  String emblem = ':C:';

  //  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  ///  clause walks with objects in process call and carries list of words.
  ///  Combination of #LANG words in sentence.
  String clause = ":DO :HINT :FIND :AREA :JOIN :OPEN :RULE";
  String master = ''; //  Object that owns this. Now only a String.

  // Buffer inside class to keep String-data for output.
  StringBuffer buf = new StringBuffer();
  String _bm = 'cb- '; //  marking all buf rows.

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': false,
    'work': false,
    'pause': false,
    'done': false,
  };

  ///  Describing con join-solve procedure.
  Map<String, String> phaseM = {
    'say': ':con: talks its own #LANG and takes members and analyzes theirs.',
    'join': ':Members :join: to :M:scout: OR :corporate: affair system.',
    'solve': 'Data is accessable in :camp:scout: & #say handled by #LANG.',
    'ping': 'Matched #say by #LANG is :ping:ed to Members concerned. ',
    'camp': 'Camp is ready to act and its resources are available.',
  };

  ///  In #LANG & say system accrued #SCHEDULE and #EFFORT rules
  Map<String, String> answerPoleM = {
    'Who?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'What?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'When?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'Whíle?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'Where?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'Why?': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
  };

  //
  ///  ///  In #LANG & say system accrued #SCHEDULE and #EFFORT rules
  Map<String, String> workPoleM = {
    'Always': '_ _ _ _ _ _ _ _ _ _ _ ',
    'Newer': '_ _ _ _ _ _ _ _ _ _ _ ',
    'Start': '_ _ _ _ _ _ _ _ _ _ _ ',
    'Day': '_ _ _ _ _ _ _ _ _ _ _ ',
    'Week': '_ _ _ _ _ _ _ _ _ _ _ ',
    'Stop': '_ _ _ _ _ _ _ _ _ _ _ ',
  };

  ///  *****************************************************************
  ///  Serves both mission-chore  and  corporate-affair "lines".
  ///  var msgBus * Sending messages between objects. Stance, approach
  ///  If this is only simple msg-handler getPlea, handlePlea, givePlea
  ///  And now section, that handles all those small details:

  ///  #New: #Gear Something turns around this.
  ///  the sail pivots around the axis of a virtually static mast
  ///  NULL  non-nullable instance field pivot must be initialized
  ///  hklTry:  make it explicitly:  Object
  Object pivot = Object();

  //  typedef void _ConPrint(String msg); // announced outside of class
  //  _ConPrint
  void _conPrint(String msg) {
    if (_pB) print(':_conPrint$emblem $_pB  $msg');
  }

  ///  or: void metro() {}   for putting messages to move.
  ///  PING, Putting messages in queue or sending them immediately.
  /// void ping(Baker sender, receiver, var key) {
  void ping(String sender, receiver, key, msg) {
    print('    :ping: is used.. hooray!! S: $sender R: $receiver K: $key ');
    buf.writeln(':con:buf:  :ping: is used..S: $sender R: $receiver K: $key ');

    ///  code
  }

  ///  Giving nice report of connections.
  List report() {
    print('--->------>------ connector report:: ------>----------->---------');
    buf.writeln('con:report::  ');
    List<List<String>> _dbL = [];
    List<List<String>> _dbL2 = [];
    _dbL.addAll([tl.mapToListO(joinM), joinLog]);
    //  Add message list: for in-coming messages: inMsgL
    _dbL2.addAll([inMsgL, tl.mapToList(bind.bindM)]);
    print('--------------- connector report devBox:: -------------------');
    //  presenting devBox in 2 x 2 table.
    devBox(':con:r:1:', ['* header *', '* footer *'], _dbL, 0);
    devBox(':con:r:2:', ['* header *', '* footer *'], _dbL2, 0);
    print('--<----------<--- connector report done ---<--------------<-----');
    return ['this', 'list', 'is', 'vain']; //  No need for list??
  }

  ///  Connector basic activity, keep list of Members / their operations.
  ///  devNote: Or should it be something smaller? abstract class ModelPlacard?
  List<Affair> opL = [];

  ///  List for #C information. Used for devBox reporting.
  List<String> joinLog = ['* :connector:joinLog:  *'];
  List<String> inMsgL = ['*  :connector:inMsg: -list  *'];

  ///  Clients tool to access connector data and other services.
  void signUp(List<String> _callL) {
    //  code
  }

  ///  Member is a class in alpha, not used here.
  ///  If everybody extends BaseStruct, it could be used here.
  ///  For connector to be able to refer callers data
  Map<String, Mission> joinM = {
    'PackDawoMission': packDawoMission,
    'HelsinkiMission': helsinkiMission,
    'DartlangMission': dartlangMission,
    'MyMusicMission': myMusicMission,
    'MyTime mission': myTimeMission,
    'NationalParksMission': nationalParksMission
    // old  'cM-1': 'First :con:Member:test:',
    // 'cM-2': 'Second :con:Member:test:',
  };

  //TODO  joinLatest  iterator  for to get say-map aso.
  String joinLast = 'NoneJoinedYet';

  ///  Direct reach via joinM to clients placardM and clause data-
  ///  Solve inMsg String to extract parts of command.
  void joinSolve(String inMsg, caller) {
    //  if caller is registered Mission:
    if (joinM.containsKey(caller)) {
      List<String> joinInfoL = [
        '**  PLAN: :join:Solve: has access to all #joined members data, and it',
        'resolves callers #FIND calls serching #clause #info and #motto fields',
        'by #LANG and #RULE keywords and mediates answer and act to caller.',
        ''
      ];

      print(
          '\n ----->--- :join:Solve: C: $caller  --->------------->---------');
      joinInfoL.forEach(print);
      print(tl.mapToListO(joinM));
      print('------------- info map: -----------------------');
      //  howTo NULL Map hklTry:  OK
      //  NO  joinM[caller].say!.forEach((k, v) => print('$k $v'));
      joinM[caller]!.say.forEach((k, v) => print('$k $v'));

      print('-------- name: motto:  -----------------------');
      //  howTo NULL   hklTry:
      print(joinM[caller]!.name);
      print(joinM[caller]!.motto);

      print('------------- report -----------------------');
      //  no details
      // howTo NULL   hklTry:
      List<String> _l = joinM[caller]!.report(':scoutSolve:', false);
      _l.forEach(print);
      print('--------placardM: ----------------------------');
      print(joinM[caller]!.placardM);
      print('--<------ :join:Solve:   done  ----<-------------<--------- \n');
    }
    //  get #findThisThing, announce it
    //  search joinM / forEach / clause-info-motto for: / findWord
    //  Match Word #time #area
    //  If found:  Sender & receiver/all are in same area
    //  Answer #Match joinM, to give them to do their own actions
    //  Add Joins and Binds to 2-week, year and connect-table
    //  Done this search.
  } //  -----  joinSolve

  ///  Join "clients" / Members to scoutList OR affair. placardM mediates necessary info.
  ///  Usage: mission, dawoApp, rumba, chore, dawo_example
  ///  You can join scout OR affair OR x
  ///  TODO parameter for to join  scout R affair OR x
  ///  TODO parameter to get mission.name  for  lastJoin:ed
  void join(String name, Map<String, String> plcM, String inMsg, caller) {
    ///  Save caller-objects name for box aso.
    joinLast = name;
    buf.writeln('con:join: starting by:$caller  ');
    //  TODO : if #caller is in joinM
    //  else:  caller is Rumba, Chore or example
    ///  Operations register to Connector with placardM.

    ///  Using Analyzer class from dawolang. TODO: get clause from caller.
    String analyzeS = '';

    ///  NOTE: this returns a String
    analyzeS = d_lang.an.analyzeStrS(inMsg, d_lang.lb.wordList);
    List<String> analyzeL =
        boxServe.infoBox({':con:join:dl:an:': '$analyzeS'}, 18, 140, 15);
    //  analyzeL.addAll(boxServe.infoBox({':con:join:dl:an:': '$analyzeS'} , 8, 100, 15));
    analyzeL.forEach(print);
    print(':con:join:Call > :dawolang:analyze:watch:check: in ');
    //  TODO  Output!!  '..:debug:dawolang:print:.:connector;join:...');
    //  TODO  Stop keeping placard here: get: joinM.find.placardM
    //  Placard here is unnecessary, after scoutSolve has access viu joinM
    //  howTo NULL String Map
    //  hklTry: do no null String
    String actorS = '';
    actorS = plcM['actor'].toString(); //  hklTry: cast to String

    String senderS = plcM['sender'].toString(); //  hklTry: cast to String
    String receiverS = plcM['receiver'].toString(); //  hklTry: cast to String
    String comS = plcM['command'].toString(); //  hklTry: cast to String
    String msgS = plcM['msg'].toString(); //  hklTry: cast to String
    String _S = "_plcM:-A: $actorS S: $senderS R: $receiverS C: $comS M: $msgS";
    _flowC(':CN:  $_S', _pB);

    ///  call to previous method.
    joinSolve(inMsg, caller);
    String joinLogS = '$emblem :je: $actorS $comS $msgS $senderS';
    joinLog.add(joinLogS);

    _flowC(inMsg, _pB);

    ///  Using Analyzer class from dawolang.
    String _weightStringMsg = d_lang.an.weightString(inMsg, d_lang.lb.wordList);
    _flowC(_weightStringMsg, _pB);

    inMsgL.add(inMsg); //  for keeping#unmodified   inMsg.
    ///  call to bind OR opCom
    ///
    if (_pB) {
      bind.mark(actorS, senderS, receiverS, comS, msgS, inMsg);
      print('--<<-------- bindingM - done -----------------\n');
      _flowC('operationMapPrint OR shortMapPrin  $info', _pB);
      print('** :C:joint:  operationMapPrint OR shortMapPrint plcM   **');
      //  tl.operationMapPrint(plcM);
      tl.shortMapPrint(plcM);
      print('--<<-------- plcM  ------------------------');
      //  TODO  connector  add joinM    add  BindingM
    }
    _flowC(':CN: --<<--<<:connector:join: done  C:$caller  <<--<<--', _pB);
  } //  -----  join

  ///  Here goes normal init-build-roll-show-done -round. No loop.
  ///  Method for setting class field values to their run-time-values.
  ///  Called by: roll.
  void init() {
    buf.writeln('$_bm ---  Connector buffer output initialized  ---');

    ///  TODO  Move this row to dawoApp? Using LexiconBase class from dawolang.
    d_lang.lb.build(':call:WG:-:dawolang:  :by:dawo-:connector:');
    //  Set fields values, mostly lists and maps.
    buf.writeln('$_bm init done');
  }

  ///  Method for further setting class fields in working condition.
  ///  CalledBy:  Roll.
  void build(String _emblem, String _master) {
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   Connector is in work-state.
    buf.writeln('$_bm :connector: -> build done');
  }

  ///  #run / roll method
  void roll() {
    buf.writeln('$_bm Connector::    $info   $emblem roll engaged ');
    init(); //  calling init and build methods in this class.
    //  TODO  connector Build parameters.
    build('*CONNECTOR:', 'CONNENCTORS-MASTER:');
    //  code for roll
    //  ***   code missing, see on top of this file
    //
    show('buf,info, hello');
    done();
    //  code here
  }

  ///  Method for #Members to take part in corporate operations.
  void rollCorporate() {}

  ///  Gives members privileges in joint operations..
  void sharer() {}

  ///  Using boxServe-class for everybody-to use box-shaped info.
  void box(String caller) {
    buf.writeln('con:box:start:  ');
    //  use: boxServe  OR  create own class here
    final int _sw = 194; //  default screen width, changed later =>
    _sw; //  To mark unUsed
    final int _rc = 47; //  row count
    //  ???  Keep matrix here on callers side all the time
    //  The default List constructor is not available, when NULL  safety is enabled
    //  howTo NULL List  OK:  .filled
    List<String> _conMatrix = new List.filled(_rc, '');

    _conMatrix; //  Mark #unUsed

    String boxHeader = ':connector:box:';
    print('-->>-->>  $boxHeader  boxServe  start  -->>-->>--  ');
    List<String> infoL = [
      'Connector joins other object to spheres, like corporate, where they can work together and join messaging.',
      'Every :con:Scout:ed object comes with a #LANG info like: #say and placardM, and has access to :bind:bing:',
    ];

    //  TODO  if change to: 150, it should be visible variable
    ///:BOX:WAS:  190, now  205
    boxServe.init(42, 198, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':con:box:', ':con:box: $caller');
    int r1 = 2; //  easy x-y pointing
    int r2 = 12;
    int r3 = 20;
    int r4 = 32;
    int m1 = 3;
    int m2 = 40;
    int m3 = 74;
    int m4 = 100;

    boxServe.aBox(r1 - 1, m2, 2, 106, infoL);

    boxServe.aHeader(3, m2, '*clause :');
    boxServe.aBox(3, m2 + 10, 1, 55, ['$clause']);

    boxServe.aHeader(4, m2, '*motto :');
    boxServe.aBox(4, m2 + 10, 1, 55, ['$motto']);

    boxServe.aHeader(r1, m1 + 6, '* connector  buf  *');
    boxServe.aBox(r1 + 1, m1, 39, 33, tl.bufToList(buf));

    boxServe.aHeader(6, m2, '* :con:phases: *');
    boxServe.aBox(7, m2 - 1, 5, 63, tl.mapToFineList(phaseM, 5, 57));

    boxServe.aBox(4, 125, 12, 20, tl.mapToFineList(equ.months, 3, 17));

    boxServe.aBox(4, 105, 13, 22, tl.mapToFineList(equ.twoWeeks, 4, 14));

    //boxServe.aHeader(r2, m4 + 4, ' *  conjoinM  * ');
    //  NoWork!??  Try absolute   boxServe.aHeader(r3 - 6, m2, ' *  conjoinM  * ');
    //  Try absolute address::
    boxServe.aHeader(13, 44, ' *  conJoinMember  * ');
    //boxServe.aBox(r2 + 1, m4 + 1, 6, 21, tl.mapToListO(joinM));
    boxServe.aBox(r3 - 6, m2, 12, 50, tl.mapToListO(joinM));

    //boxServe.aBox(r3 - 7, m2, 12, 50, joinLog);
    //TODO  Error ??
    boxServe.aBox(2, 150, 18, 38, joinLog);

    boxServe.aBox(r3 - 3, m4 - 5, 12, 50, inMsgL);

    //  TODO  resource / samples add something

    boxServe.aHeader(30, 100, '*: con:say Map *');
    boxServe.aBox(31, 100, 9, 42, tl.mapToFineList(say, 8, 34));

    ///  TODO  Get from joinM Just-joined-say map
    ///  Now using new #name field and parameter via con.join
    //  if (name  notIn joinM) blaa blaa blaa
    //  howTo NULL  Map OK
    Map<String, String> sayLatest = joinM['DartlangMission']!.say;
    //  Error:bug:  every object to not have say-map
    // Map<String, String> sayLatest = joinM[name].say;
    //  TODO  use map joinM directly without copying it here

    boxServe.aHeader(30, 144, '*: Now: $name :say *');
    boxServe.aBox(31, 142, 9, 42, tl.mapToFineList(sayLatest, 8, 34));

    boxServe.aHeader(r4 - 1, m2 - 5, '     * workPole  *  ');
    boxServe.aBox(r4, m2, 6, 23, tl.mapToList(workPoleM));

    boxServe.aHeader(r4 - 1, m3, '     * answerPole *  ');
    boxServe.aBox(r4, m3, 6, 18, tl.mapToList(answerPoleM));

    boxServe.vertLine(r2 + 1, m2, 7); //  joinMember
    boxServe.vertLine(4, m4 + 6, 13); //  2-weeks
    boxServe.vertLine(r4, m2, 6); //   workPole
    boxServe.vertLine(2, 149, 28); //  Up-right edge

    boxServe.show(':con:', 'print', 1);
    boxServe.done(':con:');
  }

  //  TODO  :BUG:Funny:error:
  ///  Presentation method. Trying list as a parameter.
  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'
  void show(String action) {
    //  TODO  Make forced print
    bool _clB = false;
    if (_pB && action.contains('buf')) {
      //  no good: no-buf !!buf+ ?
      print(':buffer: is printed');
      print(buf);
    }
    _clB; //  to mark it used
  }

  ///  close method
  void done() {
    _flowC('Connector::    $info   :: engaged ', _pB);
    //  code here
    buf.write('$_bm ---  Connector buffer output app: done  ---');
    if (_pB) print(buf);
    // Do  not, only when whole system closes.  buf.clear(); //  empty buffer
  }

  ///  TODO  typedef  print function
  ///  typedef int Compare<T>(T a, T b);
  //  typedef _conPrint(String msg);
  //   typedef  _conPrint =  void _conPrint(String msg){
  //   if (_pB) print(msg);  }

  void _flowC(String msg, bool prnB) {
    ///  Call flowServe with #LOCAL variables.
    //  TODO  Why not find beta flowServe() ??
    //  flowServe(':con:flC:$prnB ', buf, msg, prnB);
    flowServe(':con:flC: ', buf, msg, true); //  $prnB : when needed.
  }

  ///  constructor
  ///  NULL  error:   .toString();  //  hklTry: cast to String
  ///
  Connector(this.name, this.info);

  //  To mark unused local variables in Connector class
  void useUnused() {}
}

///  Create instance of Connector.
Connector connector =
    new Connector('DawoAppConnector', 'Connection operations');

///  Construct almost same class: but for collecting data.
///  Would like to extend this from Connector: class, but it do not have
///  a none argument constructor.
///  ..  but Connector do not have  ..
///  NOTE  howTo extend class that have constructor with arguments?
class Collector {
  String name;
  String info;

  Collector(this.name, this.info);

  ///  howTo: constructor:  Wanna easy-extend this, but can not :(
  /// Error: the superclass Collector does'nt have a zero argument constructor
}

///  Usual render, presentation, function.
void renderConnector() {
  Connector c = new Connector('render-test-connector', 'just for testing');
  c.info;
  c._conPrint(':connector: conPrint test in render.');
}
