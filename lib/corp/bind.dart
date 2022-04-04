// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  bind   #LANG and #CLAUSE based bindings between objects.
/// * Bind object to certain state or project or resource.
/// * Bind to certain event-waiting or information flow.
/// *  Using #resolve library with #dawolang to solve bind-literal-Strings.
/// *  dwv: version:   0.6.0  26.3.2022
/// *  GitHub:  https://github.com/heiklap/dawo/blob/master/lib/corp/bind.dart
/// *  devState: 8%  PLAN: yes   SCHEDULE:  NO.
//

//  library bind;
part of corp;

//  import '../beta.dart';
//  import 'resolve.dart';

///  Class Bind keeps and handles message-based bindings between objects.
class Bind extends CorpInterfaceBasis {
  //  counter for connections.
  int bindC = 0;
  //  print control.
  bool _pB = true;
  //  header for messages.
  String emblem = ':bind:';
  StringBuffer buf = StringBuffer();

  ///  Map of #LANG and #CLAUSE based String-bindings between objects.
  Map<String, String> bindM = {
    'Bind_1': '*  :bind: bind-Map  *',
  };

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
  ///  Map<String, Member> bindMembM = {};  Not object yet.
  ///  This might be <BaseStruct>  for Chore to be able to join
  ///  Usage: Only here
  Map<String, String> bindMembM = {
    'bMemb-1': 'First member in bind',
    'bMemb-2': 'Second member in bind:',
  };

  ///  Eventually this will be object - object
  ///  Map<String, Map<dynamic, dynamic>> bindingM = {};
  ///  Structure and usage of this map is not yet clear.Data is like:
  ///  Dawo example D-ex-loops
  ///   Rumba instance All sub
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

  ///  Connect Members action to one or many other Members action.
  ///  eventually this will be: var / dynamic / command...
  ///  String bind(var senderProcess, var receiverProcess, var thing, String msg)
  ///  Usage:  opJoin is calling this
  ///  String bind(String sProcess, String rProcess, String thing, String msg) {
  String mark(String actorS, senderS, receiverS, comS, msgS, _inMsg) {
    _flowC(':bind:-mark-  -->>-->>--  :bind:  C::Chr:  -->>-->>--', true);
    //  Idea: Have some binding-models and types.
    /// Make new bind name,
    /// Parameters   opJoin parameters inMsg  and  caller are available here
    bindC++;
    String bindCS = bindC.toString();
    String bindNameS = '$actorS$bindCS';

    /// devl:CORP  :bind: _inMsg string to binding system
    /// GET:   C:PING:all: C:BIND:all  from inMsg to catch :first:all:name:
    /// devl:CORP  Just a throw:  actorS, _inMsg
    bindM.putIfAbsent(actorS, _inMsg);
    //  Map<String, Member>
    //  devl:CORP  should both bind and connector have memberM ?
    bindMembM.putIfAbsent(bindNameS, () => comS);

    ///
    bindingM['all']?.putIfAbsent(senderS, () => receiverS);
    // Map<String, Map<String, String>>

    print(rowReport());
    //  or:   report();
    return 'binding: #one to: #second';
  }

  ///  Get what user wants from bind-data.
  String find() {
    String _fs = '';

    ///  Using Resolve library:
    //  res.solve(sender, key, source);

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
    print('---------- :bind:report C: $caller   done  -----------------');
    return l;
  }

  ///  Nice one-row report.
  String rowReport() {
    String cS = bindC.toString();
    String mS = bindingM.toString();
    String _s = ':bind:rr- C:$cS  $mS';
    return _s;
  }

  ///  Normal conditional buffer/print-call to wake flow.fServe.
  void _flowC(String msg, bool prnB) {
    ///  Call flow.fServe with #LOCAL variables.
    //  devl:CORP  Why not find beta flow.fServe() ??
    //  flow.fServe(':con:flC:$prnB ', buf, msg, prnB);
    buf.writeln('Print bool value _pB::  $_pB ');
    flow.fServe(':bind:flC: ', buf, msg, true); //  $prnB : when needed.
  }
} //  -----  class Bind

Bind bind = Bind();
