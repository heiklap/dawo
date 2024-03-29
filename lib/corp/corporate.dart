// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Corporate,  enterprise-like entity.
///  * Holds: Affairs, Stores, takes Order's, makes Jobs in phases.
///  * dwv: version:   1.1.0    23.11.23.
///  * devState:  10%,   PLAN:  do simple demo / presentation.
///
//
//  history: 2017.11.13.   development-state: 5%

//  library corporate;
part of corp;

///  Here objects work together after #connector joins them to system.
///  usage:
///  howTo:mixin   hkl:  extended class should not have mixins inside
///                only extenders have mixin
class Corporate extends CorpInterfaceBasis with ParcelMxx, TellMxx{
  ///
  String name = '* corporate-united *';

  ///
  String motto = '* CorpMotto *';

  ///
  String clause = '*CorpClause*';

  ///  All the affairs, that this corporate owns.
  Map<String, Affair> affairM = {'dawoApp': affair};

  ///  All the stores, that this corporate owns.
  Map<String, Store> storeM = {'Store-1': store};

  ///  Some Map to simulate activity
  Map<String, String> phaseM = {
    '1': 'Ask',
    '2': 'Join',
    '3': 'Op',
    '4': 'msg',
    '5': 'Ping',
    '6': 'Bind',
    '7': 'comOp',
    '8': 'bye',
  };

  ///  Some Map to simulate activity
  Map<String, String> orderM = {
    'Header': 'Corp orderM',
    'o:Start': 'Corp Start',
    'o:init': 'Initialize bindings',
    'o:join': 'Join other members',
    'o:do': 'Do Stuff',
    ':Done': 'Close doors when leave.',
  };

  ///  V= Value E= Effort D= Done 0-9
  Map<String, String> jobM = {
    'J1': 'V:2 E:6 D:3',
    'J2': 'V:6 E:6 D:3',
    'J3': 'V:2 E:6 D:0',
    'J4': 'V:5 E:6 D:0',
    'J5': 'V:0 E:6 D:0',
    'J6': 'V:2 E:6 D:1',
    'JX': 'V:0 E:0 D:0',
  };

  ///  Testing placardM inside chore.
  ///  Present info for outer process calls.
  ///  Other users are calling process with their own placard.
  Map<String, String> placardM = {
    'actor': 'Corporation',
    'sender': 'Our corp friendly',
    'receiver': 'Customers',
    'command': 'Buy new products:',
    'msg': 'New season coming.',
  };

  ///  devl:CORP Automatic messages to buf, in operations.
  ///  Formulate String for buffer message.
  String bufMsg(String sender, receiver, op, msg) {
    String _s = "s: $sender  r: $receiver oop: $op msg: $msg";
    //  code here
    return _s;
  }

  ///  Change "Automatic messages" to buf messages.
  String paramToStr(var sender, receiver, op, msg) {
    //  Or return List.
    String s = sender.toString();
    String r = receiver.toString();
    String o = op.toString();
    String _rStr = "$s $r $o $msg";
    return _rStr;
  }     //     -----     paramToStr


  ///  for mixin call
  ///  To test mixin op
  void actMxx(String _msg) {
    String mxChainSSample = ':97531mx13579:';
    String mxChainS = ':97531 mx13 579:corporate:';
    String _mS = ' $mxC.mxLOGO  $_msg ';
    mxC.mxLogL.add(' $_mS  :store:calling:mixin: start');
    mxC.mxActMsg(':corporate:mx:Boss:act:msg: CORP  ', '_msg: $_msg');

    //  :BUG:2.0.0    mxBoss.mxActMsg(':corporate:mx:Boss:act:msg: ', '_msg: $_msg');
    //  mx...
    tellCall(':corporate:mx:say:Call:', ':msg: actMxx in corporate');
    //  mxBoss.mxActMsg(_caller, _msg)
    mxC.mxSigL.add(' $_mS   :corporate:calling:mixin:  operation');
    mxC.mxLogL.add(' $_mS   :corporate:calling:mixin: done ');
  }     //     -----     actMxx


