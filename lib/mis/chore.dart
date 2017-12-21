// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Chore for organizing work flow.  Version:  0.0.7.  18.12.2017
///  devState : 25 %  -   In  GitHub:   yes
///
///  Primary functionality: get notes-list aso data from input/clay
///  incoming data (clayIn) comes from customer. coders OR sample aso.
///  Controlling work-flow and processes. Wrapper round of your small piece of
///  code:  Put your actual code inside Chore.
///
///   ## *chore* became eventually its own, independent package, and it did fly
///   out of dawo with it's own wings. Here will be small version of it.
///
///  hkl  6.5.2014  0.0.1  dawo/lib   Common   "w o r k  flow"  methods for dawo
///
///
//  TODO  chore; dawo can't use chore package. Make a simple plugin. But how?

///  idea:   Place ALL common  W O R K  procedures here.
///  Automatic-  life-cycle / W O R K / messages and rolling.
///  NOTE  chore do not have own named out-buffer

//  TODO  chore  Build simple plugin or usage-case for chore.
//  TODO  chore  NEXT, make  Chr -class.??

library chore;

import 'effort.dart';
//  import 'equipment.dart';  //  mission handles equipment

import '../alpha.dart';
import '../beta.dart'; //  flowServe() is here.
import '../tools.dart'; //  flowServe() is here.
import '../src/box_serve.dart'; //  boxServe is here

import '../corp/affair.dart';
import '../corp/connector.dart';
import '../corp/corporate.dart';

import '../dev/dawo_dev.dart';

import '../src/glb.dart';
import '../clay/clay_roll.dart';

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1


///  This is for ALL chores,
StringBuffer choreBuf = new StringBuffer();

bool _pB = false; //  Not printing now.
///  TODO  Temporary hack.
bool pBNotNow = false; //  Not printing now.
int _flowServeCount = 0;

///  Chores that operate in common area, outside Mission class.
List<CommonChore> choreComL = [];

///  TODO  devNote: ==   #chore, that is always in dawoApp
///  So dawoApp uses chore to maintain it's work-projects.

///   Initializing of chore system. Update dev-class.
///   CalledBy: dawo_app build.
void initChoreSystem() {
  dev.devN
    ..add('Make COMMON  init-module to EVERY  lib part. ?')
    ..add('This could be for NOTES like W O R K s to be done.');
  //  devNote:
  dev.admN.add(':INIT-CHORE: NO: for  big   W O R K -lists.');
  dev.innoN.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.howToN.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.secN.add(':INIT-CHORE: :CHECK-IN: testing.');
}

///  Many important dawo class is extending Alpha class.
class CommonChore extends BaseStruct {
  String name = 'Common Chore class  ';
  String info = 'Chore resolves  W O R K  flow and control ..';
  //  Do not initialize values; just study, what this class got.
  String motto = 'chore handling small jobs as sub-ordinate of mission.';
  String clause; //  Combination of #LANG words in sentence.

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //   No usage
  String emblem; //  or this emblem.  like:  ":DAWO-APP:";
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.

