// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  affair,  handling small jobs inside corporate.
/// * dwv: version:   0.9.9.  4.4.2022. -.   devState:  5%
/// * GitHub:  Yes  -  State:  schema
/// * PLAN:  0.0.8  small upgrade when common methods are ready.
//

//  library affair;
part of corp;

//  import '../alpha.dart';

///  conduct?  affair!!
///  Second or third alternative to operations, besides :corporate:
///  Global operations.  Some dawo #operation could relay on these.
///  Order: #actor #sender #receiver #command #msg
///  Early development state, idea: 15%
///  This can be #sub-process, that normal rollOp uses. #Connector may give
///  this extra power and connect to other operations.
///  For that, here should be added fields.
///  IDEA: Change this name to class CoOp.  So why not:  Coup.
class Affair extends CorpInterfaceBasis {
  //  Alpha is known here.  beta-PlacardM is known also.
  ///
  String name = '* corporate-united *';

  ///
  String motto = '* CorpMotto *';

  ///
  String clause = '*CorpClause*';

  ///
  String actor = ':No usage yet:'; //  Too important to be a String.
  ///
  String sender = '';

  ///
  String receiver = '';

  /// Question:  Can it be a function?
  String cmd = '';

  ///
  String msg = '';

  ///
  var actorState;

  ///
  Map<String, Actor> actorM = {};

  ///
  Map<String, Action> actionM = {};

  ///  Other alternatives to main #actor.
  ///  First record:  'FirstActor'
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
  ///  Is it changed during operation?
  var opLevel;

  ///  Handle actual change.
  var opChange;

  var decision;
  var decisionChain;

  ///  Give objects ability to know route, that called it.
  var callChain;

  ///  Usage:   not used
  ///  Parameter:  it is  MM
  ///  This is called:  placardMM['FirstActor']
  ///  :BUG: warning: unresolved doc reference ['FirstActor']
  void initAffair(Map<String, String> _placardM) {
    print(' ***************  affair class-init  *********');
    _placardM.forEach((k, v) => print('$k, $v'));
    //
    actor = _placardM['actor'].toString();
    sender = _placardM['sender'].toString();
    receiver = _placardM['receiver'].toString();
    cmd = _placardM['command'].toString();
    msg = _placardM['msg'].toString();
  }

  var operation; //  Collecting grate ideas.

  ///  Save cleared placardM to to placardMM
  void save() {}

  ///
  void done() {}

  ///  Usage: for example, :corporate:process:
  List<String> showInfo(String caller) {
    //  add parameter: placardM _pM
    // devl:CORP  like:  : placardM.forEach((k, v) => _li2.add('$k, $v'));
    List<String> _l = [];
    String i = '          ';
    print('$i ***************  affair class-showInfo C: $caller *********');
    //  devl:CORP : give actor aso values to this form.
    _l.add('$i ** actor: $actor      C:  $caller');
    _l.add('$i ** sender: $sender   receiver: $receiver ');
    String _cmdS = cmd.toString();
    _l.add('$i ** cmd: $_cmdS ');
    //  devl:CORP  resolve this for List
    print(':beta:affair:showInfo:  cmd is only a String:$cmd');
    _l.add('$i ** msg:   $msg');
    _l.add('$i ** ');
    _l.forEach(print);
    print('$i ***************  affair class-showInfo  done ************ ');
    print('$i  ***  no code in :affair: Operations yet :)  *** \n');
    return _l;
  } //     -----     showInfo

  //  Constructor
  //  devl:CORP    Affair(this.actor, this.sender, this.receiver, this.cmd, this.msg);
  //  devl:CORP : used in: ?  //  Only in render here.

  ///  constructor
  Affair(this.name, this.motto, this.clause);
} //     -----     Affair

//  Just testing Create instance as affair.
//  Affair affair = Affair('dawoApp', 'xSender', 'xReceiver', 'betaAssign', 'msg');

Affair affair = Affair('affairOne', 'do affair straight', 'Honour matters');
