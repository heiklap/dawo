// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Chore for organizing work flow.  dawo version:  0.0.4  16.10.2017
///  Ready-state: for 0.0.5 > 15%   In  GitHub:   yes
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

library dawlib_chore;

import 'base_struct.dart';
import 'base_lib.dart';
import 'dawo_dev.dart';
import 'effort.dart';
//  import 'equipment.dart';  //  mission handles equipment
import 'clay/clay_roll.dart';

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

///  Buffer also outside class, for testing and adding visibility.
///  TODO  Chore buffer. Chore do not have #outBuffer.
///  Little dumb: is this for ALL chores?
var choreBuf = new StringBuffer();

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

///  Every important dawo class is extending BaseStruct class.
class CommonChore extends BaseStruct {
  String name = 'Common Chore class  ';
  String infoS = 'Chore resolves  W O R K  flow and control ..';
  //  Do not initialize values; just study, what this class got.
  String motto = 'chore handling small jobs';

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //   No usage
  String emblem; //  or this emblem.  like:  ":DAWO-APP:";
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.
  String master; //  mission, that owns this chore. Like : 'packDawo'
  var sister; //  get other same-group chores via master/Mission choreL
  //  or via up-level choreL list.
  ///
  var circle; //  Other Chores, that we can join.
  void join(circle) {}

  StringBuffer buf = new StringBuffer();

  ///  Controlling chores state, working-condition-state values.
  bool offB = true;
  //TODO  deliberated error to find error in build usage.
  bool errorInBX = false; // TODO  temporary, to find error
  bool onB = false;
  // onB bool;  out temporarily

  bool pauseB;
  bool doneB = false;

  ///  Testing placardM inside chore.
  Map<String, String> placardM = {
    'actor': 'Chore',
    'sender': 'Chore instance',
    'receiver': '',
    'command': 'Ch-cmd:',
    'msg': 'Ch-msg:',
  };

  ///  Method for setting class field values.
  void init() {
    flowC('--> C-init $name  -->---->--', _pB);
    String __name = name.toUpperCase();
    String _name = ':$__name :';
    glb.changeActor(_name);
    flowC('-->  Chore buffer output initialized  -->---->--', _pB);

    //  Set-fields values done.
    flowC('<-- ch init done  $name --<----<--', _pB);
  }

  ///  TODO  Chore gets emblem and master from mission in build. Are they right
  ///  Method for setting class in working condition.
  void build(String _emblem, String _master) {
    flowC('--> chore $name build  -->---->--', _pB);
    emblem = _emblem; //  set master and emblem fields.
    master = _master;
    //  TODO  Initialized?  Where?
    if (onB == true) print('\n ALREADY INITIALIZED BUILD CHORE  \n');
    //  print(onB);
    offB = false; //  off-state ends
    onB = true; //   app is in on
    flowC('<--  chore build  $name done --<----<-- ', _pB);
  }

  ///  #run-like method
  ///  If this or one of it's sub-operations conduct #connector-operations,
  ///  it might be annotated in function parameter.
  void roll() {
    flowC('--> ch roll:  $name -->---->--', _pB);
    flowC('Chore::  $infoS   :: roll engaged ', _pB);

    init(); //  Calling init and build methods in this class.
    //  NOTE  Mission also calls this build.
    //  How to get mission emblem here??  out now.  build();
    //  code for roll
    //  TODO  testing clay map. Scope;  where to lay:: getClay() - function??
    //  print('------------ chore  clay maps ---------------------------------');
    //  print(clayMapL);
    //  [helsinkiGuide, packDawo, learnDartlang, myMusic, myTime, nationalParks]
    //  print('------------ chore  clay maps printed Names---------------------');
    if (pBNotNow) {
      for (var f in clayMapL) {
        Map _m = getClayMap(f);
        print('\n  map/chore::   $f   ------ ');
        _m.forEach((k, v) => print('$k ,$v'));
      }
      print('------------ chore  clay maps details done ---------------------');
    } //  --_pB

    //  run #op, for single operation
    op(placardM); //  Actually map is yet not used there.
    //  loop

    show();
    done();
    //  code here
    flowC('<-- ch roll: $name  done --<----<--', _pB);
  }

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in base_lib, chore and mission  * * *
  var decision;
  var decisionChain;

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
  void opJoint() {}

