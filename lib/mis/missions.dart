// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *  missions: primary Dawo workPlatforms, they have chores that do the job.
/// *  dawoApp builds all the missions and their chores.
/// *  Primary functionality: engage chores.
/// *  Version 0.0.7.  18.12.2017
/// *  devState : 25 % / unknown  -  PLAN:  cleaning
// -  HIST:  hkl  8.9.2017
// -  devNote: 4 pc.
//
//  word:  build  46 / 33  pc. Is it too much.
//  chore:  96 / 20 pc

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

part 'missions_data.dart';

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
///  TODO  Mission has 31 public members !!
///  TESTED: when extending BaseStruct: Too many arguments in constructor.
class Mission {
// #TIP: When class properties begins with certain letter combination, like-bl..
// you avoid mess, that occurs, when class is used in mixin's.

  String name;
  String motto;
  String clause; //  Combination of #LANG words in sentence.

  /// #NEXT: Carry values to scoutJoin in connector
  /// Fields describe actions in connector and binding.
  /// Renamed this to: #say.  (  #talk,  or:  #com )
  /// This is the language, that missions and other objects talk (in con) .
  Map<String, String> say = {
    'purpose': ':SAMPLE :ThisMissionBLAA blaa blaa',
    'lang': ':SAMPKLE :LANG :HERE :ARE :ALL :WORDS',
    'area': ':SAMPLE :AREA1  :AREA2',
    'product': ':SAMPLE :PROD1 :PROD2',
    'sell': ':SAMPLE :OFFER1 :OFFER2 :OFFER3',
    'buy': ':SAMPLE :MATERIAL :TIME',
    'ask': ':SAMPLE :ASK1 :ASK2 :ASK3',
    'always': ':SAMPLE :alwaysX :alwaysY :alwaysZ :SAMPLE',
    'newer': ':SAMPLE :NO :UGLY'
  };

  ///  Instance info used in functions and outer-process calls.
  Map<String, String> placardM = {
    'actor': 'SampleMission',
    'sender': 'SampleMission instance',
    'receiver': 'SampleReceiver',
    'command': 'Sample:M:com:',
    'msg': 'SampleMis-msg:',
  };

  ///  TODO  Handy one-row info of placardM
  String placardRow() {
    String s1 = 'Act:   Send:    Rec:  Com:  msg:   ';
    return ('Act: ');
  }

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  //  Not yet  String seal = ':M-seal:'; //  like:  ":DAWO-APP:";
  String _emblem = 'M-emblem'; //  like:  ":DAWO-APP:";
  String _indent; // like:  "      ";  3-5-7 empty marks or something visible.

  ///  Reference to outPut-buffer, no high-value: used only in _flowC(
  StringBuffer _buf = out.outTMid; //  reference to used output StringBuffer.
  //  TODO "error: The type of buf can not be inferred, because the use of the
  //    instance-getter outTMid".

  ///  Collect all chores in operative entity.
  List<CommonChore> choreL = [];

  ///  Create default CommonChores for every Mission.
  ///  We have plenty of these, so let's add them!
  CommonChore learnChr = new CommonChore('LearnChr', ':masterName:', 'Yes, I learn');
  CommonChore joyChr = new CommonChore('JoyChr', ':masterName:', 'Yes, I have Joy');
  CommonChore actChr = new CommonChore('ActChr', ':masterName:', 'Yes, I act');
  CommonChore peopleChr = new CommonChore('PeopleChr', ':masterName:', 'Get social!');
  CommonChore placeChr = new CommonChore('PlaceChr', ':masterName:', 'Places I go places');
  CommonChore seasonChr = new CommonChore('SeasonChr', ':masterName:', 'Seasons differ!');
  CommonChore showChr = new CommonChore('ShowChr',':masterName:',  'Yes, I show');

  /// Store all data-maps of this mission-instance:
  Map<String, Map<String, String>> clayMap = {};

  //  State Map, Missions upper level state, used in init, done.
  Map<String, bool> st = {
    'wake': false,
    'work': false,  //true when build is done.
    'con': false, //  For connector.  in build: true.
    'pause': false,
    'done': false,
  };

