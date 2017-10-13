/// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
/// *  mission is something between app and chore, process.
/// -  Primary functionality: engage chores. Version 0.0.3
/// -  ready_state for 0.0.4  0 %
/// -  HIST:  hkl  8.9.2017
/// -  devNote: 4 pc.
//
//  word:  build  38 / 26  pc. Is it too much.
//  chore:  20 pc

///  Renamed library to: missions for 0.0.4.
library missions;

//  import 'package:dawo/dawo_app.dart';  //  not used
import 'package:dawo/base_struct.dart';
import 'package:dawo/base_lib.dart';
import 'package:dawo/chore.dart';
import 'dawo_dev.dart';
import 'package:dawo/tools.dart';
import 'package:dawo/equipment.dart';
import 'clay/clay_roll.dart';

///  Buffer also outside class, for testing and adding visibility.
var missionBuf = new StringBuffer();

//  TODO  Should all pB variables change private: _pB?
// bool pB = false; //  Control printing, now:  false;
bool pB = true; //  true for chore_test.dart;

///  Generic list to keep all missions.
///  In case for handling other, super- or sub-missions; code something more.
///  buildMissions() fills this list. It is outside of the Class.
List<Mission> missionL = [];

/// NOTE:  Chore-list is inside this class.  Most outside activity to Chore, is
/// accessed via Mission-class.

///  To publish name in scope for testing visibility.
void helloMission() {
  flowC('-- Somebody call: hello this is mission file and library  ---', pB);
}

///  Mission avoids consciously using clear and handy structure of Chore class,
///  for to leave space for innovation and to find different solutions for ops.
///  Mission handles acts below -app level, but above chore.
///  Mission can include many chores. 7 Chores are build by default.
class Mission {
// #TIP: When class properties begins with certain letter combination, like-bl..
// you avoid mess, that occurs, when class is used in mixin's.

  String name;
  String motto;

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  //  Not yet  String seal = ':M-seal:'; //  like:  ":DAWO-APP:";
  String emblem = 'M-emblem'; //  like:  ":DAWO-APP:";
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.

  ///  Reference to outPut-buffer don't carry much: used only in flowC(
  var _buf = out.outTMid; //  reference to used output StringBuffer.

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

  //----op-  variables and methods to handle Mission operations
  ///  'open'  variables. Make this a Map. ?
  bool opOn = false;
  bool opDone = false;

  int opCount = 0;

  /// #Idea?  Control missions state, working-condition / state.
  String state = 'Functional';
  bool stDo = false;
  bool stDone = false;
  bool stAware = false;