  ///  Shaping everybody-to-use functionality for series of commands.
  void roll() {
    //  code here
  }

  ///  Shaping everybody-to-use functionality for messages.
  void handleMsg() {
    //  code here
  }

  ///  caller:  chore-op
  ///  Call:    _retBuf.write(
  ///  corporate.process(':Ch-Op:', chOpClass, placardM, assignComProChore));
  ///  Shaping everybody-to-use functionality for..
  ///  Map explicitly make it <String, String>
  StringBuffer process(String by, Affair _affairOp,
      Map<String, String> placardM, Function _assigned) {
    ///  Parameter:  callers placardM is here now.
    print(':corporate: process begins:');
    String infoS1 =
        '#Caller have accessed #corporate.process, where it will hava access in all public resources, ';
    String infoS2 = 'and it can interact with other users.';
    print(infoS1);
    print(infoS2);
    List<String> _li1 = [];
    StringBuffer _cpBuf = StringBuffer();
    _li1
      ..add('\n -->>-->  corporate.process  #caller: $by cccccccccccp')
      ..add('affairOpsInUse: ___________________________________')
      ..add('  ------  demandStream  -----------')
      ..add('   -----  demandStreamBoard  ----------')
      ..add('   -----  corporate.paramToStr  ---------------   -->')
      ..add('   -----  corporate.bufMsg  ---------------')
      ..add('   -----  corporate.roll  -------------')
      ..add('   -----  corporate.handleMsg  ----------')
      ..add('   -----  corporate.show-------');
    _cpBuf.writeln(
        ':_cpBuf: -->>-->  corporate.process  #caller: $by  -------- \n');
    //  devl:CORP  Start info and statistics.
    //  devl:CORP  Make all these Lists for:  devBox
    //  code here
    List<String> _li2 = [];
    _li2.add('placardMap: ');
    //  placardM.forEach((k,v)  => print('$k, $v'));
    placardM.forEach((k, v) => _li2.add('$k, $v'));
    _li2.add('_______ placardM ___________________________');

    devBox(':bl:comProc:', ['* h:corporate *', '* f:corporate *'], [_li1, _li2], 10);

    List<String> _li3 = [];
    // actual command.
    _li3.add('calling command:');
    //  call to function that was get in parameter by caller.
    //  devl:CORP Make this route more evident in in-call,  and returned Strings.
    String _comStr = _assigned();
    _li3.add(_comStr); //  Returning String, from caller-object.
    _li3.add('  3. part done in :corporate:process. ');

    ///  Mediating placardM to affairOp
    ///  howTo NULL Map =  change parameter to Map<String, String>
    ///  The argument type 'Map<dynamic, dynamic>' can't be assigned to
    ///  the parameter type 'Map<String, String>'
    ///  DONE;  map explicitly: 'Map<String, String>'
    ///  devl:CORP  _affairOp.init(placardM);
    _affairOp.init();

    List<String> _li4 = [];
    _li4.add('calling: _affairOp.showInfo AND  _affairOp.operation::');
    _li4.addAll(_affairOp.showInfo(':corporate:process:'));
    _li4.add('  part 4 done in :corporate:process:  ');

    _affairOp.operation; //  no operation, just show info now.
    _affairOp.showInfo(':corporate:process:');

    devBox(':bl:comProc:', ['* h:corporate *', '* f:corporate *'], [_li3, _li4], 10);

    //  devl:CORP  :corporate:process: end info and statistics.
    _cpBuf.writeln(':_cpBuf:  <--<<--  :corporate:process done --------\n');
    print('  <--<<--  :corporate:process done cccccccccccccccccccccccccp \n');
    return _cpBuf;
  } //     -----     process

  ///  Shaping joint functionality for presentation.
  void show() {
    //  code here
  }

  ///  constructor
  Corporate(this.name, this.motto, this.clause);
} //     -----     class Corporate

///  Creating instance.
Corporate corporate = Corporate('corporate-united', 'CorpMotto', 'Corp.Clause');
