// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  bind   solving literal searches by customer wishes.
///
///  dawo version: 0.0.5  19.11.2017.   READY-STATE  for version 0.0.6  5%
/// *      GitHub:
/// * Hist:hkl  19.11.2017  Moved stuff out from connector. and from beta.
///
/// * State:  schema
//

library affair;

///  conduct?  affair!!
///  Second or third alternative to operations, besides :corporate:
///  NOTE:  Global operations.  Some dawo #operation could relay on these.
///  Order: #actor #sender #receiver #command #msg
///  Early development state, idea: 15%
///  This can be #sub-process, that normal rollOp uses. #Connector may give
///  this extra power and connect to other operations.
///  For that, here should be added fields.
///  IDEA: Change this name to class CoOp.  So why not:  Coup.
class Affair {
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

  ///  handling #glb #actor
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
    print(' ***************  affair class-init  *********');
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
  Affair(this.actor, this.sender, this.receiver, this.cmd, this.msg);
  //TODO : used in: ?  //  Only in render here.

  ///  Usage: for example, :corporate:process:
  List<String> showInfo(String caller) {
    //  add parameter: placardM _pM
    // TODO  like:  : placardM.forEach((k, v) => _li2.add('$k, $v'));
    List<String> _l = [];
    String i = '          ';
    print('$i ***************  affair class-showInfo C: $caller *********');
    //  TODO : give actor aso values to this form.
    _l.add('$i ** actor: $actor      C:  $caller');
    _l.add('$i ** sender: $sender   receiver: $receiver ');
    String _cmdS = cmd.toString();
    _l.add('$i ** cmd: $_cmdS ');
    //  TODO  resolve this for List
    print(':beta:affair:showInfo:  cmd is only a String:$cmd');
    _l.add('$i ** msg:   $msg');
    _l.add('$i ** ');
    _l.forEach(print);
    print('$i ***************  affair class-showInfo  done ************ ');
    print('$i  ***  no code in :affair: Operations yet :)  *** \n');
    return _l;
  }
}

//  Just testing Create instance as affair.
var affair = new Affair('dawoApp', 'xSender', 'xReceiver', 'betaAssign', 'msg');