  ///  #Idea:  use flags maps to control something     stFlags
  Map<String, bool> stFlags = {
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
  bool rollDone = false;
  int rollCount = 0;

  /// #Idea?  chore map to give names to  W O R K  -states.
  /// #Name: Do not want to use "work". Instead: #job.
  Map<int, String> rollSchedule = {
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

  //TODO  teamDev *chore*, if is toChore.. should there be  outChore,  lonChore ?
  ///  base lib's connection to chore (package) (?)
  ///  *chore* is separate library, which controls *job* :s
  ///  Mediating calls to outside executor process. (?)
  ///  Name: choreBus ?  choreRoute ?
  ///  Usage: no
  void toChore(CommonChore _chore) {
    String motto = 'mediating process to chore..';
    assert(motto.substring(10, 17) == 'process');
    //  code..
  }

  ///  Building mission with it's chores.
  void build() {
    ///  Create default Chore's for everyMission: done in Class!
    ///  build default Chores:
    //
    flowC('-->-m-->         :M:-b:         $name   -->-m-->  ', pB);
    flowC('-->-m-->    construct default Chores. For: $name -->-m-->  ', pB);
    print(':M-build: => :chore.onB:: ');

    ///  Should use instance, that is created inside THIS mission instance.
    learnChr.build(emblem, name); //  new parameter in Chore.build
    joyChr.build(emblem, name); //  emblem and master parameters to Chore.
    actChr.build(emblem, name);
    peopleChr.build(emblem, name);
    placeChr.build(emblem, name);
    seasonChr.build(emblem, name);
    showChr.build(emblem, name);

    ///  add default chores to choreL and #TODO  forEach.build
    //  Short way:   choreL.forEach(build);
    flowC('-->-m-->    choreL add-all:  $name       ', pB);
    choreL.addAll(
        [learnChr, joyChr, actChr, peopleChr, placeChr, seasonChr, showChr]);
    //  CODE
    flowC('   <-m--<--       :M:-b:        done  $name     ', pB);
  } //  -----  build

  /// devNote:  function, that OPENS way to use outer resources.
  bool opInit(int openCount, var openThis) {
    ///  use resource, equ class
    flowC('-->-m-->  :M:op:  opInit ', pB);
    flowC(':M:op: opInit-info: Get necessary data for op-operations. >>', pB);
    flowC('>>  :M:op:Resource object-simulations from app upper level.', pB);
    equ.active = true; //  Resource class activate.
    //  opOn;
    //  opDone;
    //  opCount;

    bool _initB = false;
    //  code to initialize variables in system
    return _initB;
  }

  /// devNote:  function, that OPENS something.
  bool opOpen(int openCount, var openThis) {
    flowC('  -->-m-->  :M:op:  opOpen  ', pB);
    flowC('  :M:op: opOpen-info: Open data-tables and resolve queries.>>', pB);
    flowC('  >>  :M:op: Schedule area-machine-money resources in time.', pB);
    bool _openB = false;
    //  code to roll -open-   - operations
    return _openB;
  }

  ///  Start developing operation roll function
  ///  Eventually opRoll handles all these others: init-open-close-schedule..
  int opRoll(int rollCount, Function autoRollFunc) {
    flowC('    -->-m-->  :M:op:  opRoll  ', pB);
    flowC('    :M:op: opRoll-info: Run init-open, &; close & report. >>', pB);
    flowC('>>  :M:op: INFO: op-operationsa are outside chore-world.', pB);
    int done = 0;
    //  now this just rolls func rollCount time,  lol
    for (var i = 0; i < rollCount; i++) {
      done++;
      autoRollFunc();
    }
    flowC('    <-m--<--  opRoll done c: $done    ', pB);
    return done;
  }

  ///  Data-table of outside resources grouped in time.
  void opSchedule() {
    flowC('--<----<-  :M:op:  opSchedule --<----<-', pB);
    flowC(':M:op: opSchedule-info: Report for to check data lists. >>', pB);
    flowC('>> :M:op: opSchedule: ** Not needed when opSchedule is on.**.', pB);

    ///  Call equ class and it's allocate method to get resource List
    List<String> _resAllocL = [];
    equ.init(':M:opSchedule');
    _resAllocL.addAll(equ.allocate(36, 40)); //  width var not used yet.
    /*
    print('*************  resAllocL  ************************');
    print(_resAllocL.length);
    _resAllocL.forEach(print);
    print('*************  resAllocL  ************************');
    */
    ///  From fixed length list to fill screen;
    ///  TODO  These special ASCII marks are ugly and take more space.
    String _s176 = '░'; //  low-density mark, too ugly and not nice.
    String _s177 = '▒'; //  high density
    int _sw = 195; //  screen width
    int _rc = 40; //  row count
    //  too complicated, I guess.
    List<String> _matrix = new List();
    //  add row-numbers to matrix. Next operation ruins this. lol
    for (var x = 0; x < _rc + 0; x++) {
      String _s = x.toString();
      _matrix.add('$_s ');
    }
    //  to get row numbers.
    int _count = 100;
    for (var z = 0; z < _matrix.length; z++) {
      String __s176 = '░';
      _count++;
      String _countS = _count.toString();
      //  TODO  choose nice background mark for matrix.
      _matrix[z] = '$_count '.padRight(_sw, '-'); //  pad with low-density mark.

    }

    ///  Last row of matrix for range-10 marks; NOTE: _rc - 1
    _matrix[_rc - 1] =
        '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';

    ///  Add padLeft & padRight Strings to make this common.
    ///  Pad List right and left with ' ' and make all even length
    List padListRL(List<String> _l) {
      int long = longestItemInList(_l);
      //  looks funny, surely we can make better :)
      for (var x = 0; x < _l.length; x++) {
        //  int itemLength = _l.length;  //  length NOW
        String _thisItem = _l[x];
        String _s = (' $_thisItem');
        String _ss = _s.padRight(long + 2, ' ');
        _l[x] = _ss;
        //  Pad every item right with ' ' to length of the longest item.
      }
      return _l;
    }

    //  Fill list-data in matrix in r, _c coordinates.
    void anchorBox(int _r, int _c, List __l) {
      List<String> _l = [];
      _l.addAll(padListRL(__l));
      //  supposing list items are all same length.
      //  int _lc = _l.length;
      //  int _lw = 0;  //  in future we use List-common-item-length.
      int _count = _l.length;
      for (var x = 0; x < _count; x++) {
        //  String _sS = '';
        String _s1 = _matrix[_r].substring(0, _c);
        //  print(_s1);
        String _s2 = _l[x]; //  current list value.
        //  print(_s2);
        int itemLength = _l[x].length;
        //  print(itemLength);
        int matrixRowLength = _matrix[_r].length;
        String _s3 = _matrix[_r].substring(_c + itemLength, matrixRowLength);
        //  print(_s3);
        //  print(' Here we go: $_s1$_s2$_s3 ');
        //  print('$_s1$_s2$_s3');
        _matrix[_r] = '$_s1$_s2$_s3';
        _r++; //  next row.
      }
      //  print(' ------------  anchorBox done   ---------------------');
    }

    ///  Simulated lists:
    anchorBox(3, 5, [
      '**  Mission-op development experience; common usable stuff',
      '**  Presenting available objects in scope.  **'
    ]);

    anchorBox(6, 5, ['IDEA:', 'IDEA:', 'NOTE:', 'NOTE:']);
    anchorBox(3, 80, equ.officeCities);

    anchorBox(12, 10, equ.areas);

    anchorBox(10, 82, equ.cars);

    anchorBox(26, 8, equ.weekDays);

    anchorBox(22, 60, equ.months);

    anchorBox(33, 44, equ.programAreas);

    anchorBox(1, 123, _resAllocL);
    //  Usable resources:
    //  toolsActiveM
    //  toolsSpeedM
    //  status

    _matrix.forEach(print);
  }

  /// devNote:  function, that CLOSES it's object.
  /// idea?
  int opClose(int openCount, Function openThis) {
    equ.active = false;
    flowC('--<----<-  :M:op:  opClose --<----<-', pB);
    flowC(':M:op: opClose-info: End lof mission-op operation. >>', pB);
    flowC('>>  :M:op: **  Statistics ready, save next-round data. **.', pB);

    int _openCount = openCount;
    openThis(); // As I recall, parameter-function goes like this.
    _openCount++;
    return _openCount;
  }

  ///  give report of op statistics
  void opReport() {
    flowC('  --<----<-  :M:op:  opReport --<----<-', pB);
    flowC('  :M:op: opReport-info: Report for to check data lists. >>', pB);
    flowC('  >>  :M:op: opReport: ** Not needed when opSchedule is on.**.', pB);
    List<String> _l = [];
    List<String> _l2 = [];
    _l.addAll(bufToList(out.outTMid));
    for (var x = 0; x < _l.length; x++) {
      ///  Add all ':M:op:' to _l2.
      if (_l[x].indexOf(':M:op:') > 0) {
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
    print('''idea:   some base / flow  functionality, that is too small 
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

    String ps1 = ('**.               caller: $caller                       .');
    String ps2 = ('**  $name         Motto: $motto');
    String ps3 = ('**  State:  $state ');
    String ps4 = ('**  stDo:  $stDo     stDone: $stDone  ');
    String ps5 = ('**  rollDone:   $rollDone     rollCount:  $rollCount');
    String ps6 = ('**  ');
    String ps7 = ('**  opOn: $opOn    opDone: $opDone     opCount:  $opCount');
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
      printStringMapMap(clayMap);
      print('************************ :M: report details done   ******** \n ');
    }
    return _l;
  } //  ----------  report

//  TODO  teamNext   coming?:   returning some finnish day names aso.
  /// Should include some international values from other languages.

//  Coming.
//  TODO  teamNext    coming:    Base Isolate example
//  TODO  teamNext    Base future  sample
//  TODO  teamNext    Base Mixin   sample

} // --  end class Mission

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right,
///  Every library / actor has its own flowC function
void flowC(String msg, bool p) {
  ///  call flowServe with #LOCAL variables
  ///  :MISSION: is too long.
  flowServe(':M:', out.outTMid, msg, p);
}

///  Create Mission class instances.
var packDawoMission = new Mission('pack Dawo mission', 'Build Dawo package');
var helsinkiMission = new Mission('Helsinki-mission', 'Presenting Helsinki');
var dartlangMission = new Mission('Dartlang mission', 'Learn dartlang');

var myMusicMission =
    new Mission('My-Music mission', 'Play and share good music');
var myTimeMission = new Mission(
    'My-Time mission', 'Spend at least one hour in a week with reasonable way');
var nationalParksMission = new Mission(
    'Finlands national park mission', 'Present beautiful finish nature');

///  Show missions and their chores.
void missionChoreReport(String caller) {
  print('-->>-->>----  missionChoreReport  caller: $caller');
  for (var x in missionL) {
    print(x.name);
    print(x.choreL);
  }
  print('--<<--<<----  missionChoreReport done caller: $caller');
}

///  Add clay ( data ) maps to missions.
///  TODO  Messy function buildMissions.  Clean, organize it.
void buildMissions(String caller) {
  flowC('-->-m--> build Missions, caller: $caller   ', pB);
  dev.admNotes.add('>>ADM:CHECK-IN  build-Missions  >>');

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
  flowC('-->-m-->    missionL forEach print-choreL   -->-m-->  ', pB);
//  hklTry   missionL.forEach((x) => x.build);
  //  missionL.forEach(print);  //  =>  Instance of 'Mission'

  ///  Calling mission-chore report
  if (pB) missionChoreReport('By: MissionBuildMissions');

  flowC('  <-m--<--  missionL forEach print-choreL   done   <-m--<--', pB);

  flowC('-->-m-->      missionL.forEach.build    -->-m-->  ', pB);
//  for (var x in missionL  ) {   //  NOT NOW !!!
  packDawoMission.build();
  helsinkiMission.build();
  dartlangMission.build();
  myMusicMission.build();
  myTimeMission.build();
  nationalParksMission.build();
//  };
  flowC('  <-m--<--  missionL-forEach-build done   <-m--<-- ', pB);
  //  TODO  make mission-chore report
  if (pB) {
    for (var x in missionL) {
      String _misName = x.name;
      print('mis-name:  $_misName ');
      for (var z in x.choreL) {
        String _chrName = z.name;
        print('choreName:   $_chrName');
      }
    }
  }

  flowC('  <-m--<--  missionL forEach print-choreL done AGAIN <----<-- ', pB);
} //  -----  buildMissions

///  creating instance of Mission and using it's methods
///  All render_X functions are for test and presentation.
void renderMission() {
  //  helsinkiMission.  //  NOTE    #analyzer  is slow
  //  Testing some imaginary mission.
  var missionR = new Mission('MissionRender', 'Testing<<inRender<<Lib');
  missionR.showInfo();
  missionR.opOn = true;
  helsinkiMission.missionR.toChore();
  missionR.rollCount;
  flowC('--  mission: $missionR.name : render done  --', pB);
}
