// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be found in the
// LICENSE file.
///  ##  connecting  ( as #client's) app - mission - chore together,
///  mediating them. separate objects work together in outer processes,
///  using #LANG -specific commands to configure their proceedings.
///  using #dawolang package in path dependency
///  method String weightString(String _aS) checks #C messages
///   dawo version:  0.0.5  6.11.2017  * READY-STATE: for  0.0.6 version> 0%
///
/// * Usability: 7%
/// * Hist: hkl  10.9.2017  0.0.1  dawo/lib  connector.dart
/// #name:  connector ..is not nice. change to: ______ ??
/// #name: placard : 1 !!
/// Connector is in deeply planning state. We know, that app -
/// mission - chore work together in same sphere, and there must be something,
/// that they have in common; abstraction layer, in which they must
/// work together.
///
/// * Every #little operation is "connector-operation", and connector has
/// * knowledge for all of them and can interact with them.
/// * Sending messages between objects. Stance, approach
/// * "Connector-operations" have access to certain up-level variables.
/// *   * * *   companions in process  * * *
/// * Using #GlobalOpClass to do outer process.
/// * #LANG : command-words to give behaviour to actions.
/// * ADD IS-GLOBAL bool field to Operation-classes.
/// * Connector classes might have precedence in Mill-op.
/// * Might trig some action in their connected sister-operations.
//  * Find common interests, i've been here.. follow-me, give-take
/// * Other objects also handle things connected to this. So connector might
/// * be just  a simple message (plea) mediator.
/// * Global op does something
//  NOTE:
//  devNote: tracking begins.

library connector;

///  path dependency
import 'package:dawolang/dawolang.dart';

import 'alpha.dart';

//  TODO import ruins this app flowServe stops working. lib-function import 2X
import 'beta.dart';

