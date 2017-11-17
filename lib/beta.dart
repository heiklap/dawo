// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ## Modeling joint, reusable controls and operations for libraries.
///  dawo/beta,  dawo version:  0.0.5  6.11.2017
///  READY-STATE for version 0.0.6   0 %   in GIT  Yes
///
///  Time to start thinking 6.th floor's machinery, when you are only just
///  laying basic foundations for your 20-floor factory.
///
///  All dawo code-constructing should depend on code, that is here, and all
///  thinking about dawo should concentrate on collecting reusable code here.
///
///  idea:   some basic / flow  functionality, that is too small for packages,
///  and too big for tools.dart or dawo_app.dart.
///  Connections to packages, that we do not want to import fully. (?)
///  Extra control / flow / actor variables for processes/events/jobs
///
///  Hist:  hkl  9.10.2013  0.0.1  dawo/lib  daw lib_base.dart > beta.dart
///  Returned 10.9.2017 to same idea with empty hands.

///  Open for all ideas, when seeking joint functionality between app / lib /
///  classes / process aso.
///  NOTE: Problem:  #actor / glbActor; how to handle in sub-processes
///  RULE:  #actor  every #actor deletes it's own name when op-done, and
///  --- returns previous actor, if it,s operation is not done. #Glorious.
///  devNote:  No notes.

//TODO  Global variables
//TODO  Global operations

library beta;

import 'alpha.dart';

//  TODO  Final readiness.  this is not
final num betaReadiness = 2; //  readiness for  version  0.0.1
int flowI = 0; //  Global: flow-counter.
bool _betaPB = true; //  control for printing.

//  hklTry this out now.
// typedef FlowServe(String actor, StringBuffer buf, String msg, bool pr);
//  Typedef FlowServe(String actor, StringBuffer buf, String msg, bool pr);

/// * *  This is main f-Print, that handles all flowC call from every library.
/// Do not look out unprofessionally and spam your code with print-clauses!
/// Instead use: flow !!
//  Actor and buf are not needed in parameter !!  They are get from caller.
//  void flow(String actor, StringBuffer buf, String msg, bool pr)
///  DONE:  To avoid messing with buffer and actor HOORAY: used local flowC().
///  ALL  local flowC() calls this flowServe()
void  flowServe(String actor, StringBuffer buf, String msg, bool pr) {
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
  String header = 'fs:';  //  $pr:  If want true / false.
  String text = '$actor$header$_flowIS $msg ';

  if (pr) print(text);  // When needed  :flowServe:test:
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
  } //  -----  outBufL
  print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
  print('FLOW-LIST:');
  flowList.forEach(print);
  print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
  print('flowList-length: ');
  print(flowList.length);
  print('lllllllllllllllllllllllll  flowList  c: $caller  done lllllllllll');
  // No for Map   if (_betaPB) outBufM.forEach(print); //  Not output for now.
  if (_betaPB)
    out.outBufM.forEach((k, v) => print('$k, $v')); //  Not output for now.
} //  ----- flowFind

///  Calling print/print-to-buffer function from library: beta.
///  Getting local variables; Actor and Buffer right.
///  Changing to use local -
void _flowC(String msg, bool betaPB) {
  ///  Call flowServe with #LOCAL variables.
  //  TODO  Why not find beta flowServe() ??
  flowServe(':beta:flC:$betaPB ', betaBuf, msg, betaPB);
}

//  TODO  typedef SPrint, comment away.
// typedef void SPrint(String msg);
//  typedef SPrint(String msg);
void sPrint(String msg) {
  if (_betaPB) print(':sPrint:  $msg');
}

///  buffer also outside class, for testing and adding visibility
var betaBuf = new StringBuffer();

///  setting flow-print now to zero.
bool printGlobalB = false;

///  Some betaX variables that are outside classes.
String betaMotto = 'Serving joint reusable resources to users.';

///  test:  for testing, assign-functions are for sharing stuff.
void betaAssign() {
  print('   **  hello (share stuff) from betaAssign    ***');
}

///  Form a String that describes operation-sender-activity-time for log-entry.
String betaClause(var placard) {
  ///  Placard is operation #signature, that describes it clearly.
  //  #CODE  form a String
  return 'clauseStr';
}

/// ..  or is it class BetaPlacard ?
///  Placard: Common form of information, that is in hand for every operation.
///  Model for #id-data in joint handshake method.
///  Usage:  dawo_app uses this in :roll:con:opJoin
///  * *  this is supposed to keep #CurrentUser.. at least by dawo_app.
Map<String, String> betaPlacardM = {
  'actor': '',
  'sender': '',
  'receiver': '',
  'command': '',
  'msg': '',
};

///  Global variables class deleted; moved to GlobalClass
///  Global class. in early dev state
///  With this handy and nice  clb  we are one day doing glorious things.
class GlobalClass {
  // Aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout. Grabbed.
  var signature;
  var output;
  var input;

  var register; //  register of objects that participate in Dawo / glb.
  //  Actor: String actor;  //  too important to be a String
  //  Not used anymore, everybody uses flowC() and local :ACTOR :buf:
  String actor = ':UNKNOWN: - :UNUSED:';

