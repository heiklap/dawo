// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *  missions: primary Dawo workPlatforms, they have chores that do the job.
/// *  dawoApp builds all the missions and their chores.
/// *  Primary functionality: engage chores.
/// *  Version 0.0.6 :  27.11.2017  -  ready_state for 0.0.7  :  0 %
/// *  devState : unknown  -  PLAN:  cleaning
// -  HIST:  hkl  8.9.2017
// -  devNote: 4 pc.
//
//  word:  build  38 / 26  pc. Is it too much.
//  chore:  20 pc

///  Renamed library to: missions for 0.0.4.
library missions;

//  import '../dawo_app.dart';  //  not used
import '../alpha.dart';
import '../beta.dart';

import 'chore.dart';
import 'equipment.dart';

import '../dev/dawo_dev.dart';
import '../tools.dart';

import '../corp/connector.dart';
import '../clay/clay_roll.dart';

///  #NOTE:  #effort is not visible here.  Only in chore.dart.

///  Buffer also outside class, for testing and adding visibility.
//  StringBuffer  missionBuf = new StringBuffer();  //  Not used

bool _pB = false; //  true for chore_test.dart;

///  Generic list to keep all missions.
///  In case for handling other, super- or sub-missions; code something more.
///  buildMissions() fills this list. It is outside of the Class.
List<Mission> missionL = [];

/// NOTE:  Chore-list is inside this class.  Most outside activity to Chore, is
/// accessed via Mission-class.

///  To publish name in scope for testing visibility.
void helloMission() {
  _flowC('-- Somebody call: hello this is mission file and library  ---', _pB);
}

///  TODO  Use some private methods, for not to spam scope.
///  Mission avoids consciously using clear and handy structure of Chore class,
///  for to leave space for innovation and to find different solutions for ops.
///  Mission handles acts below -app level, but above chore.
///  Mission can include many chores. 7 Chores are build by default.
///  TODO  Mission has 40 public fields !!
class Mission {
// #TIP: When class properties begins with certain letter combination, like-bl..
// you avoid mess, that occurs, when class is used in mixin's.

  String name;
  String motto;
  String clause; //  Combination of #LANG words in sentence.

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  //  Not yet  String seal = ':M-seal:'; //  like:  ":DAWO-APP:";
  String _emblem = 'M-emblem'; //  like:  ":DAWO-APP:";
  String _indent; // like:  "      ";  3-5-7 empty marks or something visible.

  ///  Reference to outPut-buffer don't give much: used only in _flowC(
  StringBuffer _buf = out.outTMid; //  reference to used output StringBuffer.
  //  error: The type of buf can not be inferred, because the use of the
  //  TODO  instance-getter outTMid.

  List<CommonChore> choreL = [];

  ///  Create default CommonChores for every Mission.
  ///  We have plenty of these, so let's add them!
  CommonChore learnChr = new CommonChore('LearnChr', 'Yes, I learn');
  CommonChore joyChr = new CommonChore('JoyChr', 'Yes, I am happy');
  CommonChore actChr = new CommonChore('ActChr', 'Yes, I act');
  CommonChore peopleChr = new CommonChore('PeopleChr', 'Get social!');
  CommonChore placeChr = new CommonChore('PlaceChr', 'Places I will remember');
  CommonChore seasonChr = new CommonChore('SeasonChr', 'Seasons differ!');
  CommonChore showChr = new CommonChore('ShowChr', 'Yes, I show');

  /// Changed clayMap to be more complicated:
  Map<String, Map<String, String>> clayMap = {};

  /// #innoTeam Some maps to give platform for ideas to future development.
  Map<String, String> info = {
    'name': 'My App',
    'info': 'dartlang application',
    'creator': 'me',
    'instruct': 'Git clone and develop',
    'active': 'yes',
    'stopped': 'no',
    'paused': 'no',
    'userWork': 'yes',
    'autoWork': 'no'
  };

  ///  Create some variables and figure their usage later.
  /// #Idea?  Control missions state, working-condition / state.
  String _state = 'Functional';
  //  State Map, Missions upper level state.
  Map<String, bool> st = {
    'off': true,
    'on': false,
    'con': false,
    'pause': false,
    'done': false,
  };

  //----op-  variables and methods to handle Mission operations
  ///  'open'  variables. Make this a Map. ?
  //  Sub-operations state
  Map<String, bool> _opSt = {
    'off': true,
    'on': false,
    'pause': false,
    'done': false,
  };
  int opCount = 0;