  String master; //  mission, that owns this chore. Like : 'packDawo'
  var sister; //  get other same-group chores via master/Mission choreL
  //  or via up-level choreL list.

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': true,
    ///  Controlling chores state, working-condition-state values.
    'work': false,
    'pause': false,
    'done': false,
  };

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, int> extra = {
    'init': 0,
    ///  Controlling chores state, working-condition-state values.
    'build': 0,
    'roll': 0,
    'flux': 0,  //  #say flow, aso: common bind-bing & 12 others flow.
  };

  //
  Map<String, String> agenda = {
    'help': 'Help Mission.',
    'con': 'Connect chores.',
    'msg': 'Send and listen.',
    'bind': 'Bind to activities.',
  };

  ///
  var circle; //  Other Chores, that we can join.
  void join(circle) {}

  StringBuffer buf = new StringBuffer();

  //TODO  deliberated error to find error in build usage.
  bool errorInBX = false; // TODO  temporary, to find error

  ///  Testing placardM inside chore.
  ///  Present info for outer process calls.
  Map<String, String> placardM = {
    'actor': 'Chore',
    'sender': 'Chore instance',
    'receiver': 'Other Chores',
    'command': 'Ch-command:',
    'msg': 'Ch-message:',
  };

  ///  Dawo active objects are continuously running #action-loop, where their
  ///  act is checked and valuated against other users actions.
  ///  Answers to common say-bind-bing-analyze-camp-schedule-handle-use loop,
  ///  And return values from #Community via #Mill
  ///  These fields correspond to loop-action-loop mill-loop functions.
  Map<String, String> action = {
    ///  Privilege aso for ?? roll
    'msgRoll': 'SAMPLE: :3 :RollOK :NoErrors :readyNEXT',
    //  usher message
    'msgUsher': 'SAMPLE: :U:favorite :U:ok',

    //  mill messages, to controller of main roll-loop
    'msgMill': 'SAMPLE: :MillDone _MillOK _Mill-oneWaiting',
    //  To spheres where this object is: bind to /  users activities
    'bindTo': ':common :buyRound :MaterialRound :StoreInfo',
    //  Special say, that is used in action loop by this user.say
    //  return msg from an analyze #LANG
    'say': ':ADD:    ADD:    ADD:',

    // Message to master, who owns this object
    'master': ':MASTER:Ask    :MASTER:Say    :MASTER:',
    // Use plan field, if exists,  to #SAY in loop
    'plan': ':PLAN:    :PLAN:    :PLAN:',
    //  action #LANG in user.con joined?  join
    'conJoin': 'Seeking connector Join log.',
    // action camp  or  affair ?
    'affair': ':AFFAIR:get    :AFFAIR:say  ',
    //  con answer
    'conMsg': ':con:answer _ _ _ _ _ _ _ _ _ _ _ _ _',
    //  camp   say
    'campSay': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _',
    //   camp get answers
    'campGet': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    //  add / read   effort table
    'effort': ':EFF:',
    //  add / read / use  schedule
    'schedule': 'Checkd: _ _ _ _ _ _ _ _ _ _ _ _',
    //  add / read / use resources
    'resource': ':RES: _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    //  Equipment
    'equ': ':EQU: _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    //  handle ping - send, read, react
    'ping': ':PING: _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    //  statistics.
    'stats': ':OK:___  :BUSY: ___    Re-Run_ _ _ _ _ ',
    //  leave message
    'tell': ':leavedMsg: _ _ _ _ _ _ _ _ _ ',
    //  roll.control,  flow and log.
    'log': ':log: _ _ _ _ _ _ _ _ _ _ _ _ _ _',
  };

  ///  Chore Class and library operations and #answer #say Strings.
  Map<String, String> operations = {
    '* chore *': '* OPERATIONS * ',
    'BeginInitRoll': '_ _ _ _ _ _ _ _ ',
    'decision': '_ _ _ _ _ _ _ _ ',
    'streams': '_ _ _ _ _ _ _ _ ',
    'opCom': 'OP:_ _ _ _ _ _ _ _ ',
    'opJoint': 'OP:_ _ _ _ _ _ _ _ ',
    'op': 'OP:_ _ _ _ _ _ _ _ ',
    'assign': '_ _ _ _ _ _ _ _ ',
    'com WTF?': 'common? _ _ _ _ ',
    'pro WTF?': 'process?_ _ _ _ ',
    'chore': '_ _ _ _ _ _ _ _ ',
    '*GRANT*': '_ _ _ _ _ _ _ _ ',
    'topGrant': ':GR:_ _ _ _ _ _ _ _ ',
    'lowGrant': ':GR:_ _ _ _ _ _ _ _ ',
    'sideGrant': ':GR:_ _ _ _ _ _ _ _ ',
    'startChore': '_ _ _ _ _ _ _ _ ',
    'doChore': '_ _ _ _ _ _ _ _ ',
    'uniteChore': '_ _ _ _ _ _ _ _ ',
    'endChore': '_ _ _ _ _ _ _ _ ',
    'choreEffort': '_ _ _ _ _ _ _ _ ',
    'choreToEffort': '_ _ _ _ _ _ _ _ ',
  };

  ///  V:= Value, E:= effort in Chore development
  Map<String, String> plan = {
    '1. V:5 E:6  ': 'Git part-1 dev _ _ _ _ _ _ _',
    '2. V:9 E:9 ': 'Write mill-say-loop Class_ _ _ _ _ _ _',
    '3. V:5 E:5': 'Git part-2 dev _ _ _ _ _ _ _',
    '4. V:6 E:6': 'Make example packDawo_ _ _ _ _ _ _',
    '5. ': 'Something wlse_ _ _ _ _ _ _',
  };

  ///  Phases of Chore development
  Map<String, String> phase = {
    'ClassStructure': ' 60% ready _ _ _ _ _ _ _',
    'Inside Functions': '20 %_ _ _ _ _ _ _',
    'Outside Functions': 'Not used 0 % _ _ _ _ _',
    'Slave Functions': 'Connect master _ _ _ _ _',
    'Mil-Loop-say': 'Headers done 5 %_ _ _ _ _ _ _',
  };

  ///  Method for setting class field values.
  void init() {
    _flowC('--> C-init $name  -->---->--', _pB);
    extra['init']++;
    String __name = name.toUpperCase();
    String _name = ':$__name :';
    glb.changeActor(_name);
    _flowC('-->  Chore buffer output initialized  -->---->--', _pB);
    buf.writeln(':ch:buf: init for name: $name done');
    //  Set-fields values done.
    _flowC('<-- ch init done  $name --<----<--', _pB);
  }

  ///  TODO  Chore gets emblem and master from mission in build. Are they right
  ///  Method for setting class in working condition.
  ///  Usage:  Caller added:
  void build(String _emblem, String _master) {
    _flowC('--> chore $name build  -->---->--', _pB);
    //  print(':BUG:DEBUG:build:chore:build: $name');
    extra['build']++;
    emblem = _emblem; //  set master and emblem fields.
    master = _master;
    //  TODO  Initialized?  Where?
    if (st['on'] == true) print('\n ALREADY INITIALIZED BUILD CHORE  \n');
    //  print(onB);
    buf.writeln(':ch:buf: chore buid done for: $name  ');
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   app is in on
    _flowC('<--  chore build  $name done --<----<-- ', _pB);
  }

  ///  #run-like method
  ///  If this or one of it's sub-operations conduct #connector-operations,
  ///  it might be annotated in function parameter.
  void roll() {
    _flowC('--> :ch:roll:  $name -->---->--', _pB);
    extra['roll']++;
    _flowC(':ch:roll:  $info   :: roll engaged ', _pB);
    print(':ch:roll:  $info   :: roll engaged :TEST:DEBUG:');

    init(); //  Calling init and build methods in this class.
    //  NOTE  Mission also calls this build.
    //  How to get mission emblem here??  out now.  build();
    //  code for roll
    //  TODO  testing clay map. Scope;  where to lay:: getClay() - function??
    //  print('------------ chore  clay maps -------------------------------');
    //  print(clayMapL);
    //  [helsinkiGuide, packDawo, learnDartlang, myMusic, myTime, nationalParks]
    //  print('------------ chore  clay maps printed Names------------------');

    if (pBNotNow) {
      for (var f in clayMapL) {
        Map _m = getClayMap(f);
        print('\n  map/chore::   $f   ------ ');
        _m.forEach((k, v) => print('$k ,$v'));
      }
      print('-------:ch:roll:    chore  clay maps details done ---------');
    } //  --_pB

    ///  Connector: normal procedure when acting with it.
    ///  Connector: join.  placardM mediates necessary info.
    /// This works, even if analyzer is not finding Connector.
    /// TODO  Connector, analyzer do not find, or handle #var dynamic.
    //  Join "clients" / Members to opList. placardM mediates necessary info.
    _flowC('-->>-->>--  :ch:roll: calling :connector:  -->>-->>--', _pB);
    String connectorMsg = ':EVERY chore :MAY :COME :TO :JOIN :TOMORROW :8clock';
    connector.join(name, placardM, connectorMsg, ':Chr:');
    connector.roll();

    //  we have also instance of Action class: decision.

    //  run #op, for single operation
    op(placardM); //  Actually map is yet not used there.
    //  loop
    buf.writeln(':ch:buf: :chore:rtoll: done for $name ');
    show('no-print, buf, test');
    done();
    //  code here
    _flowC('<-- :ch:roll: $name  done --<----<--', _pB);
  }

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in beta, chore and mission  * * *
  ///  Action class from alpha; name, sayM, reasonM.
  ///  Might serve #LANG phrase to reason made decisions.
  Action decision = new Action();

  Map<String, Map<String, Action>> decisionChainMM;

  ///  ***********************************************************************
  ///  #Word 's for stream-like processes. What 3 words to use?
  ///  chain, procession, queue, order, request, stream, river, flow, rune
  ///  19.10.2017  adapt this structure everywhere, until find better.
  void orderStream() {} //  is not async, just normal wait-a-little-in-queue.
  void chainStream() {} //  real stream, slow answer.
  void fireStream() {} //
  ///  ***********************************************************************

  ///  Operations with other Chores in choreComL List.
  ///  Chore might use #connector to communicate with other Chores.
  opCom() {}

  ///  Second version of above
  ///  Also connector has method of this name.
  ///  Might unite with other chores in special activities.
  void opJoint() {}

  ///  Individual operations are done here.
  ///  Common operation with placard-Map  is in beta.
  String op(Map<String, String> _pcM) {
    _flowC('-->  ch roll=>op:  $name -->---->', _pB);

    ///  NOTE  placardM is not used.  TODO
    String _retStr;
    print('-->>-->>--  :Ch:-op: calling :connector:  -->>-->>--');
    String connectorMsg = ':EVERY chore :MAY :COME :TO :JOIN :TOMORROW :8clock';

    ///  new parameter name; do we get it to right chore name?
    connector.join(name, placardM, connectorMsg, ':Ch:-op:');
    connector.roll();

    ///  Make placard in shape.
    ///  calls commonProcess with #placard
    ///  TODO  operation class instance
    ///  TODO  Constructor: add eventually constructor
    ///  order: #actor #sender #receiver #command #msg
    var chOpClass =
        new Affair(name, 'chore', 'rec:test', 'assignComProChore', 'all ok');
    //  use buffer somewhere
    StringBuffer _retBuf = new StringBuffer();
    _retBuf.writeln('_retBuf in chore-op method is ready...');

    ///  Mediate command to common process (in beta) with info from chore.
    ///  TODO  Mediate clay-stuff itemL to commonProcess
    ///  With actual command:
    ///  Add placardM to parameters
    _retBuf.write(
        corporate.process(':Ch-Op:', chOpClass, placardM, assignComProChore));
    print('\n ---------- chore-Op and common process  ----------------------');
    print(_retBuf);

    print('------------ chore-Op and common process  done  -------------- \n');
    buf.writeln(':ch:buf: :op: for chore: $name  done');
    _flowC('<-- ch roll-op: $name  done <----<--', _pB);
    return _retStr;
  }

  ///  Usual presentation method.
  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'
  void show(String action) {
    _flowC('--> ch show:  $name -->---->--', _pB);
    //  print(buf);
    ///  :TEST: :glb:ifPrint:  Is false: so should not print buf.
    if (glb.prSt['buf']) {
      print('bbbbbbbbbb chore.show  choreBuf bbbbbbbbbbbbbbbbbbbbbbbbbbb');
      print(choreBuf);
      print('bbbbbbbbbb chore.show  choreBuf done bbbbbbbbbbbbbbbbbbbbbb');
    }
    buf.writeln(':ch:buf: :show: done for chore: $name  ');
    _flowC('<-- ch show: $name  done --<----<--', _pB);
  }

  ///  Report of chore.
  List<String> reportList(String caller) {
    String rowInfoS = rowInfo();
    String _s1 = '** __________________ choreReport _______________________';
    String _s2 = '** Name:  $name     C:  $caller';
    String _s3 = '** $info';
    String _s4 = '** $motto';
    String _s5 = '** Master:   $master  Emblem: $emblem';
    String _s6 = '** st: $st.toString';
    String _s7 = '** $rowInfoS';
    String _s8 = '** ';
    String _s9 = '** ';
    String _s10 = '** ______________________________________________________';
    List _l = [_s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9, _s10];
    buf.writeln(':ch:buf: :report: done for chore:  $name  ');
    return _l;
  }

  //
  void box(String caller) {
    buf.writeln(':ch:buf:  box called for chore:  $name ');
    int bufLength = buf.length;
    int choreBufLength = choreBuf.length;


    boxServe.init(42, 190, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':chr:box: ', ':chr:box:'); //  :BUG: C: $caller');

    boxServe.aHeader(1, 5, 'Name: $name');
    boxServe.aHeader(2, 5, 'Master: $master');
    boxServe.aHeader(3, 5, '* chore$name  buf  *');
    //  boxServe.aBox(4, 5, 39, 33, tl.bufToList(buf));
    //  TODO  We have 2 buffers!!
    //  boxServe.aBox(4, 5, 39, 33, buf.toString().split('\n'));
    boxServe.aBox(4, 5, 39, 33, buf.toString().split('\n'));

    boxServe.aHeader(1, 80, 'Info: $info');
    boxServe.aHeader(2, 80, 'Motto: $motto');

    boxServe.aHeader(1, 45, 'bufLength:  $bufLength  ');
    boxServe.aHeader(2, 45, 'chrBufL:  $choreBufLength  ');
    boxServe.aHeader(2, 60, 'count:  $_flowServeCount ');

    boxServe.aHeader(4, 45, '* States * ');
    boxServe.aBox(5, 45, 6, 16, tl.mapToListB(st));

    boxServe.aHeader(4, 61, '*  Extra * ');
    boxServe.aBox(5, 61, 6, 16, tl.mapToListI(extra));

    boxServe.aHeader(10, 45, ' *  C H O R E  placard *');
    boxServe.aBox(11, 45, 6, 22, tl.mapToFineList(placardM, 8, 14));

    boxServe.aHeader(17, 44, '* Chore Operations *');
    boxServe.aBox(18, 45, 22, 33, tl.mapToFineList(operations, 13, 20));

    boxServe.aHeader(4, 83, ' * Agenda: con Msg: :bind: * ');
    boxServe.aBox(5, 83, 6, 27, tl.mapToFineList(agenda, 5, 20));

    boxServe.aHeader(4, 120, ':Outer Dawo actions and answers in common roll-mill-loop ');
    boxServe.aBox(
        5, 115, 22, 70, tl.mapToFineList(action, 10, 60));

    boxServe.vertLine(32, 107, 7); //  planes aso
    boxServe.aHeader(32, 107, ' * Chore   Plans: *');
    boxServe.aBox(33, 107, 6, 39, tl.mapToFineList(plan,12, 27));

    boxServe.vertLine(32, 150, 7); //   phase
    boxServe.aHeader(32, 150, ' * Chore   Phases   *');
    boxServe.aBox(33, 150, 6, 40,  tl.mapToFineList(phase, 18, 20));


    boxServe.show(':box:Chore:', 'print');

    boxServe.done(':box:Chore:');
  }

  ///  get
  String rowInfo() {
    //  st::  'wake'; false, 'work' false',  'pause': true, 'done': false
    String _s = '$name  m: $motto $st.toString ';
    buf.writeln(':ch:buf: :rowInfo: called for chore: $name');
    return _s;
  }

  ///  close method. This is not: terminate.
  void done() {
    _flowC('<-- Chore buffer $name output app: done  --<----<--', _pB);
    _flowC('Chore::    $info   :: engaged ', _pB);
    //  code here
    //  Too many times.  print(choreBuf);
    //  choreBuf.clear(); //
    buf.writeln(':ch:buf:  done called for chore:  $name');

    _flowC('<-- chore.done    ok   --<----<--', _pB);
  }

  ///  For to share stuff with  :affair: command in #operations
  ///  :connector:  to mediate to :affair: and do :bind:
  ///  TODO  Name: #Assign  This should have same name in all libraries?
  String assignComProChore() {
    _flowC('   **  resource sharer assignChore > CommonProcess    ***', _pB);
    buf.writeln(':ch:buf:  :assign:comPro called for $name  ');
    return ('   **  resource sharer assignChore > CommonProcess   ***');
  }

  ///  Calling print/print-to-buffer function from beta.
  ///  Getting local variables; Actor and Buffer right.
  ///  Location of: _flowC inside OR outside of class?
  ///  Here we record no-important messages to _choreBuf
  void _flowC(String msg, bool p) {
    ///  Call flowServe with #LOCAL variables.
    //  Not here _flowServeCount ++;

    //change it for testing   flowServe(':CH:', choreBuf, msg, p);
    flowServe(':CH:', buf, msg, p);
  }

  ///  constructor
  ///  TODO  should add #master field for mission, that owns this chore?
  CommonChore(this.name, this.master, this.info);
} //  -----  CommonChore class