  /// -op-  variables and methods to handle Mission operations
  //  Sub-operations state
  Map<String, bool> _opSt = {
    'wake': true,
    'work': false,
    'pause': false,
    'done': false,
  };
  int _opCount = 0;

  ///  #LEARN: Project may have some loose-starts, that will eventually fail.
  ///  #IDEA: _stFlags to control and document some area / entity in Mission.
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
  ///  For loop control variables.
  bool _rollDone = false;
  bool _rollEscape = false; //  Used in testing and to escape bugs.
  int _rollCount = 0;
  int _rollMax = 3; //  Emergency exit from loops.

  /// #IDEA?  chore map to give names to  W O R K  phases.
  /// #Name: Phase?  #BTW: Do not want to use "work". Instead: #job.
  Map<int, String> _rollSchedule = {
    1: 'Speed!',
    2: 'Hurry',
    3: 'Schedule',
    4: 'Normal',
    5: 'Delayed'
  };

  ///  Add #later map to constructor to get big chunk of data:
  ///  Mission(this.name, this.motto, Map<String,String> _clayM);
  Mission(this.name, this.motto);

  ///  Usage: No now.  Name: #Mill !!
  ///  Mission loops all it's Chores in #Mill like system. Rumba calls this.
  void missionRollChores(String caller) {
    //  Start loop, use choreL to choose one at a time.
    //  Run chore's code against it's master-mission.
    //  Handle user-actions until: done or excape.
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

  ///  Who's gonna call you?  Ghostbusters?
  ///  Initializing Mission instances fields. Changed to private.
  void _init(String caller) {
    _flowC('-->>-->>-- :M:init:   C: $caller     -->>-->>--    ', _pB);
    placardM['actor'] = name;
    placardM['sender'] = name.substring(0, 8);
    st['wake'] = true;
    _rollMax = 3;
    //  TODO  placardM['command'] =
  }

  ///  Building mission with it's chores.
  void build(String caller) {
    st['work'] = true;
    ///  Create default Chore's for everyMission: done in Class!
    ///  build default Chores:
    //  print(':BUG:DEBUG:build:Mission:build:  $name  C: $caller');
    //
    _flowC('-->-m-->         :M:b:         $name   -->-m-->  ', _pB);
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
    //  Join created object to :CON:connector: system.
    String _nS = name.substring(0, 7);
    String connectorMsg = ':INFO :ALL M: $_nS :are :READY :FOR :DAY :EVENT ';

    //  TODO  scout  ? connector.scoutJoin(placardM
    //  instead of ':M:build:' putting name to join-call.
    connector.join(name, placardM, connectorMsg, name);

    connector.roll();
    st['con'] = true;
    ///  add default chores to choreL and #TODO  forEach.build
    //  Short way:   choreL.forEach(build);
    _flowC('-->-m-->    choreL add-all:  $name       ', _pB);
    choreL.addAll(
        [learnChr, joyChr, actChr, peopleChr, placeChr, seasonChr, showChr]);
    //  CODE
    _flowC('   <-m--<--       :M:b:        done  $name     ', _pB);
  } //  -----  build

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in beta, chore and mission   * * *
  ///  :TEST:  change some variables to private.
  ///  Action is small class in #alpha (name, say)
  Action _decision;

  ///  Collecting all decisions.
  Map<String, Map<String, Action>> _decisionChainMM;

  ///  ***********************************************************************
  ///  #Word 's for stream-like processes. What 3 words to use?
  ///  chain, procession, queue, order, request, stream, river, flow, rune
  ///  19.10.2017  adapt this structure everywhere, until find better.
  void orderStream() {} //  is not async, just normal wait-a-little-in-queue.
  void chainStream() {} //  real stream, slow answer.
  void fireStream() {} //
  ///  ***********************************************************************

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

  ///  Report of mission data used by: devBox_C: By; dawoApp-:rM:
  List report(String caller, bool detailsB) {
    //  NOTE  If more than 9 Chores, need something else.
    String choreLengthS = choreL.length.toString();
    String choreS = getChoreNamesS();
    String _plcMS = tl.rowFromMap(placardM, 3, 0);
    String ps1 = ('**. $name  M: $motto                 .');
    String ps2 = ('** Clause:  $clause                     ');
    String ps3 = ('**  st: $st                                             ');
    String ps4 = ('**  rDone: $_rollDone  rCount: $_rollCount    ');
    String ps5 = ('**  OpSt: $_opSt   opCount:  $_opCount ');
    String ps6 = ('** $_stFlags                                            ');
    String ps7 = ('** rollSchedule: $_rollSchedule  ');
    String ps8 = ('_________________________________________________________');
    String ps9 = ('** Chrs: $choreLengthS  $choreS    ');
    String ps10 =
        ('PlacardM $_plcMS, 3,0)  _______________________________________');
    // String ps11 = ('p2 _$placardM  _______________________________________');
    var _l = [ps1, ps2, ps3, ps4, ps5, ps6, ps7, ps8, ps9, ps10];
    /* TODO  howTo mapToList
    print('----------say Map in mission   ----');
    List<String> _infoL = [];
    //  Get say Map Map to list
    _infoL.addAll(tl.mapToList(say));
    _infoL.forEach(print) ;
    */
    /*  mission say structure:
    String px1 = ('purpose                   ');
    String px2 = ('lang':                    ');
    String px3 = ('area':                    ');
    String px4 = ('product                   ');
    String px5 = ('sell':                   ');
    String px6 = ('buy': '                   ');
    String px7 = ('ask': '                   ');
    String px8 = ('always'                   ');
    String px9 = ('newer'                   ');
    String px10 = (                    ');
    */

    //  _l.forEach(print);
    ///  glorious coding. Once again;  choreL and default chores
    if (detailsB) {
      print('\n *** :M: report details : choreL : For mission: $name ***');
      choreL.forEach((x) {
        //  print(x.rowInfo());
        x.reportList('MissionReport:').forEach(print);
      });

      print('\n *** :M: report details clayMap chores For mission: $name ***');
      //  clayMap.forEach((k, v) => print('$k, $v'));
      tl.printStringMapMap(clayMap);
      print('************************ :M: report details done   ******** \n ');
    }
    return _l;
  } //  ----------  report
  ///  all done-methods should rename to:  terminate
  void done(){
    print(':BUG:ERROR:  Mission do not have :done: method.in.use');
  }  // Not used, not called.

//  TODO  teamNext   coming?:   returning some finnish day names aso.
  /// Should include some international values from other languages.

//  TODO  teamNext    coming:    Elementary Isolate example
//  TODO  teamNext    Simple future  sample
//  TODO  teamNext    Elementary Mixin   sample

} // --  end class Mission

///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right;
///  Every library / actor has its own flowC function.
///  Location of: _flowC inside OR outside of class?
void _flowC(String msg, bool p) {
  ///  Call #common flowServe with #LOCAL variables:
  flowServe(':M:', out.outTMid, msg, p);
}

///  Create Mission class instances.
var packDawoMission = new Mission('PackDawoMission', 'Build Dawo package.');
var helsinkiMission = new Mission('HelsinkiMission', 'Presenting Helsinki.');
var dartlangMission = new Mission('DartlangMission', 'Learn dartlang.');

var myMusicMission =
    new Mission('MyMusicMission', 'Play and share good music.');
var myTimeMission = new Mission(
    'MyTimeMission', 'Spend at least one hour in a week with reasonable way.');
var nationalParksMission =
    new Mission('NationalParksMission', 'Presenting beautiful finish nature.');

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
  ///  packDawoMission.
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

  //  call missionData.roll.  handles now only packDawo
  ///  new missionData.roll
  missionData.roll();

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
    .._init(':M:bms:')
    ..build(':M:bms:');
  helsinkiMission
    .._init(':M:bms:')
    ..build(':M:bms:');
  dartlangMission
    .._init(':M:bms:')
    ..build(':M:bms:');
  myMusicMission
    .._init(':M:bms:')
    ..build(':M:bms:');
  myTimeMission
    .._init(':M:bms:')
    ..build(':M:bms:');
  nationalParksMission
    .._init(':M:bms:')
    ..build(':M:bms:');
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
