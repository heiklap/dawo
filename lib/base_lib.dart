///  ## Modeling common, reusable controls and operations for libraries.
///  dawo/base_lib,  dawo version:  0.0.3  25.9.2017
///  READY-STATE for version 0.0.4   0 %   in GIT  Yes
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
///
///  Open for all ideas, when seeking common functionality between app / lib /
///  classes / process aso.
///  NOTE: Problem:  #actor / glbActor; how to handle in sub-processes
///  RULE:  #actor  every #actor deletes it's own name when op-done, and
///  --- returns previous actor, if it,s operation is not done. #Glorious.
///  devNote:  No notes.

//TODO  Global variables
//TODO  Global operations

library base_lib;

import 'dart:async';

///  How base_lib manages so far NOT importing base_struct?
import 'base_struct.dart';
import 'dawo_dev.dart';

//  TODO  Final readiness.  this is not
final num dawLibBaseReadiness = 2; //  readiness for  version  0.0.1

///  buffer also outside class, for testing and adding visibility
var baseLibBuf = new StringBuffer();
bool pB = false; //  Control console-printing.

String baseLibMotto = 'Serving common reusable resources to users.';

///  test:  for testing, assign-functions are for sharing stuff.
void assignDawo() {
  print('   **  hello (share stuff) from dawo app /base_lib    ***');
}

/// ..  or is it class BasePlacard ?
///  Placard: Common form of information, that is in hand for every operation.
///  Model for #id-data in common handshake method.
Map<String, String> placardM = {
  'actor': '',
  'sender': '',
  'receiver': '',
  'command': '',
  'msg': '',
};