  ///  Individual operations are done here.
  ///  Common operation with placard-Map  is in base_lib.
  String op(Map<String, String> _pcM) {
    flowC('-->  ch roll=>op:  $name -->---->', _pB);

    ///  NOTE  placardM is not used.  TODO
    String _retStr;

    ///  Make placard in shape.
    ///  calls commonProcess with #placard
    ///  TODO  operation class instance
    ///  TODO  Constructor: add eventually constructor
    ///  order: #actor #sender #receiver #command #msg
    var chOpClass = new GlobalOpClass(
        name, 'chore', 'rec:test', assignComProChore, 'all ok');
    //  use buffer somewhere
    StringBuffer _retBuf = new StringBuffer();
    _retBuf.writeln('_retBuf in chore-op method is ready...');

    ///  Mediate command to common process (in base_lib) with info from chore.
    ///  TODO  Mediate clay-stuff itemL to commonProcess
    ///  With actual command:
    ///  Add placardM to parameters
    _retBuf.write(
        commonProcess(':Ch-Op:', chOpClass, placardM, assignComProChore));
    print('\n ---------- chore-Op and common process  ----------------------');
    print(_retBuf);

    print('------------ chore-Op and common process  done  -------------- \n');

    flowC('<-- ch roll-op: $name  done <----<--', _pB);
    return _retStr;
  }

  ///  Usual presentation method.
  void show() {
    flowC('--> ch show:  $name -->---->--', _pB);
    //  print(buf);
    print('bbbbbbbbbb chore.show  choreBuf bbbbbbbbbbbbbbbbbbbbbbbbbbb');
    print(choreBuf);
    print('bbbbbbbbbb chore.show  choreBuf done bbbbbbbbbbbbbbbbbbbbbb');
    flowC('<-- ch show: $name  done --<----<--', _pB);
  }

  ///  Report of chore.
  List<String> reportList(String caller) {
    String rowInfoS = rowInfo();
    String _s1 = '** _______________________________________________________';
    String _s2 = '** Nimi:  $name     C:  $caller';
    String _s3 = '** $infoS';
    String _s4 = '** $motto';
    String _s5 = '** Master:   $master  Emblem: $emblem';
    String _s6 = '** Off: $offB   On: $onB   Paused: $pauseB    Done: $doneB';
    String _s7 = '** $rowInfoS';
    String _s8 = '** ';
    String _s9 = '** ';
    String _s10 = '** ______________________________________________________';
    List _l = [_s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9, _s10];

    return _l;
  }

  ///  get
  String rowInfo() {
    String _s = '$name  m: $motto on: $onB off: $offB p: $pauseB d: $doneB ';
    return _s;
  }

  ///  close method
  void done() {
    flowC('<-- Chore buffer $name output app: done  --<----<--', _pB);
    flowC('Chore::    $infoS   :: engaged ', _pB);
    //  code here
    //  Too many times.  print(choreBuf);
    //  choreBuf.clear(); //  empty
    flowC('<-- chore.done    ok   --<----<--', _pB);
  }

  ///  For to share stuff with  global command in #op
  ///  TODO  "Global-connect" function for to use in commonProcess / op.
  ///  TODO  This should have same name in all libraries?
  ///  Renamed to show, that only commonProcess is meant to use this.
  String assignComProChore() {
    print('   **  resource sharer assignChore > CommonProcess    ***');
    return ('   **  resource sharer assignChore > CommonProcess   ***');
  }

  ///  constructor
  ///  TODO  should add #master field for mission, that owns this chore?
  CommonChore(this.name, this.infoS);
}

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p) {
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
///  TODO  flowC DO NOT HAVE ACCESS TO inside-class-name variable.'
///  So it must be given in parameter. lol
void topGrant() {
  flowC('these   W O R K S   are executed in every cycle', _pB);
}

/// USAGE:    Execution of EVENT is meant to be avoided.. as long as possible.
void lowGrant() {
  ///
  flowC('FLOW:lowGrant:  These are executed ONLY in last occasion', _pB);
}

///  USAGE:    Run occasionally / timely, in sidebar.
void sideGrant() {
  flowC('FLOW:SideGrant:  executed occasionally in sidebar..', _pB);
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  flowC('--> these are executed in beginning of W O R K  ', _pB);

  ///  ABLE: rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow.
  ///  zSignal (signalAble)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore() {
  flowC(' :FLOW:doChore -->  Actual  W O R K   code here...', _pB);
}

/// United chore   W O R K   routines.
void uniteChore() {
  flowC(' :FLOW:uniteChore -->  Combined Chore  W O R K   code here...', _pB);
}

///   routines, after W O R K   is done
void endChore() {
  flowC('<-- endChore  execution scheduled, when  WORK is done', _pB);
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
  print(ch.infoS);

  topGrant();
  lowGrant();
  sideGrant();

  startChore(_roller, _aLog, _xList, _yChore, _zSignal);
  doChore();
  uniteChore();
  endChore();

  //  Enlisted class
  eff.makeAllLists();

  print(ch.infoS);
  return _retBuf;
} //----------------------------------------------   end renderChore

//
