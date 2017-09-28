/// *  mission is something between app and chore, process
/// -  Primary functionality: engage chores. Version 0.0.3
/// -  ready_state for 0.0.4  0 %
/// -  HIST:  hkl  8.9.2017
//

library dawo_mission;

//  import 'package:dawo/dawo_app.dart';  //  not used
import 'package:dawo/base_struct.dart';
import 'package:dawo/base_lib.dart';
import 'package:dawo/dawlib_chore.dart';
import 'package:dawo/dawo_tools.dart';
import 'clay/clay_roll.dart';

///  buffer also outside class, for testing and adding visibility
var missionBuf = new StringBuffer();

///  Generic list to keep all missions.
///  In case for handling other, super or sub-missions, code something more.
///  buildMissions() fills this list. Is it outside of the Class.
List<Mission> missionL = [];

/// NOTE:  Chore-list is inside class.

///  to publish name in scope for testing
void helloMission() {
  flowC('-- Somebody call: hello this is mission file and library  ---', true);
}

///  Mission avoids consciously using Chores clear and handy structure, for to
///  leave space for innovation and to find different solutions for operations.
///  Mission acts clearly below -app level, but above chore.
///  Mission can include many chores. 7 Chores are build by default.
class Mission {
// #TIP: When class members begins with certain letter combination, like-bl..
// you avoid mess, that occurs, when class is used in mixin's.

  String name;
  String motto;

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal;  //  like:  ":DAWO-APP:";
  String indent;  // like:  "      ";  3-5-7 empty marks or something visible.


  List<CommonChore> choreL = [];

  ///  default CommonChores for every Mission
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

  ///  Present all info of this class / app.
  ///  #Tip: String can be in many lines with '''.
  void showInfo() {
    print('''idea:   some base / flow  functionality, that is too small 
        for packages and too big for tools.dart''');
  }

//----op-  variables and methods to handle Mission operations

  ///  'open'  variables
  bool opOn = false;
  bool opDone = false;
  int opCount = 0;

  /// Add later map to constructor:
  ///  Mission(this.name, this.motto, Map<String,String> _clayM);
  Mission(this.name, this.motto);

  void build() {
    ///  Create default Chore's for everyMission: done in Class!
    ///  build default Chores:
    //
    flowC('-->---->--  building mission:  $name   -->---->--', true);
    flowC('-->---->--  construct default Chores. For: $name -->---->--', true);

    ///  Should use instance, that is created inside THIS mission instance.
    learnChr.build();
    joyChr.build();
    actChr.build();
    peopleChr.build();
    placeChr.build();
    seasonChr.build();
    showChr.build();

    ///  add default chores to choreL and #TODO  forEach.build
    //  Short way:   choreL.forEach(build);
    flowC('-->---->--  choreL add-all:  $name   -->---->--', true);
    choreL.addAll(
        [learnChr, joyChr, actChr, peopleChr, placeChr, seasonChr, showChr]);

    //  CODE
    flowC('   --<----<--  building mission: done  $name   --<----<-- \n', true);
  }

  /// devNote:  function, that OPENS something.  so rename; init
  bool opInit(int openCount, var openThis) {
    print('-->---->--  opInit -->---->--');

    bool _initB = false;
    //  code to initialize variables in system
    return _initB;
  }

  /// devNote:  function, that OPENS something.
  bool opOpen(int openCount, var openThis) {
    print('-->---->--  opOpen -->---->--');
    bool _openB = false;
    //  code to roll -open-   - operations
    return _openB;
  }

  ///  Start developing operation roll function
  int opRoll(int rollCount, Function autoRollFunc) {
    print('-->---->--  opRoll -->---->--');
    int done = 0;
    //  now this just rolls func rollCount time,  lol
    for (var i = 0; i < rollCount; i++) {
      done++;
      autoRollFunc();
    }
    print('--<----<--  opRoll done c: $done --<----<--');
    return done;
  }

  /// devNote:  function, that OPENS something.  so rename; init
  /// idea?
  int opClose(int openCount, Function openThis) {
    print('--<----<-  opClose --<----<-');

    int _openCount = openCount;
    openThis(); // As I recall, parameter-function goes like this.
    _openCount++;

    return _openCount;
  }

