// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///
///  ## Modeling joint, reusable controls and operations for libraries.
///  dawo/beta,  dawo version:   0.9.0.  30.3.2022.
///  devState   40 %   in GIT  Yes
///
///  Time to start thinking 6.th floor's machinery, when you are only just
///  laying basic foundations for your 20-floor factory.
///
///  All dawo code-constructing should depend on code, that is here, and all
///  thinking about dawo should concentrate on collecting reusable code here.
///

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

import '../src/glb.dart'; //  for glb.. & printControl.
import '../alpha/alpha.dart';

part 'flow.dart';

///  TODO  Final readiness.  this is not
final num betaReadiness = 2; //  readiness for  version  0.7.0
int flowI = 0; // flow-counter.

///  Some global print and flow assets
class BetaBase {
  ///  Some betaX variables that are outside classes.
  String betaMotto = 'Serving joint reusable resources to users.';

  ///  control for printing.
  bool _betaPB = true;

  ///  buffer also outside class, for testing and adding visibility
  StringBuffer betaBuf = StringBuffer();

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

  ///  Form a String that describes operation-sender-activity-time for log-entry.
  String betaClause(var placard) {
    ///  Placard is operation #signature, that describes it clearly.
    //  #CODE  form a String
    return 'clauseStr';
  }

  ///  test:  for testing, assign-functions are for sharing stuff.
  void betaAssign() {
    print('   **  hello (share stuff) from betaAssign    ***');
  }
} //     -----     BetaBase

//  instance
BetaBase beta = BetaBase();

//  hklTry this out now.
//  Typedef flow.fServe(String actor, StringBuffer buf, String msg, bool pr);

///  ifPrint function
///  callers:   usage:   no
void ifPrint(Object obj, bool _b) {
  /*   Flags in glb.st Map, that control printing of different things.
  'flow' : false,  //  false prevents all "flow" printing via flow.fServe();
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
} //     -----     ifPrint

///  TODO  typedef SPrint, comment away.
///  typedef void SPrint(String msg);
///  typedef SPrint(String msg);
void sPrint(String msg) {
  if (beta._betaPB) print(':sPrint:  $msg');
}

///  setting flow-print now to zero.
bool printGlobalB = false;

//  TODO  class Supply  Chain0

/// Chores are biggest users of this.  NOTE:  also Store-class.
/// Stock handles and shares joint resources with participants.
///  Resources are: people, places, jobs aso.
///  Usage:   callers:  no
class Stock {
  /// add lasses for below vars and functions.
  //  code;  give nice table with random-generator.
  var supply;
  var demand;
  //  void passage, entry
} //     -----     class Stock

//

///  IDEA: flow command through function, that records it's info for op-system
///  Name for this heart of big-clocking-system ?
void getOperationInfoOnParameters() {
  ///
}

///  common, public instance of Stock
  Stock stockCmn = Stock();

///  Usual presentation / play / test  function.
StringBuffer renderBeta(String caller) {
  print('\n ================= render beta C: $caller ======================');
  flow._flowC(':beta:renderBeta:', beta._betaPB);
  StringBuffer _retBuf = StringBuffer();

  String assignBetaRender() {
    print('   **  betaRender assignBetaRender > :corporate:process:    ***');
    return ('   **  betaRender assignBetaRender > :corporate:process:   ***');
  }

  assignBetaRender();
  print('================= renderBeta : done  C: $caller ============ \n');
  return _retBuf;
} //     -----     renderBeta

//