///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right.
///  Location of: _flowC inside OR outside of class?
///  Here we record no-important messages to _choreBuf
///  Started to use / renamed this to ...Outer
void _flowCOuter(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.
  _flowServeCount ++;

  //change it for testing   flowServe(':CH:', choreBuf, msg, p);
  flowServe(':CH:', choreBuf, msg, p);
}

//---------------------------------------------------------------
///  Assume that Chore needs outside-activity to organize all-Chore's.
///  Some elementary: "execute-in-every-user-command-if-flagged" ideas.
///  Sometimes these X 10 objects are executed in EVERY occasion / keystroke..
///    * * *   so they ARE outside of Chore class  * * *
///  PLAN   small checks, updates, msg:s, notes aso.
///  But only, if marked in   "flow - chart"
///  TODO  _flowC DO NOT HAVE ACCESS TO inside-class-name variable.'
///  So it must be given in parameter. lol
void topGrant() {
  _flowCOuter('these   W O R K S   are executed in every cycle', _pB);
}

/// USAGE:    Execution of EVENT is meant to be avoided.. as long as possible.
void lowGrant() {
  ///
  _flowCOuter('FLOW:lowGrant:  These are executed ONLY in last occasion', _pB);
}

///  USAGE:    Run occasionally / timely, in sidebar.
void sideGrant() {
  _flowCOuter('FLOW:SideGrant:  executed occasionally in sidebar..', _pB);
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  _flowCOuter('--> these are executed in beginning of W O R K  ', _pB);

  ///  ABLE: rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow.
  ///  zSignal (signalAble)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore() {
  _flowCOuter(' :FLOW:doChore -->  Actual  W O R K   code here...', _pB);
}