  ///  report of mission data
  void report(String caller) {
    print('\n ****************** caller: $caller *************************');
    print('**  Mission:  $name  Motto: $motto');
    print('**  State:  $state ');
    print('**  stDo:  $stDo     stDone: $stDone  ');
    print('**  rollDone:   $rollDone     rollCount:  $rollCount');
    print('**  ');
    print('**  opOn: $opOn    opDone: $opDone     opCount:  $opCount');
    print('**  ');
    print('***********  chores   For mission: $name  *******************  ');

    ///  glorious coding. Once again;  choreL and default chores
    choreL.forEach((x) => print(x.rowInfo()));
    print('****************  clayMap   **********************************  ');
    //  clayMap.forEach((k, v) => print('$k, $v'));
    printStringMapMap(clayMap);
    print('*************************************************************  \n ');
  }

  //  TODO  clean

//TODO  teamNext   coming?:   returning some finnish day names aso.
  /// Should include some international values from other languages

  /// -----------------------------------------------   connect to chore
//TODO  teamDev *chore*, if is toChore.. should there be  outChore,  lonChore ?
  ///  base lib's connection to chore (package)
  ///  *chore* is separate package, which controls *job* :s
  ///  mediating calls to outside executor process
  void toChore(CommonChore _chore) {
    String motto = 'mediating process to chore..';
    assert(motto.substring(10, 17) == 'process');
    //  code..
  }

//--------------------------------------------------   coming
//TODO  teamNext    coming:    Base Isolate example
//TODO  teamNext    Base future  sample
//TODO  teamNext    Base Mixin   sample

} // ---------------------------------------   end class Mission

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right,
///  Every library / actor has its own flowC function
void flowC(String msg, bool p){
  ///  call flowServe with #LOCAL variables
  flowServe(':MISSION:', outTMid  , msg, p);
}

///  create Mission instances
var helsinkiMission = new Mission('Helsinki-mission', 'Presenting Helsinki');
var dartlangMission = new Mission('Dartlang mission', 'Learn dartlang');
var myMusicMission =
    new Mission('My-Music mission', 'Play and share good music');
var myTimeMission = new Mission(
    'My-Time mission', 'Spend at least one hour in a week with reasonable way');
var nationalParksMission = new Mission(
    'Finlands national park mission', 'Present beautiful finish nature');

///  add clay maps to missions
void buildMissions(String caller) {
  flowC('----------build Missions, caller: $caller -------------', true );
  helsinkiMission.clayMap.addAll(getClayMap('helsinkiGuide'));
  outMTop.writeln('outMtop-buildMissions:helsinki');

  dartlangMission.clayMap.addAll(getClayMap('learnDartlang'));
  outMid.writeln('outMid-buildMissions:dartlang');

  myMusicMission.clayMap.addAll(getClayMap('myMusic'));

  myTimeMission.clayMap.addAll(getClayMap('myTime'));

  nationalParksMission.clayMap.addAll(getClayMap('nationalParks'));

  ///  Write String to buffer for notification.
  outMBot.writeln('outBot-buildMissions:national-parks');

  ///  Add Mission-objects to upper-level missionL List.
  missionL.addAll([
    helsinkiMission,
    dartlangMission,
    myMusicMission,
    myTimeMission,
    nationalParksMission
  ]);

  /// .build adds default Chore's to missions
  print('-->---->--  missionL forEach print-choreL   -->---->--');
//  hklTry   missionL.forEach((x) => x.build);
  //  missionL.forEach(print);  //  =>  Instance of 'Mission'
  for (var x in missionL) {
    print(x.name);
    print(x.choreL);
  }
  print('--<----<--  missionL forEach print-choreL   done --<----<--');

  flowC('-->---->--    missionL.forEach.build    -->---->--', true);
//  for (var x in missionL  ) {   //  NOT NOW !!!
  helsinkiMission.build();
  dartlangMission.build();
  myMusicMission.build();
  myTimeMission.build();
  nationalParksMission.build();
//  };
  flowC('--<----<--  missionL-forEach-build done --<----<-- \n', true);
  for (var x in missionL) {
    String _misName = x.name;
    print('mis-name:  $_misName ');
    for (var z in x.choreL) {
      String _chrName = z.name;
      print('choreName:   $_chrName');
    }
  }
  print('--<----<--  missionL forEach print-choreL done AGAIN  --<----<-- \n');
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
  flowC('--  mission: $missionR.name : render done  --', true);
}