  ///  #Idea:  use flags maps to control something     stFlags
  Map<String, String> _stFlags = {
    'real': 'no',
    'accepted': 'no',
    'aborted': 'me',
    'started': 'no',
    'active': 'no',
    'paused': 'no',
    'stopped': 'yes',
    'userWork': 'yes',
    'autoWork': 'no'
  };

  /// #Idea? -roll  and  -op : are different level of operations.
  ///  -roll-  variables.
  bool _rollDone = false;
  int _rollCount = 0;

  /// #Idea?  chore map to give names to  W O R K  -states.
  /// #Name: Do not want to use "work". Instead: #job.
  Map<int, String> _rollSchedule = {
    1: 'Speed!',
    2: 'Hurry',
    3: 'Schedule',
    4: 'Normal',
    5: 'Delayed'
  };

  ///  Add #later map to constructor:
  ///  Mission(this.name, this.motto, Map<String,String> _clayM);
  Mission(this.name, this.motto);

  ///  Usage: No
  ///  Mission loop for all it's Chores. Rumba calls this.
  void missionRollChores(String caller) {
    //  Start loop, use choreL to choose one at a time.
    //  Run chore's code against it's master-mission.
    //  Handle user-actions until: exit.
  }

  //TODO  teamDev *chore*, if is toChore.. should there be outChore, lonChore ?
  ///  beta's connection to chore (package) (?)
  ///  *chore* is separate library, which controls *job* :s
  ///  Mediating calls to outside executor process. (?)
  ///  Name: choreBus ?  choreRoute ?
  ///  Usage: no
  void toChore(CommonChore _chore) {
    String motto = 'mediating process to chore..';
    assert(motto.substring(10, 17) == 'process');
    //  code..
  }

  ///  Present info for outer process calls.
  Map<String, String> placardM = {
    'actor': 'Mission',
    'sender': 'Mission instance',
    'receiver': '',
    'command': ':M:com:',
    'msg': 'Mis-msg:',
  };

  ///  Initializing Mission instances fields. Changed to private.
  void _init(String caller) {
    _flowC('-->>-->>-- :M:init:   C: $caller     -->>-->>--    ', _pB);
    placardM['actor'] = name;
    placardM['sender'] = name.substring(0, 8);
    //  TODO  placardM['command'] =
    //  TODO  placardM['sender'] =
  }

  ///  Building mission with it's chores.
  void build(String caller) {
    ///  Create default Chore's for everyMission: done in Class!
    ///  build default Chores:
    //
    _flowC('-->-m-->         :M:-b:         $name   -->-m-->  ', _pB);
    _flowC('-->-m-->    construct default Chores. For: $name -->-m-->  ', _pB);
    _flowC(':M:build: => :chore.onB:: ', _pB);

    ///  Should use instance, that is created inside THIS mission instance.
    learnChr.build(_emblem, name); //  new parameter in Chore.build
    joyChr.build(_emblem, name); //  emblem and master parameters to Chore.
    actChr.build(_emblem, name);
    peopleChr.build(_emblem, name);
    placeChr.build(_emblem, name);
    seasonChr.build(_emblem, name);
    showChr.build(_emblem, name);
    _flowC('-->>-->>--  :M:build: calling :connector:  -->>-->>--', _pB);
    String _nS = name.substring(0, 7);
    String connectorMsg = ':INFO :ALL M: $_nS : are :READY :FOR :NEXT :EVENT ';
    connector.scoutJoin(placardM, connectorMsg, ':M:-build:');
    connector.roll();

    ///  add default chores to choreL and #TODO  forEach.build
    //  Short way:   choreL.forEach(build);
    _flowC('-->-m-->    choreL add-all:  $name       ', _pB);
    choreL.addAll(
        [learnChr, joyChr, actChr, peopleChr, placeChr, seasonChr, showChr]);
    //  CODE
    _flowC('   <-m--<--       :M:-b:        done  $name     ', _pB);
  } //  -----  build

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in beta, chore and mission   * * *
  ///  :TEST:  change some variables to private.
  Action _decision;
  Map<String, Map<String, Action>> _decisionChainMM;

