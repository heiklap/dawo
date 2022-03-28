// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  scout lib with scout class.
/// * dawo version:   0.7.0.  27.3.2022.  -  devState:  30%
/// * GitHub:.
/// * Missions and Chores can use connector-services, from corporate-side
/// * to join to Camp-Scout system, whereas corporate side can also use
/// * camp-scout system to use mis-side equipment and effort.
///  Moving here stuff from mission

part of mis;



///  Scout was ready and easy.. so adopted it for connector.scoutJoin
///  Finding later some connect class Camp.
///  Separated Scout class to own library
class Scout {
  ///
  String name = '* Scout *';
  ///
  String motto = '* Join all together in camp and scout *';
  ///
  String clause = '* Consolidating Strength with others *'; //  Combination of #LANG words in sentence.

  /// Language, that scout uses when connecting other objects (in con) .
  Map<String, String> say = {
    'purpose': 'scout: :JOIN :OBJECTS :TOGETHER',
    'lang': ':LANG :HERE :COME :OTHERS :SCOUT',
    'area': ':SCOUT :SCOUT1  :SCOUT2',
    'product': 'scout: :CONNET :OFER2T :TIME :CONTACT',
    'sell': 'scout: : TREK :JOURNEY :VOYAGE',
    'buy': 'scout: :MATERIAL :TIME :ENERGY :FOOD',
    'ask': ':CUSTOMERS :COMMUNITY :COMMON',
    'always': 'scout: :camp :friendly :contact',
    'newer': 'scout: :NO :UGLY'
  };

  ///  Instance info used in functions and outer-process calls.
  Map<String, String> placardM = {
    'actor': ':scout:',
    'sender': 'scout instance',
    'receiver': 'Scout:Receiver',
    'command': 'scout:com:',
    'msg': ':scout:msg:',
  };

  ///  for print
  bool _pB = false;

  ///  Create some scout___ methods, #then: find some job for them.
  ///  Renamed to:  scoutXX
  ///  devNote:  function, that OPENS way to use outer resources.
  ///  #scout.. system in 15% devState.  NEXT:
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
  }     //     -----     init

  /// devNote:  method, that OPENS scout things.
  bool open(int openCount, var openThis) {
    _flowC('  -->-m-->  :scout:$name  scoutOpen  ', _pB);
    _flowC('  :scout:open:-info: Open data-tables & resolve queries.>>', _pB);
    _flowC('  >>  :scout:schedule:  :area:machine:money: res in time.', _pB);
    bool __openB = false; //  mark: __  for private-onlyHere.
    //  code to roll -scoutOpen-   - operations
    return __openB;
  }     //     -----     open

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
    connector.join(name, placardM, connectorMsg, name);
    connector.roll();

    //  PLAN: loop inside this function to include #scout and #courier
    for (var i = 0; i < rollCount; i++) {
      __counter++;

      ///  Code: Check feedback from environment; something changed?
      ///  #courier brings something from outside world.
      courierFunc();
    }
    print('-1:run  2:print-cf---3: print:courier:Func.runtimeType- ------');
    Map<String, String> courierM = {
      '1-2 ': '-1:run  2:print-cf--',
      '3:  ': '- print:courier:Func.runtimeType-',
    };
    //  hklTry:
    //  List<String> courierL = boxServe.infoBox(courierM, 8, 35, 29);
    List<String> courierL = [];
    courierL.addAll(boxServe.infoBox(courierM, 8, 35, 29));
    courierL.forEach(print);

    ///  #LEARN:  courier function output:
    print(courierFunc()); //  null
    print(courierFunc); //  Closure: () => void
    print(courierFunc.runtimeType); //  () => void
    print('----- :courier: ------------- \n');
    print(':scout:Roll: :courier:func:  :');

    _flowC('    <---<--  :scout:roll:  Counter: $__counter   * * *', _pB);
    return __counter;
  }      //     -----     scoutRoll

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
  }     //     -----     report

  ///  int opClose(int openCount, Function openThis) {}
  ///  TODO  scout  not used
  void close() {
    equ.active = false;
    _flowC('--<----<-  scout:$name  scoutClose --<----<-', _pB);
    _flowC(':scout:close: -info: End of scout operation. >>', _pB);
    _flowC('>>:scout:close: Statistics ready, save next-round data.', _pB);
  }

  ///  Calling print/print-to-buffer function from beta.
  void _flowC(String msg, bool p) {
    ///  Call flowServe with #LOCAL variables:
    flowServe(':scout:', out.outTMid, msg, p);
  }

  ///  constructor
  Scout(this.name, this.motto, this.clause);

} //  -----  scout class

///  creating instance
Scout scout = Scout('Scout in Scout', 'Scout Always Ready', 'Consolidating Strength with others');