import 'shower.dart';
import 'tools.dart';

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
* MAYBE:
*
* NOT:  Handle #area #resource #time #money aso. properties.
* NOT:
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
  String info = 'App - mission - chore co-op in #corporate.process via #LANG';
  String motto = 'Give objects long, powerful extra hand.';

  ///  devNote: IDEA: Fields for to better shape outPut stuff in console.
  String seal = ":CONNECTOR:"; //  like:  ":CONNECTOR:";
  /// .. or this:  emblem can be used in _flowC
  String emblem = ':C:';
  String indent = "      "; // like: 3-5-7 empty marks or something visible.

  //  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  ///  clause walks with objects in process call and carries list of words.
  ///  Combination of #LANG words in sentence.
  String clause = ":DO :HINT :FIND :AREA :JOIN :OPEN :RULE";
  String master; //  Object that owns this. Now only a String.

  // Buffer inside class to keep String-data for output.
  StringBuffer buf = new StringBuffer();
  String _sb = 'cb- '; //  marking all buf rows.

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'offB': true,
    'onB': false,
    'pauseB': false,
    'doneB': false,
  };

  ///  *****************************************************************
  ///  GlobalOperation ?
  ///  * Using GlobalOpClass might be too heavy.!!
  ///  var msgBus * Sending messages between objects. Stance, approach
  ///  If this is only simple msg-handler getPlea, handlePlea, givePlea
  ///  And now section, that handles all those small details:

  ///  #New: #Gear Something turns around this.
  ///  the sail pivots around the axis of a virtually static mast
  var pivot;

  //  typedef void _ConPrint(String msg); // announced outside of class
  //  _ConPrint
  void _conPrint(String msg) {
    if (_pB) print(':_conPrint$emblem $_pB  $msg');
  }

  ///  or: void metro() {}   for putting messages to move.
  ///  PING, Putting messages in queue or sending them immediately.
  // void ping(Baker sender, receiver, var key) {
  void ping(String sender, receiver, key, msg) {
    print('    :ping: is used.. hooray!! S: $sender R: $receiver K: $key ');

    ///  code
  }

  ///  Members, that are participating in this connector.
  ///  Member is a class in alpha.
  ///  #PLAN:  eventually this will be Member.
  //  Map<String, Member> memberM = {};  Not object yet.
  Map<String, String> memberM = {
    'cM-1': 'First :con:Member:test:',
    'cM-2': 'Second :con:Member:test:',
  };

  ///  get / collect bindings
  ///  Processes, that are bind inside connector.
  int bindC = 0;

  ///
  Map<String, String> bindTypes = {
    'all': ':bind:all:',
    'first': 'First accountant',
    'name': 'Member _____',
    'unknown': 'Unknown ____',
  };

  ///  Structure and usage of this map is not yet clear.Data is like:
  ///  Dawo example D-ex-loops
  //   Rumba instance All sub
  ///  Usage:
  Map<String, Map<String, String>> bindingM = {
    'all': {'Try': ':bind:1', 'Test': ':bind:2'},
    'first': {'Play': ':bind:7'},
    'name': {'N:x': ':bind:nX'},
    'unknown': {}
  };

  ///  Eventually this will be object - object
  //  Map<String, Map<dynamic, dynamic>> bindingM = {};

  //  Connect Members action to one or many other Members action.
  //  eventually this will be: var / dynamic / command...
  //String bind(var senderProcess, var receiverProcess, var thing, String msg)
  ///  Usage:  opJoin is calling this
  //String bind(String sProcess, String rProcess, String thing, String msg) {
  String bind(String actorS, senderS, receiverS, comS, msgS, _inMsg) {
    _flowC(':CN:bind:  -->>-->>--  :connector:  C::Chr:  -->>-->>--', _pB);
    //  Idea: Have some binding-models and types.
    //  add / find from bindingM Map
    /// Make new bind name,
    /// NOTE opJoin parameters inMsg  and  caller are available here
    bindC++;
    String bindCS = bindC.toString();
    String bindNameS = '$actorS$bindCS';
    print(':bind:  bindingM putIfAbsent:: bNS: $bindNameS comS: $comS ');

    /// TODO  :bind: _inMsg string to binding system
    /// GET:   C:PING:all: C:BIND:all  from inMsg to catch :first:all:name:
    bindL.add('   $_inMsg');
    print('inMsg:  $_inMsg');
    //  Map<String, Member>
    memberM.putIfAbsent(bindNameS, () => comS);
    print(memberM);
    print(' bindingM putIfAbsent:: S: $senderS  R: $receiverS');
    bindingM['all'].putIfAbsent(senderS, () => receiverS);
    // Map<String, Map<String, String>>
    print(bindingM);
    bindingM['first'].forEach((k, v) => print('$k $v'));

    return 'binding: #one to: #second';
  }

  ///  Giving nice report of connections.
  List report() {
    _conPrint('--------------- connector report ----------------------------');
    List<List<String>> _dbL = new List();
    List<List<String>> _dbL2 = new List();
    _dbL.addAll([tl.mapToList(memberM), joinLog]);
    //  Add message list: for in-coming messages: inMsgL
    _dbL2.addAll([inMsgL, bindL]);
    _conPrint('--------------- connector report devBox:: -------------------');
    //  presenting devBox in 2 x 2 table.
    devBox(':con-r1:', _dbL, 0);
    devBox(':con-r2:', _dbL2, 0);
    _conPrint('--------------- connector report done -----------------------');
    return ['this', 'list', 'is', 'vain']; //  No need for list??
  }

  ///  Connector basic activity, keep list of Members / their operations.
  ///  devNote: Or should it be something smaller? abstract class ModelPlacard?
  List<GlobalOp> opL = new List();

  ///  List for #C information. Used for devBox reporting.
  List<String> joinLog = ['* :connector: join-log *'];
  List<String> bindL = ['*  :connector: bind-list  *'];
  List<String> inMsgL = ['*  :connector: in-msg-list  *'];

  ///  Join "clients" / Members to opList. placardM mediates necessary info.
  ///  Usage: mission, dawoApp, rumba, chore, dawo_example
  void opJoin(Map<String, String> plcM, String inMsg, caller) {
    ///  Operations register to Connector with placardM.
    //  'actor': 'Chore',
    //  'sender': 'Chore instance',
    //  'receiver': '',
    //  'command': 'Ch-cmd:',
    //  'msg': 'Ch-msg:',
    //  *******************************
    ///  code:
    _flowC(':CN:  -->>-->>--  :connector:  C:$caller  -->>-->>--', _pB);

    //  TODO  #dawolang
    _flowC(':CN:  -->>-->>-- :dawolang-call: by :dawo-connector -->>-->>', _pB);

    ///  Using LexiconBase class from dawolang.
    lb.build(':call:WG:-:dawolang:  :by:dawo-:connector:');

    ///  Using Analyzer class from dawolang.
    an.analyzeStrS(':ONE more :WEEK :WILL :DO', lb.wordList);
    an.analyzeStrS(':YOU in :NEW :ROLE gives :MORE :VALUE :TO :THIS :PROJECT',
        lb.wordList);

    _flowC(':CN:  -->>-->>- :dawolang-call: by :dawo-connector done -->>', _pB);

    _flowC(':CN:  -->>-->>--  :connector:  C:$caller  -->>-->>--', _pB);
    String actorS = plcM['actor'];
    String senderS = plcM['sender'];
    String receiverS = plcM['receiver'];
    String comS = plcM['command'];
    String msgS = plcM['msg'];
    String _S = "_plcM:-A: $actorS S: $senderS R: $receiverS C: $comS M: $msgS";
    _flowC(':CN:  $_S', _pB);
    String jAddS = '$emblem JoinEvent" $comS $msgS $senderS';
    joinLog.add(jAddS);

    _flowC('\n -->>-->> connector  :con:opJoin:inMsg:    -->>-->>', _pB);
    _flowC(inMsg, _pB);

    ///  Using Analyzer class from dawolang.
    String _weightStringMsg = an.weightString(inMsg, lb.wordList);
    _flowC(_weightStringMsg, _pB);
    _flowC('--<<--<< :con:opJoin:inMsg:  done  --<<--<< \n', _pB);

    /// Use new  inMsgL  for keeping#unmodified   inMsg.
    inMsgL.add(inMsg);
    //  memberM
    //  TODO  Make sure to have original key for every "event"

    ///  -----------  all :bind: stuff to bind-method
    ///  Call parameters from placardM and last from opCom parameter.
    bind(actorS, senderS, receiverS, comS, msgS, inMsg);

    print('--<<-------- bindingM - done -----------------\n');

    _flowC(':CN:-info:  $info', _pB);
    print('** :C:opJoint:  operationMapPrint OR shortMapPrint plcM   **');
    //  tl.operationMapPrint(plcM);
    tl.shortMapPrint(plcM);
    print('--<<-------- plcM  ------------------------');
    //  TODO  connector  add memberM    add  BindingM

    _flowC(':CN:  --<<--<<--  :connector: done   C:$caller  --<<--<<--', _pB);
  }

  ///  Here goes normal init-build-roll-show-done -round. No loop.
  ///  Method for setting class field values to their run-time-values.
  ///  Called by: roll.
  void init() {
    buf.writeln('$_sb ---  Connector buffer output initialized  ---');

    //  Set fields values, mostly lists and maps.
    buf.writeln('$_sb init done');
  }

  ///  Method for further setting class fields in working condition.
  ///  CalledBy:  Roll.
  void build(String _emblem, String _master) {
    st['offB'] = false; //  off-state ends
    st['onB'] = true; //   Connector is in on-state.
    buf.writeln('$_sb :connector: -> build done');
  }

  ///  #run / roll method
  void roll() {
    buf.writeln('$_sb Connector::    $info   $emblem roll engaged ');
    init(); //  calling init and build methods in this class.
    //  TODO  connector Build parameters.
    build('*CONNECTOR:', 'CONNENCTORS-MASTER:');
    //  code for roll
    //  ***   code missing, see on top of this file
    //
    show();
    done();
    //  code here
  }

  ///  Method for #Members to take part in corporate operations.
  void rollCorporate() {}

  ///  Gives members privileges in joint operations..
  void sharer() {}

  ///  Presentation method.
  void show() {
    //  TODO  Make forced print
    if (_pB) {
      print(':buffer: is printed');
      print(buf);
    }
  }

  ///  close method
  void done() {
    _flowC('Connector::    $info   :: engaged ', _pB);
    //  code here
    buf.write('$_sb ---  Connector buffer output app: done  ---');
    if (_pB) print(buf);
    // Do  not, only when whole system closes.  buf.clear(); //  empty buffer
  }

  /// 3 #LANG specific commands, that configure objects behaviour in relation
  /// to other objects.
  ///  TODO  Name for next 3 fields might be opTouche aso.
  ///  Solve one unambiguous textual find-decide problem.
  ///  NOTE: might be separate Touche class.
  String touch(String sender, String key, String source) {
    //  TODO problem
    return 'solved:toucheStr: ';
  }

  ///  Search big amount of #clay data for #customer:s key / order.
  ///  .. solve textual problems based on keywords / search in textual data
  ///  NOTE: might be separate Solver class.
  String solve(String sender, String key, String source) {
    //  TODO problem
    return 'solved: solveString';
  }

  ///  TODO:  connector one-time calls must have parameters;
  ///  Sketching one-time commands, coming from clients.
  void obey(String sender, receiver, baton, msg) {
    /// #baton  to carry only-one-can-have-at-a-same-time magic thing
    //  TODO  code, badly missing
    //  handle command / message
  }
  //  *****************************************************************

  ///  TODO  typedef  print function
  ///  typedef int Compare<T>(T a, T b);
  //  typedef _conPrint(String msg);
  //   typedef  _conPrint =  void _conPrint(String msg){
  //   if (_pB) print(msg);  }

  ///  Calling print/print-to-buffer function from library: beta.
  ///  Getting local variables; Actor and Buffer right.
  ///  Changing to use local -
  void _flowC(String msg, bool prnB) {
    ///  Call flowServe with #LOCAL variables.
    //  TODO  Why not find beta flowServe() ??
    //  flowServe(':con:flC:$prnB ', buf, msg, prnB);
    flowServe(':con:flC: ', buf, msg, true); //  $prnB : when needed.
  }

  ///  constructor
  Connector(this.name, this.info);
}

///  Create instance of Connector.
var con = new Connector('DawoAppconnector', 'Connection operations');

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
  //  var connector = new Connector();
  //  or: shorthand
  var c = new Connector('render-test-connector', 'just for testing');
  c.info;
}