  ///  ***********************************************************************
  ///  #Word 's for stream-like processes. What 3 words to use?
  ///  chain, procession, queue, order, request, stream, river, flow, rune
  ///  19.10.2017  adapt this structure everywhere, until find better.
  void orderStream() {} //  is not async, just normal wait-a-little-in-queue.
  void chainStream() {} //  real stream, slow answer.
  void fireStream() {} //
  ///  ***********************************************************************

  /// Create some scout___ methods, #then: find some job for them.
  /// Renamed to:  scoutXX
  /// devNote:  function, that OPENS way to use outer resources.
  /// #scout.. system in 15% devState.  NEXT:
  bool scoutInit(int openCount, var openThis) {
    ///  use resource, equ class
    _flowC('-->-m-->  :M:scout:$name  scoutInit ', _pB);
    _flowC(':M:scout: opInit-info: Get necessary data for scut-operations. >>',
        _pB);
    _flowC(
        '>>  :M:scout:Resource object-simulations from app upper level.', _pB);
    equ.active = true; //  Resource class activate.
    //  scoutOn;
    //  scoutDone;
    //  scoutCount;

    bool _initB = false;
    //  code to initialize variables in system
    return _initB;
  }

  /// devNote:  method, that OPENS scout thins.
  bool scoutOpen(int openCount, var openThis) {
    _flowC('  -->-m-->  :M:scout:$name  scoutOpen  ', _pB);
    _flowC(
        '  :M:scout: scoutOpen-info: Open data-tables and resolve queries.>>',
        _pB);
    _flowC(
        '  >>  :M:scout: Schedule area-machine-money resources in time.', _pB);
    bool _openB = false;
    //  code to roll -scoutOpen-   - operations
    return _openB;
  }

  ///  Start developing scout roll function
  ///  Eventually scoutRoll handles all these others: init-open-close-schedule..
  ///  scoutRoll call, by: mission_test,  dawo_example
  int scoutRoll(int rollCount, var courierFunc) {
    _flowC(
        '    -->-m-->  :M:scout:$name  opRoll    * * * * * * * * * * * * *  ',
        _pB);
    _flowC('    :M:scout: scoutRoll-info: Run init-open, &; close & report. >>',
        _pB);
    _flowC(
        '>>  :M:scout: INFO: scout-operationsa are outside chore-world.', _pB);
    int done = 0;
    _flowC('-->>-->>--  :M:scoutR: calling :connector:  -->>-->>--', _pB);

    ///  TODO  C:PING:all: C:BIND:all  re :command:s :bind: :bing:
    String connectorMsg =
        ':M:-scoutR: C:PING:all: C:BIND:all :CLIENT :GRANT :N:47345 :VALID 3day';
    //  instead: :M:-scoutR:  change 3. parameter to: name
    connector.scoutJoin(placardM, connectorMsg, name);
    connector.roll();

    //  now this just rolls func rollCount time,  lol
    for (var i = 0; i < rollCount; i++) {
      done++;
      courierFunc();
    }
    print('-1:run  2:print-cf---3: print:courier:Func.runtimeType- ------');
    print(courierFunc()); //  null
    print(courierFunc); //  Closure: () => void
    print(courierFunc.runtimeType); //  () => void
    print('-----courier------------- \n');
    print(':M:scoutRoll: :courier:func:  :');

    _flowC('    <-m--<--  :M:scout:  scoutRoll   done c: $done   * * * * * * *',
        _pB);
    return done;
  }  //  -----  scoutRoll

  /// devNote:  method, that CLOSES it's object.
  /// idea?
  //  int opClose(int openCount, Function openThis) {
  void opClose() {
    equ.active = false;
    _flowC('--<----<-  :M:scout:$name  scoutClose --<----<-', _pB);
    _flowC(
        ':M:scout: scoutClose-info: End lof mission-scout operation. >>', _pB);
    _flowC(
        '>>:M:scout:close: * Statistics ready, save next-round data. *.', _pB);
  }

