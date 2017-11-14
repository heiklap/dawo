// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ## Modeling joint, reusable controls and operations for libraries.
///  dawo/base_lib,  dawo version:  0.0.5  6.11.2017
///  READY-STATE for version 0.0.6   0 %   in GIT  Yes
///
///  Time to start thinking 6.th floor's machinery, when you are only just
///  laying base foundations for your 20-floor factory.
///
///  All dawo code-constructing should depend on code, that is here, and all
///  thinking about dawo should concentrate on collecting reusable code here.
///
///  idea:   some base / flow  functionality, that is too small for packages,
///  and too big for tools.dart or dawo_app.dart.
///  Connections to packages, that we do not want to import fully. (?)
///  Extra control / flow / actor variables for processes/events/jobs
///
///  Hist:  hkl  9.10.2013  0.0.1  dawo/lib    daw lib_base.dart
///  Returned 10.9.2017 to same idea with empty hands.
///
///  #Word  Stream  34 times
///  Open for all ideas, when seeking joint functionality between app / lib /
///  classes / process aso.
///  NOTE: Problem:  #actor / glbActor; how to handle in sub-processes
///  RULE:  #actor  every #actor deletes it's own name when op-done, and
///  --- returns previous actor, if it,s operation is not done. #Glorious.
///  devNote:  No notes.

//TODO  Global variables
//TODO  Global operations

library base_lib;

import 'dart:async';
import 'dart:math';

///  How base_lib manages so far NOT importing base_struct?
import 'base_struct.dart';
import 'corporate.dart';  //  these import each other.
import 'dawo_dev.dart';
import 'shower.dart'; //  for devBox

//  TODO  Final readiness.  this is not
final num dawLibBaseReadiness = 2; //  readiness for  version  0.0.1
int flowI = 0; //  flow-counter.

//  hklTry this.
typedef FlowServe(String actor, StringBuffer buf, String msg, bool pr);

//  TODO  typedef SPrint
typedef void SPrint(String msg);
//  typedef SPrint(String msg);
SPrint sPrint(String msg) {
  if (_pB) print(':sPrint:  $msg');
}

///  buffer also outside class, for testing and adding visibility
var baseLibBuf = new StringBuffer();
bool _pB = true; //  Control console-printing.

///  setting flow-print now to zero.
bool printGlobalB = false;

String baseLibMotto = 'Serving joint reusable resources to users.';

///  test:  for testing, assign-functions are for sharing stuff.
void assignDawo() {
  print('   **  hello (share stuff) from dawo app /base_lib    ***');
}

/// ..  or is it class BasePlacard ?
///  Placard: Common form of information, that is in hand for every operation.
///  Model for #id-data in joint handshake method.
Map<String, String> placardM = {
  'actor': '',
  'sender': '',
  'receiver': '',
  'command': '',
  'msg': '',
};

///  Global class. in early dev state
class GlobalClass {
  //  innoTeam
  var register; //  register of objects that participate in Dawo / glb.
  //  Actor: String actor;  //  too important to be a String
  //  Not used anymore, everybody uses flowC() and local :ACTOR :buf:
  String actor = ':UNKNOWN: - :UNUSED:'; //  too important to be a String.
  ///  Not much use, #Actor is announced in function parameter.
  void changeActor(String act) {
    actor = act;
  }
  //  code
}

var glb = new GlobalClass();

///  TODO   Global variables. What is best way to send this kind of data?
///  Try to imagine, what we will need.
class GlobalVariables {
  // Aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout. Grabbed.
  var signature;
  var output;
  var input;
  void showInfo() {
    print('\n ***  no code in GlobalVariables yet :)  *** \n');
  }
}

// Create instance as:  glb

///  TODO  Global operations
///  Every dawo #operation could relay on these.
///  Order: #actor #sender #receiver #command #msg
///  Very early development state, idea: 10%
///  This can be #sub-process, that normal rollOp uses. #Connector may give
///  this extra power and connect to other operations.
///  For that, here should be added fields.
///  IDEA: Change this name to class CoOp.  So why not:  Coup.
class GlobalOpClass {
  //  BaseStruct is known here.
  //  BasePlacard is known also.

  //  String actor;  //  too important to be a String
  String actor = ':No usage yet:'; //  Too important to be a String.
  var actorState;
  Map<dynamic, dynamic> actorM = {};

  String sender;
  String receiver;

  ///  Operation levels.
  var opLevel; //  Is it changed during operation?
  var opChange; //  Handle actual change.

  /// Question:  Can it be a function?
  Function cmd;
  String msg;

  var operation; //  not used

  //  TODO  constructor add
  GlobalOpClass(this.actor, this.sender, this.receiver, this.cmd, this.msg);
  //TODO : used in: ?  //  Only in render here.

  ///
  List<String> showInfo(String caller) {
    List<String> _l = [];
    String i = '          ';
    print('$i ***************  global op class-showInfo  ****************');
    _l.add('$i ** actor: $actor      C:  $caller');
    _l.add('$i ** sender: $sender   receiver: $receiver ');
    String _cmdS = cmd.toString();
    _l.add('$i ** cmd: $_cmdS ');
    cmd(); //  TODO  resolve this for List
    _l.add('$i ** msg:   $msg');
    _l.add('$i ** ');
    print('$i ***************  global op class-showInfo  done ************ ');
    print('$i  ***  no code in GlobalOperations yet :)  *** \n');
    return _l;
  }
}

//  Just testing Create instance as glbOp.
var glbOp =
    new GlobalOpClass('dawoApp', 'xSender', 'xReceiver', assignDawo, 'msg');