/// United chore   W O R K   routines.
void uniteChore() {
  _flowCOuter(' :FLOW:uniteChore -->  Combined Chore  W O R K   code here...', _pB);
}

///   routines, after W O R K   is done
void endChore() {
  _flowCOuter('<-- endChore  execution scheduled, when  WORK is done', _pB);
}

///  Quick hack to run effort from test aso files.
///  This is only access to effort.
void choreEffort(String caller) {
  //  Add ability to choose between user-data in effort.
  eff.build(':chEf:');
  eff.makeAllLists(':chEf:');

  eff.getDiagonalList(':chEf:');
  eff.showUserDiagonal(':chEf:');

  //  TODO  New
  eff.getRecommendation(':choreEffort:');
}

///  QuickHack
void choreToEffortUserJson(String caller) {
  effortCallingUserJson(':chore:-callRenderUserJson:');
}

///  example / testing chore ----------------------------------------------
StringBuffer renderChore() {
  StringBuffer _retBuf;
//TODO  temporary variables for to get this to work
  var _roller;
  var _aLog;
  var _xList;
  var _yChore;
  var _zSignal;

//  var superChore = new SuperChore();
  var ch = new CommonChore('ChoreInRenderChore', 'renderChore', 'Testing-Chore');
  print(ch.info);

  topGrant();
  lowGrant();
  sideGrant();

  startChore(_roller, _aLog, _xList, _yChore, _zSignal);
  doChore();
  uniteChore();
  endChore();



  //  Enlisted class
  eff.makeAllLists(':render:Chore:');

  print(ch.info);
  return _retBuf;
} //----------------------------------------------   end renderChore

//
