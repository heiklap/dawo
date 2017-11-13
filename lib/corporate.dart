// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

///  previous #common operate from base_lib.dart aso. is here
///  history: 2017.11.13.   development-state: 5%

library corporate;

///  How base_lib manages so far NOT importing base_struct?
//  import 'base_struct.dart';
import 'base_lib.dart';
import 'shower.dart'; //  for devBox

///  Here objects work together after #connector joins them to system.
class Corporate {
  String name = 'corporate-united';

  ///  TODO Automatic messages to buf, in operations.
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
  }

  ///  Shaping everybody-to-use functionality for series of commands.
  void roll() {
    //  code here
  }

  ///  Shaping everybody-to-use functionality for messages.
  void handleMsg() {
    //  code here
  }

  ///  caller:  chore-op
  ///  Shaping everybody-to-use functionality for..
  ///  DONE: previous:  commonProcess
  StringBuffer process(
      String by, GlobalOpClass glOpC, Map placardM, Function _assigned) {
    ///  NOTE  callers placardM is here now.
    print(':debug: :corporate: process begins:');
    String infoS1 =
        '#Caller have accessed #corporate.process, where it will hava access in all common resources, ';
    String infoS2 = 'and it can interact with other users.';
    print(infoS1);
    print(infoS2);
    List<String> _li1 = [];
    StringBuffer _cpBuf = new StringBuffer();
    _li1
      ..add(
          '\n -->>-->  corporate.process  #caller: $by ccccccccccccccccccccccccccp')
      ..add('glbOpsInUse: ___________________________________')
      ..add('  ------  commonStream  -----------')
      ..add('   -----  commonStreamBoard  ----------')
      ..add('   -----  corporate.paramToStr  ---------------   -->')
      ..add('   -----  corporate.bufMsg  ---------------')
      ..add('   -----  corporate.roll  -------------')
      ..add('   -----  corporate.handleMsg  ----------')
      ..add('   -----  corporate.show-------');
    _cpBuf.writeln(
        ':_cpBuf: -->>-->  corporate.process  #caller: $by  -------- \n');
    //  TODO  Start info and statistics.
    //  TODO  Make all these Lists for:  devBox
    //  code here
    List<String> _li2 = [];
    _li2.add('placardMap: ');
    //  placardM.forEach((k,v)  => print('$k, $v'));
    placardM.forEach((k, v) => _li2.add('$k, $v'));
    _li2.add('__________________________________');

    devBox(':bl:comProc:', [_li1, _li2], 10);

    List<String> _li3 = [];
    // actual command.
    _li3.add('calling command:');
    //  call to function that was get in parameter by caller.
    //  TODO Make this route more evident in in call,  and returned Strings.
    String _comStr = _assigned();
    _li3.add(_comStr); //  Returning String, from caller-object.
    _li3.add('  3. part done in :corporate:process. ');

    List<String> _li4 = [];
    _li4.add('calling: glOpC.showInfo AND  glOpC.operation::');
    _li4.addAll(glOpC.showInfo(':corporate:process:'));
    _li4.add('  part 4 done in :corporate:process:  ');

    glOpC.operation; //  no operation, just show info now.

    devBox(':bl:comProc:', [_li3, _li4], 10);

    //  TODO  :corporate:process: end info and statistics.
    _cpBuf.writeln(
        ':_cpBuf:  <--<<--  :corporate:rocess done ------------------\n');
    print(
        '  <--<<--  :corporate:process done cccccccccccccccccccccccccccccccccp \n');
    return _cpBuf;
  }

  ///  Shaping joint functionality for presentation.
  void show() {
    //  code here
  }
}

///  Creating instance.
Corporate corporate = new Corporate();
