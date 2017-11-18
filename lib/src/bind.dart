// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  bind   bindings between objects.
///
///  dawo version: 0.0.5  6.11.2017.   READY-STATE  for version 0.0.6  0%
/// *      GitHub:
/// * Hist:hkl  18.11.2017  Moved stuff from connector.
//

library bind.dart;

import 'package:dawo/beta.dart';

///  Class Bind keeps and handles message-based bindings between objects.
class Bind {
  int bindC = 0; //  counter for connections.
  bool _pB = true; //  print control.
  String emblem = ':bind:'; //  header for messages.
  StringBuffer buf = new StringBuffer();

  List<String> bindL = ['*  :bind: bind-list  *'];

  ///  Share / answer type of bind-actions.
  Map<String, String> bindTypes = {
    'all': ':bind:all:',
    'first': 'First accountant',
    'name': 'Member _____',
    'unknown': 'Unknown ____',
  };

  ///  Members, that are participating in this Bind.
  ///  Member is also a class in alpha.
  ///  #PLAN:  eventually this will be Object Member. Or reference to Chore.
  //  Map<String, Member> bindMembM = {};  Not object yet.
  //  Usage: Only here
  Map<String, String> bindMembM = {
    'bMemb-1': 'First member in bind',
    'bMemb-2': 'Second member in bind:',
  };

  ///  Eventually this will be object - object
  //  Map<String, Map<dynamic, dynamic>> bindingM = {};
  ///  Structure and usage of this map is not yet clear.Data is like:
  ///  Dawo example D-ex-loops
  //   Rumba instance All sub
  ///  Usage: shower: show,
  Map<String, Map<String, String>> bindingM = {
    'all': {'Try': ':bind:1', 'Test': ':bind:2'},
    'first': {'Play': ':bind:7'},
    'name': {'N:x': ':bind:nX'},
    'unknown': {}
  };

  ///  Give variables their start values.
  void init() {
    buf.write('* * *    $emblem  Class bind is ready. * * *  ');
  }

  //  Connect Members action to one or many other Members action.
  //  eventually this will be: var / dynamic / command...
  //String bind(var senderProcess, var receiverProcess, var thing, String msg)
  ///  Usage:  opJoin is calling this
  //String bind(String sProcess, String rProcess, String thing, String msg) {
  String mark(String actorS, senderS, receiverS, comS, msgS, _inMsg) {
    _flowC(':bind:-mark-  -->>-->>--  :bind:  C::Chr:  -->>-->>--', true);
    //  Idea: Have some binding-models and types.
    /// Make new bind name,
    /// NOTE opJoin parameters inMsg  and  caller are available here
    bindC++;
    String bindCS = bindC.toString();
    String bindNameS = '$actorS$bindCS';

    /// TODO  :bind: _inMsg string to binding system
    /// GET:   C:PING:all: C:BIND:all  from inMsg to catch :first:all:name:
    bindL.add('   $_inMsg');
    //  Map<String, Member>
    //  TODO  should both bind and connector have memberM ?
    bindMembM.putIfAbsent(bindNameS, () => comS);

    bindingM['all'].putIfAbsent(senderS, () => receiverS);
    // Map<String, Map<String, String>>

    print(rowReport());
    //  or:   report();
    return 'binding: #one to: #second';
  }

  ///  Get what user wants from bind-data.
  String find() {
    String _fs = '';

    return _fs;
  }

  ///  Boxed report.. coming later
  List<String> report(String caller) {
    List<String> l = [];
    /*
    //  parameters / var are in bind.mark.
    print(':bind:  bindingM putIfAbsent:: bNS: $bindNameS comS: $comS');
    print(':bind:-mark-  inMsg:  $_inMsg');
    print(' bindingM putIfAbsent:: S: $senderS  R: $receiverS');
    */
    print('--------- :bind:report C: $caller --------------------------');
    print(bindMembM);
    print(bindingM);
    print('---------------------------- all: --------------');
    //  bindingM['all'].forEach((k, v) => print('$k $v'));
    print(bindingM['all']);
    print('---------------------------- first: --------------');
    //  bindingM['first'].forEach((k, v) => print('$k $v'));
    print(bindingM['first']);
    print('---------------------------- name: --------------------');
    //  bindingM['name'].forEach((k, v) => print('$k $v'));
    print(bindingM['name']);
    print('--------------------------- unknown: --------------------');
    //  bindingM['unknown'].forEach((k, v) => print('$k $v'));
    print(bindingM['unknown']);
    print('------------------------------------------------------');
    return l;
  }

  ///  Nice one-row report.
  String rowReport() {
    String cS = bindC.toString();
    String mS = bindingM.toString();
    String _s = ':bind:rr- C:$cS  $mS';
    return _s;
  }

  void _flowC(String msg, bool prnB) {
    ///  Call flowServe with #LOCAL variables.
    //  TODO  Why not find beta flowServe() ??
    //  flowServe(':con:flC:$prnB ', buf, msg, prnB);
    flowServe(':bind:flC: ', buf, msg, true); //  $prnB : when needed.
  }
} //  -----  class Bind

Bind bind = new Bind();