  ///  give report of scout statistics
  void scoutReport() {
    _flowC('  --<----<-  :M:scout:$name  scoutReport --<----<-', _pB);
    _flowC('  :M:scout: scoutReport-info: Report for to check data lists. >>',
        _pB);
    _flowC(
        '  >>  :M:scout: scoutReport: ** Not needed when scheduleBox.**.', _pB);
    List<String> _l = [];
    List<String> _l2 = [];
    _l.addAll(tl.bufToList(out.outTMid));
    for (var x = 0; x < _l.length; x++) {
      ///  Add all ':M:scout:' to _l2.
      if (_l[x].indexOf(':M:scout:') > 0) {
        _l2.add(_l[x]);
      }
    }
    /*
    ///  Test report output
    print('-->-->  ********* :M: op-Report ******************************* ');
    print('OpOn   $opOn   opDone:  $opDone   ');
    print('opCount:   $opCount   ');
    String _lS = _l.length.toString();
    String _l2S = _l2.length.toString();
    print('---- Both lists lengths:  -----------------');
    print('L1:  $_lS');
    print('L2:  $_l2S');
    print('---- _l:  -----------------');
    _l.forEach(print);
    print('---- _l2:  -----------------');
    _l2.forEach(print);
    print(' ');
    print('    <--<--  ********** :M: op-Report ************************** ');
    */
  }

  //  -------------------------    show  aso. methods   --------------------
  ///  Present all info of this class / app.
  ///  #Tip: String can be in many lines with '''.
  void showInfo() {
    print('''idea:   some basic / flow  functionality, that is too small 
        for packages and too big for tools.dart''');
  }

  ///  For report: To get Chore class names in String.
  String getChoreNamesS() {
    StringBuffer nBuf = new StringBuffer();
    for (var x = 0; x < choreL.length; x++) {
      nBuf.write(choreL[x].name);
      nBuf.write(' ');
    }
    return nBuf.toString();
  }

  ///  TODO  quick list.. is it gonna work??
  ///  Report of mission data.
  ///  DONE  Make mission-report return list, for box-output.
  List report(String caller, bool detailsB) {
    //  NOTE  If more than 9 Chores, need something else.
    String choreLengthS = choreL.length.toString();
    String choreS = getChoreNamesS();
    String opS = _opSt.toString();
    String stS = st.toString();
    String ps1 = ('**.               caller: $caller                       .');
    String ps2 = ('**  MissionName:  $name         Motto: $motto');
    String ps3 = ('**  State: off    on     con     pause    done   ');
    String ps4 = ('**  stDo: $stS ');
    String ps5 = ('**  rollDone:   $_rollDone     rollCount:  $_rollCount');
    String ps6 = ('**  operations:  off   on   pause   done  ');
    String ps7 = ('** $opS  opCount:  $opCount');
    String ps8 = ('**  Chores:   $choreLengthS');
    String ps9 = ('**  $choreS');
    String ps10 = ('** ______________________________________________________');
    var _l = [ps1, ps2, ps3, ps4, ps5, ps6, ps7, ps8, ps9, ps10];
    //  _l.forEach(print);
    ///  glorious coding. Once again;  choreL and default chores
    if (detailsB) {
      print('\n *** :M: report details : choreL : For mission: $name ***');
      choreL.forEach((x) => print(x.rowInfo()));

      print('\n *** :M: report details clayMap chores For mission: $name ***');
      //  clayMap.forEach((k, v) => print('$k, $v'));
      tl.printStringMapMap(clayMap);
      print('************************ :M: report details done   ******** \n ');
    }
    return _l;
  } //  ----------  report

//  TODO  teamNext   coming?:   returning some finnish day names aso.
  /// Should include some international values from other languages.

//  Coming.
//  TODO  teamNext    coming:    Elementary Isolate example
//  TODO  teamNext    Simple future  sample
//  TODO  teamNext    Elementary Mixin   sample

} // --  end class Mission

///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right;
///  Every library / actor has its own flowC function.
void _flowC(String msg, bool p) {
  ///  Call #common flowServe with #LOCAL variables:
  ///  :MISSION: is too long.
  flowServe(':M:', out.outTMid, msg, p);
}

///  Create Mission class instances.
var packDawoMission = new Mission('packDawo mission', 'Build Dawo package');
var helsinkiMission = new Mission('Helsinki-mission', 'Presenting Helsinki');
var dartlangMission = new Mission('Dartlang mission', 'Learn dartlang');

var myMusicMission =
    new Mission('My-Music mission', 'Play and share good music');
var myTimeMission = new Mission(
    'MyTime mission', 'Spend at least one hour in a week with reasonable way');
var nationalParksMission = new Mission(
    'Finlands national park mission', 'Present beautiful finish nature');