  ///  Not much use, #Actor is announced in function parameter.
  void changeActor(String _actor) {
    actor = _actor;
  }

  //  code
  void showInfo() {
    print('\n ***  no code in GlobalClass yet :)  *** \n');
  }
}

GlobalClass glb = new GlobalClass();

///  Second or third alternative to operations, besides :corporate:
///  NOTE:  Global operations.  Some dawo #operation could relay on these.
///  Order: #actor #sender #receiver #command #msg
///  Early development state, idea: 15%
///  This can be #sub-process, that normal rollOp uses. #Connector may give
///  this extra power and connect to other operations.
///  For that, here should be added fields.
///  IDEA: Change this name to class CoOp.  So why not:  Coup.
class GlobalOp {
  //  Alpha is known here.  betaPlacardM is known also.

  String actor = ':No usage yet:'; //  Too important to be a String.
  String sender;
  String receiver;

  /// Question:  Can it be a function?
  String cmd;
  String msg;

  var actorState;
  Map<dynamic, dynamic> actorM = {};
  Map<dynamic, dynamic> actionM = {};

  ///  Other alternatives to main #actor.
  //
  //
  Map<String, Map<String, String>> placardMM = {
    'FirstActor': {
      'actor': 'first',
      'sender': 'fS',
      'receiver': 'fR',
      'command': 'fC',
      'msg': 'fMsg'
    }
  };

  ///  handling #global #actor
  ///  Who is in "charge" of operation, when it is routed through subroutines?
  ///  Problem: howTo handle #glbActor change, when subroutines occur?
  void handleActor() {
    //  Add actor
    //  Remove Actor
    //  Change Actor
  }

  ///  Maybe not needed, when #actor is handled in lib-local functions.
  ///  Method to run actual actor-change procedure.
  void actorMill(var actor, var action) {
    ///  RULE:  #actor  every #actor deletes it's own name when op-done, and
    ///  --- returns previous actor, if it,s operation is not done. #Glorious.
    // #CODE
  }

  ///  Operation levels.
  var opLevel; //  Is it changed during operation?
  var opChange; //  Handle actual change.

  var decision;
  var decisionChain;
  var callChain; //  Give objects ability to know route, that called it.

  void init(Map<String, String> _placardM) {
    print(' ***************  global op class-init  *********');
    _placardM.forEach((k, v) => print('$k, $v'));
    actor = _placardM['actor'];
    sender = _placardM['sender'];
    receiver = _placardM['receiver'];
    cmd = _placardM['command'];
    msg = _placardM['msg'];
  }

  var operation; //  Collecting grate ideas.

  ///  Save cleared placardM to to placardMM
  void save() {}

  void done() {}

  //  TODO  constructor add
  GlobalOp(this.actor, this.sender, this.receiver, this.cmd, this.msg);
  //TODO : used in: ?  //  Only in render here.

  ///  Usage: for example, :corporate:process:
  List<String> showInfo(String caller) {
    //  add parameter: placardM _pM
    // TODO  like:  : placardM.forEach((k, v) => _li2.add('$k, $v'));
    List<String> _l = [];
    String i = '          ';
    print('$i ***************  global op class-showInfo C: $caller *********');
    //  TODO : give actor aso values to this form.
    _l.add('$i ** actor: $actor      C:  $caller');
    _l.add('$i ** sender: $sender   receiver: $receiver ');
    String _cmdS = cmd.toString();
    _l.add('$i ** cmd: $_cmdS ');
    print(
        ':beta:glbOp:showInfo:  cmd is only a String:$cmd'); //  TODO  resolve this for List
    _l.add('$i ** msg:   $msg');
    _l.add('$i ** ');
    _l.forEach(print);
    print('$i ***************  global op class-showInfo  done ************ ');
    print('$i  ***  no code in GlobalOperations yet :)  *** \n');
    return _l;
  }
}

//  Just testing Create instance as glbOp.
var glbOp =
    new GlobalOp('dawoApp', 'xSender', 'xReceiver', 'betaAssign', 'msg');

/// Chores are biggest users of this.  NOTE:  also Store-class.
/// Stock handles and shares joint resources with participants.
///  Resources are: people, places, jobs aso.
class Stock {
  /// add lasses for below vars and functions.
  //  code;  give nice table with random-generator.
  var supply;
  var demand;
  //  void passage, entry
}

///  IDEA: flow command through function, that records it's info for op-system
///  Name for this heart of big-clocking-system ?
void getOperationInfoOnParameters() {
  ///
}

///  Usual presentation / play function.
StringBuffer renderBeta(String caller) {
  print('\n ================= render beta C: $caller ======================');
  _flowC(':beta:renderBeta:', _betaPB);
  StringBuffer _retBuf;

  ///  For to share stuff with global command in #op
  ///  TODO  "Global-connect" function for to use in :corporate:process: / op.
  ///  TODO  This should have same name in all libraries?
  String assignBetaRender() {
    print('   **  betaRender assignBetaRender > :corporate:process:    ***');
    return ('   **  betaRender assignBetaRender > :corporate:process:   ***');
  }
  assignBetaRender();
  print('================= renderBeta : done  C: $caller ============ \n');
  return _retBuf;
}

//
