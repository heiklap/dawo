// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.
///
///  ##  affair,  handling small jobs inside corporate.
/// * dwv: version:   1.0.1.  11.4.2022. -.   devState:  5%
/// * GitHub:  Yes  -  State:  schema
/// * PLAN:  >>  small upgrade when common methods are ready.
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
class Affair extends CorpInterfaceBasis with JoinMxx, RllMxx {
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

  //  Mixin play :nrg:   JoinMxx, RlllMxx
  void mixinPlay() {
    String mxChainSSample = ':97531mx13579:';
    String mxChainS = ':97531 mx13 579:affair:';
    //  ---  NameReg  nrg

    jnRegStM['nrgDoB']!;
    jnRegStM['nrgIsB']!;
    jnMembL.length;
    jnJoinMe(':affair:misinPlay:', '');
    //  ---  RollAble
    rllInit();
    rllDone();
  }

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

  ///  for mixin call
  ///  To test mixin op
  void actMxx(String _msg) {
    String _mS = ' $mxC.mxLOGO  $_msg ';
    mxC.mxLogL.add('$_mS  :affair:calling:mixin: start');

    String mxChainSSample = ':97531mx13579:';
    String mxChainS = ':97531 mx13 579 affair:';
    //  no other mixin
    //  :BUG:2.0.0   mxBoss.mxActMsg(':camp:mx:Boss:act:msg: ', '_msg: $_msg');
    //  :BUG:2.0.0   actMxx(':affair: :act:mxx: call :act:Mxx:');
    //  mxBoss.mxActMsg(_caller, _msg)
    mxC.mxSigL.add(' $_mS   :affair:calling:mixin:  operation');
    mxC.mxLogL.add(' $_mS   :affair:calling:mixin: done ');
  }     //     -----     actMxx

  ///  Save cleared placardM to to placardMM
  void save() {}

  ///
  void done() {
    ///  invoke mixin method
    rllDone();
  }

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
