// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.
///
///  ##  camp lib with camp class.
/// * dwv: version:   1.1.0.  23.11.23.  -  devState:  30%
/// * GitHub:.
/// * Missions and Chores can use connector-services, from corporate-side
/// * to join to Camp-Scout system, whereas corporate side can also use
/// * camp-scout system to use mis-side equipment and effort.
///  Moving here stuff from mission

part of mis;



///
class Camp extends MisInterfaceBasis with RllMxx, ParcelMxx{
  ///
  String name = '* Camp *';
  ///
  String motto = '* Join all together in camp and scout *';
  ///  Combination of #LANG words in sentence.
  String clause = '* Consolidating Strength with others *';

  /// Language, that camp uses when connecting other objects (in con) .
  Map<String, String> say = {
    'purpose': 'camp: :JOIN :OBJECTS :TOGETHER',
    'lang': ':LANG :HERE :COME :OTHERS :CAMP',
    'area': ':CAMP :CAMP1  :CAMP2',
    'product': 'camp: :CONNET :OFER2T :TIME :CONTACT',
    'sell': 'camp: : TREK :JOURNEY :VOYAGE',
    'buy': 'camp: :MATERIAL :TIME :ENERGY :FOOD',
    'ask': ':CUSTOMERS :COMMUNITY :COMMON',
    'always': 'camp: :camp :friendly :contact',
    'newer': 'camp: :NO :UGLY'
  };

  ///  Instance info used in functions and outer-process calls.
  Map<String, String> placardM = {
    'actor': ':camp:',
    'sender': 'camp instance',
    'receiver': 'Camp:Receiver',
    'command': 'camp:com:',
    'msg': ':camp:msg:',
  };

  ///  for print
  bool _pB = false;

  ///  Create some camp___ methods, #then: find some job for them.
  ///  Renamed to:  campXX
  ///  Function, that OPENS way to use outer resources.
  ///  #camp.. system in 15% devState.  NEXT:
  bool initCamp(int openCount, var openThis) {
    ///  use resource, equ class to get practical usable #things.
    _flowC('-->-m-->  :M:camp:$name  campInit ', _pB);
    _flowC(':camp: opInit-info: Get necessary data for camp-operations. >>',
        _pB);
    _flowC('>>  :camp:Resource :simulation: from app upper level.', _pB);
    equ.active = true; //  Resource class activate.
    //  campOn;
    //  campDone;
    //  campCount;

    bool _initB = false; // _initB used only here.
    //  devl:MIS unfinished #IDEA: code to initialize variables in system. #WTF
    return _initB;
  }     //     -----     initCamp

  /// Method, that OPENS camp things.
  bool open(int openCount, var openThis) {
    _flowC('  -->-m-->  :camp:$name  campOpen  ', _pB);
    _flowC('  :camp:open:-info: Open data-tables & resolve queries.>>', _pB);
    _flowC('  >>  :camp:schedule:  :area:machine:money: res in time.', _pB);
    bool __openB = false; //  mark: __  for private-onlyHere.
    //  code to roll -campOpen-   - operations
    return __openB;
  }     //     -----     open

  ///  Start developing camp roll function
  ///  Eventually campRoll handles all these others: init-open-close-schedule..
  ///  campRoll call, by: mission_test,  dawo_example
  int rollCamp(int rollCount, var courierFunc) {
    _flowC('    -->--->  :M:camp:$name  opRoll    * * * *  * * * * *  ', _pB);
    _flowC('    :camp:Roll:-info: RunInitOpen, &; close & report. >>', _pB);
    _flowC('>>  :camp: INFO : operationsa are outside chore-world.', _pB);
    int __counter = 0;
    _flowC('-->>-->>--  :campR: calling :connector:  -->>-->>--', _pB);

    ///  devl:MIS  C:PING:all: C:BIND:all  re :command:s :bind: :bing:
    ///  Eventually close this connector act inside below loop.
    String connectorMsg =
        ':camp:R: C:PING:all: C:BIND:all :CLIENT :GRANT :N:47345 :VALID 3day';
    //
    connector.join(name, placardM, connectorMsg, name);
    connector.roll();

    //  PLAN: loop inside this function to include #camp and #courier
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
    //
    List<String> courierL = [];
    courierL.addAll(infoBox(courierM, 8, 35, 29));
    courierL.forEach(print);

    ///  #LEARN:  courier function output:
    print(courierFunc()); //  null
    print(courierFunc); //  Closure: () => void
    print(courierFunc.runtimeType); //  () => void
    print('----- :courier: ------------- \n');
    print(':camp:Roll: :courier:func:  :');

    _flowC('    <---<--  :camp:roll:  Counter: $__counter   * * *', _pB);
    return __counter;
  }      //     -----     rollCamp

  ///  for mixin call
  ///  To test mixin op. here are:   RllMxx, ParcelMxx
  void callMxx(String _msg) {
    String mxChainSSample = ':97531mx13579:';
    String mxChainS = ':97531 mx13 579:';
    String _mS = ' $mxC.mxLOGO  $_msg ';
    mxC.mxLogL.add(' $_mS  :camp:calling:mixin: start');

    //  class in mixin-file
    //  mxBoss.mxActMsg(':camp:mx:Boss:act:msg: ', '_msg: $_msg');

    //  msgHandle(':camp:mx:act:Msg: ', 'msg camp callMxx call to: :mx:parcel:mxx: :msgHandle:');
    //  howTo:mixin RollMix :  ra
    rllAct();  //  empty

    //  mxBoss.mxActMsg(_caller, _msg)
    mxC.mxSigL.add(' $_mS   :camp:calling:mixin:  operation');
    mxC.mxLogL.add(' $_mS   :camp:calling:mixin: done ');
  }     //     -----     callMxx

  ///  give report of camp statistics
  void report() {
    _flowC('  --<----<-  :camp:$name  campReport --<----<-', _pB);
    _flowC('  :camp:report :info: Report for to check data lists. >>', _pB);
    _flowC('  >>  :camp:report: ** Not needed when: scheduleBox.**.', _pB);
    List<String> _l = [];
    List<String> _l2 = [];
    _l.addAll(tl.bufToList(out.outTMid));
    for (var x = 0; x < _l.length; x++) {
      ///
      if (_l[x].indexOf(':camp:') > 0) {
        _l2.add(_l[x]);
      }
    }
  }     //     -----     report

  ///  int opClose(int openCount, Function openThis) {}
  ///  devl:MIS  camp  not used
  void close() {
    equ.active = false;
    _flowC('--<----<-  camp:$name  campClose --<----<-', _pB);
    _flowC(':camp:close: -info: End of camp operation. >>', _pB);
    _flowC('>>:camp:close: Statistics ready, save next-round data.', _pB);
  }

  ///  Calling print/print-to-buffer function from beta.
  void _flowC(String msg, bool p) {
    ///  Call flow.fServe with #LOCAL variables:
    flow.fServe(':camp:', out.outTMid, msg, p);
  }

  ///  constructor
  Camp(this.name, this.motto, this.clause);

} //  -----  camp class

///  creating instance
Camp camp = Camp('Camp in Camp', 'Camp Always Ready', 'Consolidating Strength with others');