///  Simulating resources.
//  Resource class changed to:  Equipment library.

//  TODO  create some "tech"
///  Some variables that have not yet find their places inside classes.

/// Chores are biggest users of this.
/// Stock handles and shares joint resources with participants.
///  Resources are: people, places, jobs aso.
class Stock {
  /// al" base_classes for below vars and functions.
  //  code;  give nice table with random-generator.
  var supply;
  var demand;
  //  void passage, entry
}

///  Form a String that describes operation-sender-activity-time for log-entry.
String clause(var placard) {
  ///  Placard is operation #signature, that describes it clearly.
  //  #CODE  form a String
  return 'clauseStr';
}

///  handling #global #actor
///  Who is in "charge" of operation, when it is routed through subroutines?
///  Problem: howTo handle #glbActor change, when subroutines occur?
void changeActor() {
  //  #CODE
}

///  Not so needed, when #actor is handled in lib-local functions.
///  Method to run actual actor-change procedure.
void actorMill() {
  ///  RULE:  #actor  every #actor deletes it's own name when op-done, and
  ///  --- returns previous actor, if it,s operation is not done. #Glorious.
  // #CODE
}

///  IDEA: flow command through function, that records it's info for op-system
///  Name for this heart of big-clocking-system ?
void getOperationInfoOnParameters() {
  ///
}

/// Do not look out unprofessionally and spam your code with print-clauses!
/// Instead use: flow !!
//  Actor and buf are not needed in parameter !!  They are get from Global
//  void flow(String actor, StringBuffer buf, String msg, bool pr)
///  DONE:  To avoid messing with buffer and actor HOORAY: used local fl().
///  local: fl calls this Flow()
FlowServe flowServe(String actor, StringBuffer buf, String msg, bool pr) {
  ///  ********************************************************************
  ///  GETTING NOW  ACTOR AND BUFFER RIGHT, WHEN USED LOCAL fl()
  /// **********************************************************************
  //  TODO : is flow pushing empty rows to buffers?
  //  hklTry, add :FS:
  //  Handle flow-counter, flowI
  flowI++;
  String flowIS = flowI.toString();

  ///  Added opC: to flow-counter for easy search.
  String _flowIS = 'opC:$flowIS';

  String header = ':fs:$pr:';
  String text = '$actor $header$_flowIS  $msg ';
  //  #debug  print(':flowServe:test:  $_msg $pr');
  if (pr) print(':flowServe:test:  $text');
  // DONE:  Now _buf comes from caller in parameters.

  buf.writeln('$text');
  //  buf.writeln('$actor $_flowIS $msg');
  //  Code here.
  //  Form nice String (for print and/or buf) that describes ongoing operation.
}

///  Find String in out-buffers;
void flowFind(String caller, String _fs, int len) {
  print('lllllllllllllllllllllllll  flowList  c: $caller  llllllllllll');
  print(' Seeking: $_fs');
  int foundC = 0;
  List<String> flowList = new List();

  ///  Find all "flow-process' Strings
  int bufC = 0;

  ///  type Map in for loop must implement iterable.
  for (var x in out.outBufM.keys) {
    bufC++;
    print('buffer n:o:  $bufC');
    int _lng = x.length;
    print('length: $_lng  ');

    ///  change buffer to String.
    String s = x.toString();
    int current = 0;
    flowList.add(s.substring(6, 42));
    //  while(current < s.length){
    //  Do we have find here?
    int sInd;
    sInd = s.indexOf(_fs, current);
    print('sInd:  $sInd');
    if ((sInd > 0) && ((sInd + len + 1) < s.length)) {
      current = sInd;
      flowList.add(s.substring(current, (current + len)));
      foundC++;
      print('found:  $foundC');
    }
    //  }  //  ----- s
  } //  -----  outBufL

  print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
  print('FLOW-LIST:');
  flowList.forEach(print);
  print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
  print('flowList-length: ');
  print(flowList.length);
  print('lllllllllllllllllllllllll  flowList  c: $caller  done lllllllllll');

  // No for Map   if (_pB) outBufM.forEach(print); //  Not output for now.
  if (_pB)
    out.outBufM.forEach((k, v) => print('$k, $v')); //  Not output for now.
}

///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
///  * * *    in base_lib, chore, mission and dev   * * *
var decision;
var decisionChain;
var callChain; //  Give objects ability to know route, that called it.


///  Usual presentation / play function.
StringBuffer renderBaseLib() {
  print('\n ================= render base llib ========================');

  StringBuffer _retBuf;

  ///  For to share stuff with global command in #op
  ///  TODO  "Global-connect" function for to use in :corporate:process: / op.
  ///  TODO  This should have same name in all libraries?
  String assignBaseRender() {
    print('   **  baseRender assignBaseRender > :corporate:process:    ***');
    return ('   **  baseRender assignBaseRender > :corporate:process:   ***');
  }

  var glbVar = new GlobalVariables();
  glbVar.showInfo();

  /// and instance;
  var renderBaseLibClass = new GlobalOpClass(
      'n:name', 'renderBaseLib', 'rec:test', assignDawo, 'all ok');

  print('-->-->--  calling :corporate:process:  -->-->--   ');

  ///  Using local placardM
  corporate.process(':RenderBLib:', renderBaseLibClass, placardM, assignBaseRender);

  renderBaseLibClass.showInfo('By: renderBaseLib');

  print('================= render base llib : done ================= \n');
  return _retBuf;
}

//
