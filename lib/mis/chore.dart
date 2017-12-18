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

import '../corp/affair.dart';
import '../corp/connector.dart';
import '../corp/corporate.dart';

import '../dev/dawo_dev.dart';

import '../src/glb.dart';
import '../clay/clay_roll.dart';

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

///  Buffer also outside class, for testing and adding visibility.
///  TODO  Chore buffer. Chore do not have #outBuffer.
///  Little dumb: is this for ALL chores?
StringBuffer choreBuf = new StringBuffer();

bool _pB = false; //  Not printing now.
///  TODO  Temporary hack.
bool pBNotNow = false; //  Not printing now.

//  bool _pB = true; //  Printing true for chore_test.dart  TODO

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
  String motto = 'chore handling small jobs';
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

  ///  Method for setting class field values.
  void init() {
    _flowC('--> C-init $name  -->---->--', _pB);
    String __name = name.toUpperCase();
    String _name = ':$__name :';
    glb.changeActor(_name);
    _flowC('-->  Chore buffer output initialized  -->---->--', _pB);

    //  Set-fields values done.
    _flowC('<-- ch init done  $name --<----<--', _pB);
  }

  ///  TODO  Chore gets emblem and master from mission in build. Are they right
  ///  Method for setting class in working condition.
  void build(String _emblem, String _master) {
    _flowC('--> chore $name build  -->---->--', _pB);
    emblem = _emblem; //  set master and emblem fields.
    master = _master;
    //  TODO  Initialized?  Where?
    if (st['on'] == true) print('\n ALREADY INITIALIZED BUILD CHORE  \n');
    //  print(onB);
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   app is in on
    _flowC('<--  chore build  $name done --<----<-- ', _pB);
  }

  ///  #run-like method
  ///  If this or one of it's sub-operations conduct #connector-operations,
  ///  it might be annotated in function parameter.
  void roll() {
    _flowC('--> ch roll:  $name -->---->--', _pB);
    _flowC('Chore::  $info   :: roll engaged ', _pB);

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
      print('------------ chore  clay maps details done --------------------');
    } //  --_pB

    ///  Connector: normal procedure when acting with it.
    ///  Connector: join.  placardM mediates necessary info.
    /// This works, even if analyzer is not finding Connector.
    /// TODO  Connector, analyzer do not find, or handle #var dynamic.
    //  Join "clients" / Members to opList. placardM mediates necessary info.
    _flowC('-->>-->>--  :chore: calling :connector:  -->>-->>--', _pB);
    String connectorMsg = ':EVERY chore :MAY :COME :TO :JOIN :TOMORROW :8clock';
    connector.join(name, placardM, connectorMsg, ':Chr:');
    connector.roll();

    //  run #op, for single operation
    op(placardM); //  Actually map is yet not used there.
    //  loop

    show('no-print, buf, test');
    done();
    //  code here
    _flowC('<-- ch roll: $name  done --<----<--', _pB);
  }

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in beta, chore and mission  * * *
  ///  Action class from alpha
  Action decision;
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
  opCom() {}

  ///  Second version of above
  ///  Also connector has method of this name.
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
    _flowC('<-- ch show: $name  done --<----<--', _pB);
  }

  ///  Report of chore.
  List<String> reportList(String caller) {
    String rowInfoS = rowInfo();
    String _s1 = '** _______________________________________________________';
    String _s2 = '** Nimi:  $name     C:  $caller';
    String _s3 = '** $info';
    String _s4 = '** $motto';
    String _s5 = '** Master:   $master  Emblem: $emblem';
    String _s6 = '** st: $st.toString';
    String _s7 = '** $rowInfoS';
    String _s8 = '** ';
    String _s9 = '** ';
    String _s10 = '** ______________________________________________________';
    List _l = [_s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9, _s10];

    return _l;
  }

  ///  get
  String rowInfo() {
    //  st::  'wake'; false, 'work' false',  'pause': true, 'done': false
    String _s = '$name  m: $motto $st.toSgtring ';
    return _s;
  }

  ///  close method
  void done() {
    _flowC('<-- Chore buffer $name output app: done  --<----<--', _pB);
    _flowC('Chore::    $info   :: engaged ', _pB);
    //  code here
    //  Too many times.  print(choreBuf);
    //  choreBuf.clear(); //  empty
    _flowC('<-- chore.done    ok   --<----<--', _pB);
  }

  ///  For to share stuff with  :affair: command in #operations
  ///  :connector:  to mediate to :affair: and do :bind:
  ///  TODO  Name: #Assign  This should have same name in all libraries?
  String assignComProChore() {
    _flowC('   **  resource sharer assignChore > CommonProcess    ***', _pB);
    return ('   **  resource sharer assignChore > CommonProcess   ***');
  }

  ///  constructor
  ///  TODO  should add #master field for mission, that owns this chore?
  CommonChore(this.name, this.info);
} //  -----  CommonChore class

///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right.
///  Location of: _flowC inside OR outside of class?
void _flowC(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.

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
  _flowC('these   W O R K S   are executed in every cycle', _pB);
}

/// USAGE:    Execution of EVENT is meant to be avoided.. as long as possible.
void lowGrant() {
  ///
  _flowC('FLOW:lowGrant:  These are executed ONLY in last occasion', _pB);
}

///  USAGE:    Run occasionally / timely, in sidebar.
void sideGrant() {
  _flowC('FLOW:SideGrant:  executed occasionally in sidebar..', _pB);
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  _flowC('--> these are executed in beginning of W O R K  ', _pB);

  ///  ABLE: rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow.
  ///  zSignal (signalAble)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore() {
  _flowC(' :FLOW:doChore -->  Actual  W O R K   code here...', _pB);
}

/// United chore   W O R K   routines.
void uniteChore() {
  _flowC(' :FLOW:uniteChore -->  Combined Chore  W O R K   code here...', _pB);
}

///   routines, after W O R K   is done
void endChore() {
  _flowC('<-- endChore  execution scheduled, when  WORK is done', _pB);
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
  var ch = new CommonChore('ChoreInRenderChore', 'Testing-Chore');
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