///  Show missions and their chores.
void missionChoreReport(String caller) {
  print('-->>-->>----:M:  missionChoreReport  caller: $caller');
  for (var x in missionL) {
    print(x.name);
    print(x.choreL);
  }
  print('--<<--<<----  missionChoreReport done caller: $caller');
}

///  Add clay ( data ) maps to missions.
///  TODO  Messy function buildMissions.  Clean, organize it.
void buildMissions(String caller) {
  _flowC('-->-m--> build Missions, caller: $caller   ', _pB);
  dev.admN.add('>>ADM:CHECK-IN  build-Missions  >>');

  ///  Start of new dawoMission.
  ///  packDawo Mission.
  packDawoMission.clayMap.addAll(getClayMap('packDawo'));
  out.outMTop.writeln('out.outMTop-buildMission: packDawo');

  dartlangMission.clayMap.addAll(getClayMap('learnDartlang'));
  out.outMid.writeln('out.outMid-buildMissions : dartlang');

  helsinkiMission.clayMap.addAll(getClayMap('helsinkiGuide'));
  out.outMBot.writeln('out.outMBot-buildMissions : helsinki');

  myMusicMission.clayMap.addAll(getClayMap('myMusic'));
  out.outBl.writeln('out.outBl-buildMission : myMusic');

  myTimeMission.clayMap.addAll(getClayMap('myTime'));
  out.outBr.writeln('out.outBr-buildMission : myTime');

  nationalParksMission.clayMap.addAll(getClayMap('nationalParks'));
  out.outFooter.writeln('out.outFooter-buildMission : nationalParks');

  ///  Add Mission-objects to upper-level missionL List.
  missionL.addAll([
    packDawoMission,
    helsinkiMission,
    dartlangMission,
    myMusicMission,
    myTimeMission,
    nationalParksMission
  ]);

  /// .build adds default Chore's to missions
  _flowC('-->-m-->    missionL forEach print-choreL   -->-m-->  ', _pB);
//  hklTry   missionL.forEach((x) => x.build);
  //  missionL.forEach(print);  //  =>  Instance of 'Mission'

  ///  Calling mission-chore report
  if (_pB) missionChoreReport('By: MissionBuildMissions');

  _flowC('  <-m--<--  missionL forEach print-choreL   done   <-m--<--', _pB);

  _flowC('-->-m-->      missionL.forEach.build    -->-m-->  ', _pB);
//  for (var x in missionL  ) {   //  NOT NOW !!!
  packDawoMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
  helsinkiMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
  dartlangMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
  myMusicMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
  myTimeMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
  nationalParksMission
    .._init(':M:-bms:')
    ..build(':M:-bms:');
//  };
  _flowC('  <-m--<--  missionL-forEach-build done   <-m--<-- ', _pB);
  //  TODO  make mission-chore report
  if (_pB) {
    for (var x in missionL) {
      String _misName = x.name;
      print('mis-name:  $_misName ');
      for (var z in x.choreL) {
        String _chrName = z.name;
        print('choreName:   $_chrName');
      }
    }
  }

  _flowC('  <-m--<--  missionL forEach print-choreL done AGAIN <----<-- ', _pB);
} //  -----  buildMissions

///  Creating instance of Mission and using it's methods.
///  All render_X functions are for test and presentation.
void renderMission(String caller) {
  //  TODO:  too much of:  Instance of 'CommonChore'
  //  helsinkiMission.  //  NOTE    #analyzer  is slow
  //  Testing some imaginary mission.
  var missionR = new Mission('MissionRender', 'Testing<<inRender<<Lib');
  String nameS = missionR.name;
  print(':M:render: -->>-->>-- renderMission:$nameS C: $caller ');
  missionR.showInfo();

  //  Methods init and build are obligatory for mission to work.
  missionR._init(':M:render:');
  missionR.build(':M:render:');
  missionR._opSt['on'] = true;

  missionR._buf.writeln(':renderMission: saving row od data to :m:_buf:');

  print(missionR.choreL);
  missionR.choreL.forEach(print);
  missionR.toChore(missionR.choreL[1]);

  missionR._buf.writeln(':renderMission: done, close; :m:_buf:');

  missionR._buf.clear();

  print(missionR._rollCount);
  print(':M:render: <<--<<--   renderMission done  C: $caller --<<--<<-- ');
  _flowC('--  mission: $missionR.name : render done  --', _pB);
}
