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

//  TODO  Final readiness.  this is not
final num dawLibBaseReadiness = 2; //  readiness for  version  0.0.1

///  buffer also outside class, for testing and adding visibility
var baseLibBuf = new StringBuffer();

String baseLibMotto = 'Serving common reusable functionality to all files';

///  test:  for testing
void helloDawo() {
  print('   **  hello from dawo app /base_lib    ***');
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
  String actor = ':UNKNOWN: - :UNUSED:'; //  too important to be a String
  void changeActor(String act){
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
  void showInfo() {
    print('\n***************  global op class-showInfo  ********************');
    print('** actor: $actor ');
    print('** sender: $sender   receiver: $receiver ');
    print('** cmd: $cmd.toString() ');
    cmd();
    print('** msg:   $msg');
    print('** ');
    print('***************  global op class-showInfo  done *************** n');
    print('\n ***  no code in GlobalOperations yet :)  *** \n');
  }
}

//  Just testing Create instance as glbOp.
var glbOp = new GlobalOpClass('dawoApp', 'xSender', 'xReceiver', helloDawo , 'msg');

//  TODO  create some "technical" base_classes for below vars and functions.

///  Some variables that have not yet find their places inside classes.

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
///  TODO  To avoid messing with buffer and actor HOORAY: use local fl()
///  local: fl calls this Flow()
void flowServe(String actor, StringBuffer buf, String msg, bool pr) {
  //  TODO  NOT: Watch, who is #actor at a time, and use its buffer.
  ///  ********************************************************************
  ///  TO GET  ACTOR AND BUFFER RIGHT, USE LOCAL fl()
  /// **********************************************************************

  String _actor = actor;
  //  _buf = getGlbBuf();
  if (pr) print(msg);
  // TODO  in this phase _buf must be in parameters.

  buf.writeln('$_actor $msg');
  //  Code here.
  //  Form nice String (for print and/or buf) that describes ongoing operation.
}

///  TODO  Some idea: s.
var decision;
var decisionChain;

//  Elementary stream example, not yet used here in reasonable way.
//  dawoApp.roll drives this.
void commonStream(String caller, var streamData, var streamListen) {
//  var data = streamData; // some sample data
  var stream = new Stream.fromIterable(streamData); // Create the stream.

  // SAubscribe to the streams events.
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
StringBuffer commonProcess(GlobalOpClass glOpC, Function _command) {
  print('--------------  commonProcess -------------------------------------');
  //  TODO  Start info and statistics.
  StringBuffer _retBuf;
  //  code here

  // actual command.
  _command();

  glOpC.showInfo();
  glOpC.operation; //  no operation, just show info now.

  //  TODO  CommonProcess end info and statistics.
  print('--------------  commonProcess done---------------------------------');
  return _retBuf;
}

///  Shaping common functionality for presentation.
void commonShow() {
  //  code here
}

///  Usual presentation / play function.
StringBuffer renderBaseLib() {
  print(
      '\n ================= render base llib ========================');
  StringBuffer _retBuf;

  /// And instance;
  void greetFromRender() {
    print(' greetings from render base_lib');
  }

  var glbVar = new GlobalVariables();
  glbVar.showInfo();

  /// and instance;
  var renderBaseLibClass = new GlobalOpClass(
      'n:name', 'renderBaseLib', 'rec:test', helloDawo, 'all ok');
  commonProcess(renderBaseLibClass, greetFromRender);

  renderBaseLibClass.showInfo();

  return _retBuf;
}

//
