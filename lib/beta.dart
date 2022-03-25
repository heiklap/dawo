// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ## Modeling joint, reusable controls and operations for libraries.
///  dawo/beta,  dawo version:   0.3.0.  23.3.2022.
///  devState   40 %   in GIT  Yes
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

library beta;

import 'src/glb.dart'; //  for glb.. & printControl.
import 'alpha.dart';

///  TODO  Final readiness.  this is not
final num betaReadiness = 2; //  readiness for  version  0.2.0
int flowI = 0; // flow-counter.
///  control for printing.
bool _betaPB = true;

//  hklTry this out now.
//  Typedef FlowServe(String actor, StringBuffer buf, String msg, bool pr);

///  ifPrint function
void ifPrint(Object obj, bool _b) {
  /*   Flags in glb.st Map, that control printing of different things.
  'flow' : false,  //  false prevents all "flow" printing via flowServe();
  //  Shorten output 2 screens.
  'buf' : false,  // TODO   controls bufPrint
  'info' : false,
  'help' : false,
  'bug' : false,
  'test' : false,
  'msg' : false,
  'dev' : false,
  'header' : false,
  'footer' : false,
  'state' : false,  //  state
  */
  ///  TODO Can this print buf, map, list, String?
  if (_b) print(obj);
}     //     -----     ifPrint

///  * *  This is main f-Print, that handles all flowC call from every library.
///  Do not look out unprofessionally and spam your code with print-clauses!
///  Instead use: flow !!
///  Actor and buf are not needed in parameter !!  They are get from caller.
///  void flow(String actor, StringBuffer buf, String msg, bool pr)
///  DONE:  To avoid messing with buffer and actor HOORAY: used local flowC().
///  ALL  local flowC() calls this flowServe()
void flowServe(String actor, StringBuffer buf, String msg, bool pr) {
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
  //  ?? WHAT?   $pr:  If want true / false.
  String header = 'fs:';
  String text = '$actor$header$_flowIS $msg ';

  //  Try checking that value is not NULL, before using it in a condition
  //  && glb.st['flow']  /   Shortens output from 24 to 22 screens.
  //  HowTo  NULL Condition  OK
  //  howTo NULL  error: a nullable expression can't be used as a condition
  //  if (pr && glb.prSt['flow']) print(text); // When needed  :flowServe:test:
  if (pr && glb.prSt['flow']!) print(text); // When needed  :flowServe:test:

  // DONE:  Now _buf comes from caller in parameters.
  buf.writeln('$text');
  //  buf.writeln('$actor $_flowIS $msg');
  //  Code here.
  //  Form nice String (for print and/or buf) that describes ongoing operation.
}     //     -----     flowServe

///  Find String in out-buffers;
void flowFind(String caller, String _fs, int len) {
  print('lllllllllllllllllllllllll  flowList  c: $caller  llllllllllll');
  print(' Seeking: $_fs');
  int foundC = 0;
  List<String> flowList = [];

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
}      //     -----     flowFind

///  Calling print/print-to-buffer function from library: beta.
///  Getting local variables; Actor and Buffer right.
///  Changing to use local -
void _flowC(String msg, bool betaPB) {
  ///  Call flowServe with #LOCAL variables.
  //  TODO  Why not find beta flowServe() ??
  flowServe(':beta:flC:$betaPB ', betaBuf, msg, betaPB);
}

///  TODO  typedef SPrint, comment away.
///  typedef void SPrint(String msg);
///  typedef SPrint(String msg);
void sPrint(String msg) {
  if (_betaPB) print(':sPrint:  $msg');
}

///  buffer also outside class, for testing and adding visibility
StringBuffer betaBuf = StringBuffer();

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
///  Placard: Uniform information, that is in hand for every operation.
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

/// Chores are biggest users of this.  NOTE:  also Store-class.
/// Stock handles and shares joint resources with participants.
///  Resources are: people, places, jobs aso.
class Stock {
  /// add lasses for below vars and functions.
  //  code;  give nice table with random-generator.
  var supply;
  var demand;
  //  void passage, entry
}     //     -----     class Stock

///  IDEA: flow command through function, that records it's info for op-system
///  Name for this heart of big-clocking-system ?
void getOperationInfoOnParameters() {
  ///
}

///  Usual presentation / play / test  function.
StringBuffer renderBeta(String caller) {
  print('\n ================= render beta C: $caller ======================');
  _flowC(':beta:renderBeta:', _betaPB);
  StringBuffer _retBuf = StringBuffer();

  String assignBetaRender() {
    print('   **  betaRender assignBetaRender > :corporate:process:    ***');
    return ('   **  betaRender assignBetaRender > :corporate:process:   ***');
  }

  assignBetaRender();
  print('================= renderBeta : done  C: $caller ============ \n');
  return _retBuf;
}     //     -----     renderBeta

//