///  Global class. in early dev state
class GlobalClass {
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
  List showInfo(String caller) {
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

//  TODO  create some "technic
///  Some variables that have not yet find their places inside classes.

/// Chores are biggest users of this.
/// Stock handles and shares common resources with participants.
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
void flowServe(String actor, StringBuffer buf, String msg, bool pr) {
  ///  ********************************************************************
  ///  GETTING NOW  ACTOR AND BUFFER RIGHT, WHEN USED LOCAL fl()
  /// **********************************************************************
  //  TODO : is flow pushing empty rows to buffers?
  String _actor = actor;
  if (pr) print(msg);
  // DONE:  Now _buf comes from caller in parameters.

  buf.writeln('$_actor $msg');
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
  for (var x in outBufM.keys) {
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

  // No for Map   if (pB) outBufM.forEach(print); //  Not output for now.
  if (pB) outBufM.forEach((k, v) => print('$k, $v')); //  Not output for now.
}

///  TODO  Some idea: s.
var decision;
var decisionChain;

//  Elementary stream example, not yet used here in reasonable way.
//  dawoApp.roll drives this.
void commonStream(String caller, var streamData, var streamListen) {
//  var data = streamData; // some sample data
  var stream = new Stream.fromIterable(streamData); // Create the stream.

  // Subscribe to the streams events.
  stream.listen((value) {
    //
    print('\n--- :stream:1 commonStream Listened     ---');
    print("   :stream: value:  $value"); // onData handler
    print('---  :stream:2 caller: $caller        OK         --- \n');
  });
}

///  Another basic stream example, grabbed from dartlang.org
///  Not used yet here.
void commonStreamBroad(String caller, Iterable streamData, var streamListen) {
  //  var data = intList;
  var stream = new Stream.fromIterable(streamData);
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream //   Using method cascades...
    //  TODO  Test:  Can we NOT use shorthand function?
    ..listen((value) => print("SUCCESS_1_:: stream.listen: $value"))
    ..first.then((value) => print("SUCCESS_2_:: stream.first: $value")) // 1
    ..last.then((value) => print("SUCCESS_3_:: stream.last: $value")) // 5
    ..isEmpty
        .then((value) => print("SUCCESS_4_:: stream.isEmpty: $value")) // false
    ..length.then((value) => print("SUCCESS_5_:: stream.length: $value")); // 5
}

///  Change "Automatic messages" to buf messages.
String commonParamToStr(var sender, receiver, op, msg) {
//  Or return List.
  String s = sender.toString();
  String r = receiver.toString();
  String o = op.toString();
  String _rStr = "$s $r $o $msg";
  return _rStr;
}

///  TODO Automatic messages to buf, in operations.
///  Formulate String for buffer message.
String commonBufMsg(String sender, receiver, op, msg) {
  String _s = "s: $sender  r: $receiver oop: $op msg: $msg";
  //  code here
  return _s;
}

///  Shaping common functionality for series of commands.
void commonRoll() {
  //  code here
}

///  Shaping common functionality for messages.
void commonMsg() {
  //  code here
}

///  caller:  chore-op
///  Shaping common functionality for..
///  TODO  commonProcess
StringBuffer commonProcess(
    String by, GlobalOpClass glOpC, Map placardM, Function _assigned) {
  ///  NOTE  callers placardM is here now.
  String infoS1 =
      '#Caller have accessed #CommonProrocess, where it will hava access in all common resources, ';
  String infoS2 = 'and it can interact with other users.';
  print(infoS1);
  print(infoS2);
  List<String> _li1 = [];
  StringBuffer _cpBuf = new StringBuffer();
  _li1.add(
      '\n -->>-->  commonProcess  #caller: $by ccccccccccccccccccccccccccp');
  _li1.add('glbOpsInUse: ___________________________________');
  _li1.add('  ------  commonStream  -----------');
  _li1.add('   -----  commonStreamBoard  ----------');
  _li1.add('   -----  commonParamToStr  ---------------   -->');
  _li1.add('   -----  commonBufMsg  ---------------');
  _li1.add('   -----  commonRoll  -------------');
  _li1.add('   -----  commonMsg  ----------');
  _li1.add('   -----  commonShow-------');
  _cpBuf.writeln(':_cpBuf: -->>-->  commonProcess  #caller: $by  -------- \n');
  //  TODO  Start info and statistics.
  //  TODO  Make all these Lists for:  devBox
  //  code here
  List<String> _li2 = [];
  _li2.add('placardMap: ');
  //  placardM.forEach((k,v)  => print('$k, $v'));
  placardM.forEach((k, v) => _li2.add('$k, $v'));
  _li2.add('__________________________________');

  devBox('T', [_li1, _li2], 10);

  List<String> _li3 = [];
  // actual command.
  _li3.add('calling command:');
  //  call to function that was get in parameter by caller.
  //  TODO Make this route more evident in in call,  and returned Strings.
  String _comStr = _assigned();
  _li3.add(_comStr); //  Returning String, from caller-object.
  _li3.add('  3. part done in commonProcess. ');

  List<String> _li4 = [];
  _li4.add('calling: glOpC.showInfo AND  glOpC.operation::');
  _li4.addAll(glOpC.showInfo(':commonProcess:'));
  _li4.add('  part 4 done in common process.  ');

  glOpC.operation; //  no operation, just show info now.

  devBox('T', [_li3, _li4], 10);

  //  TODO  CommonProcess end info and statistics.
  _cpBuf.writeln(':_cpBuf:  <--<<--  commonProcess done -------------------\n');
  print('  <--<<--  commonProcess done ccccccccccccccccccccccccccccccccccp \n');
  return _cpBuf;
}

///  Shaping common functionality for presentation.
void commonShow() {
  //  code here
}

///  Usual presentation / play function.
StringBuffer renderBaseLib() {
  print('\n ================= render base llib ========================');

  StringBuffer _retBuf;

  ///  For to share stuff with global command in #op
  ///  TODO  "Global-connect" function for to use in commonProcess / op.
  ///  TODO  This should have same name in all libraries?
  String assignBaseRender() {
    print('   **  baseRender assignBaseRender > CommonProcess    ***');
    return ('   **  baseRender assignBaseRender > CommonProcess   ***');
  }

  var glbVar = new GlobalVariables();
  glbVar.showInfo();

  /// and instance;
  var renderBaseLibClass = new GlobalOpClass(
      'n:name', 'renderBaseLib', 'rec:test', assignDawo, 'all ok');

  print('-->-->--  calling commonProcess  -->-->--   ');

  ///  Using local placardM
  commonProcess(':RenderBLib:', renderBaseLibClass, placardM, assignBaseRender);

  renderBaseLibClass.showInfo('By: renderBaseLib');

  print('================= render base llib : done ================= \n');
  return _retBuf;
}

//
