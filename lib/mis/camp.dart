// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  camp lib with camp and scout classes.
/// * dawo version:  0.0.6.  13.12.2017  -  devState:  30%
/// * GitHub:.
/// * State:  schema
//Moving here stuff from mission

library camp;

import 'equipment.dart';

import '../tools.dart';
import '../alpha.dart';
import '../beta.dart';

import '../corp/connector.dart';

///  Scout was ready and easy..  Finding some use of this.
class Camp {}

//  var camp = new Camp();

///
class Scout {
  String name = ':cout';
  String motto = 'Join all together in camp and scout';
  String clause; //  Combination of #LANG words in sentence.

  /// This is the language, that missions and other objects talk (in con) .
  Map<String, String> say = {
    'purpose': 'scout:SAMPLE :ThisMissionBLAA blaa blaa',
    'lang': 'scout:SAMPKLE :LANG :HERE :ARE :ALL :WORDS',
    'area': 'scout:SAMPLE :AREA1  :AREA2',
    'product': 'scout:SAMPLE :PROD1 :PROD2',
    'sell': 'scout:SAMPLE :OFFER1 :OFFER2 :OFFER3',
    'buy': 'scout:SAMPLE :MATERIAL :TIME',
    'ask': 'scout:SAMPLE :ASK1 :ASK2 :ASK3',
    'always': 'scout:SAMPLE :alwaysX :alwaysY :alwaysZ :SAMPLE',
    'newer': 'scout:SAMPLE :NO :UGLY'
  };

  ///  Instance info used in functions and outer-process calls.
  Map<String, String> placardM = {
    'actor': ':scout:',
    'sender': 'scout instance',
    'receiver': 'Scout:Receiver',
    'command': 'scout:com:',
    'msg': ':scout:msg:',
  };

  bool _pB = false; //  for print

  /// Create some scout___ methods, #then: find some job for them.
  /// Renamed to:  scoutXX
  /// devNote:  function, that OPENS way to use outer resources.
  /// #scout.. system in 15% devState.  NEXT:
  bool init(int openCount, var openThis) {
    ///  use resource, equ class to get practical usable #things.
    _flowC('-->-m-->  :M:scout:$name  scoutInit ', _pB);
    _flowC(':scout: opInit-info: Get necessary data for scout-operations. >>',
        _pB);
    _flowC('>>  :scout:Resource :simulation: from app upper level.', _pB);
    equ.active = true; //  Resource class activate.
    //  scoutOn;
    //  scoutDone;
    //  scoutCount;

    bool _initB = false; // _initB used only here.
    //  //TODO unfinished #IDEA: code to initialize variables in system. #WTF
    return _initB;
  }

  /// devNote:  method, that OPENS scout things.
  bool open(int openCount, var openThis) {
    _flowC('  -->-m-->  :scout:$name  scoutOpen  ', _pB);
    _flowC('  :scout:open:-info: Open data-tables & resolve queries.>>', _pB);
    _flowC('  >>  :scout:schedule:  :area:machine:money: res in time.', _pB);
    bool __openB = false; //  mark: __  for private-onlyHere.
    //  code to roll -scoutOpen-   - operations
    return __openB;
  }

  ///  Start developing scout roll function
  ///  Eventually scoutRoll handles all these others: init-open-close-schedule..
  ///  scoutRoll call, by: mission_test,  dawo_example
  int roll(int rollCount, var courierFunc) {
    _flowC('    -->--->  :M:scout:$name  opRoll    * * * *  * * * * *  ', _pB);
    _flowC('    :scout:Roll:-info: RunInitOpen, &; close & report. >>', _pB);
    _flowC('>>  :scout: INFO : operationsa are outside chore-world.', _pB);
    int __counter = 0;
    _flowC('-->>-->>--  :scoutR: calling :connector:  -->>-->>--', _pB);

    ///  TODO  C:PING:all: C:BIND:all  re :command:s :bind: :bing:
    ///  Eventually close this connector act inside below loop.
    String connectorMsg =
        ':scout:R: C:PING:all: C:BIND:all :CLIENT :GRANT :N:47345 :VALID 3day';
    //
    connector.scoutJoin(placardM, connectorMsg, name);
    connector.roll();

    //  PLAN: loop inside this function to include #scout and #courier
    for (var i = 0; i < rollCount; i++) {
      __counter++;

      ///  Code: Check feedback from environment; something changed?
      ///  #courier brings something from outside world.
      courierFunc();
    }
    print('-1:run  2:print-cf---3: print:courier:Func.runtimeType- ------');

    ///  #LEARN:  courier function output:
    print(courierFunc()); //  null
    print(courierFunc); //  Closure: () => void
    print(courierFunc.runtimeType); //  () => void
    print('----- :courier: ------------- \n');
    print(':scout:Roll: :courier:func:  :');

    _flowC('    <---<--  :scout:roll:  Counter: $__counter   * * *', _pB);
    return __counter;
  } //  -----  scoutRoll

  ///  give report of scout statistics
  void report() {
    _flowC('  --<----<-  :scout:$name  scoutReport --<----<-', _pB);
    _flowC('  :scout:report :info: Report for to check data lists. >>', _pB);
    _flowC('  >>  :scout:report: ** Not needed when: scheduleBox.**.', _pB);
    List<String> _l = [];
    List<String> _l2 = [];
    _l.addAll(tl.bufToList(out.outTMid));
    for (var x = 0; x < _l.length; x++) {
      ///
      if (_l[x].indexOf(':scout:') > 0) {
        _l2.add(_l[x]);
      }
    }
  }

  ///  Calling print/print-to-buffer function from beta.
  void _flowC(String msg, bool p) {
    ///  Call #common flowServe with #LOCAL variables:
    flowServe(':scout:', out.outTMid, msg, p);
  }
} //  -----  scout class

var scout = new Scout();
