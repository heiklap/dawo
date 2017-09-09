///  mis-sion is something between app and chore, process
///  HIST:  hkl  8.9.2017
//

library dawo_mission;

///  buffer also outside class, for testing and adding visibility
var missionBuf = new StringBuffer();

///  generic list to keep all missions
List<Mission> missionL = [];

void helloMission() {
  print('-- hello this is mission file and library  ---');
}

///  base lib class... Some info/state/basic values of -this- "part".
///  to control some extra/lower level state of apps or operations
///  it plays clearly below -app level
///  name may be changed to: #mission, it is between app and chore
///  and mission can include many chores
class Mission {
//  every class member and method begins with -bl.. to avoid mess, when class
//  is used in mixin 's
//  Throwing some variables and thinking their usage later.
  String name;

  /// some maps to give platform for ideas to future development.  maps
  /// PLAN:    trying to develop some maps for dawLib..  ...
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

  //  -state-  variables
  String state = 'Functional';
  bool stDo = false;
  bool sDone = false;
  bool stAware = false;

  ///   PLAN:  use flags maps to control something     stFlags
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

  //  -roll  and  -op   are different level of operations
  //  -roll-  variables
  bool rollDone = false;
  int rollCount = 0;

  ///  chore map to give names to  W O R K    states
  Map<int, String> rollSchedule = {
    1: 'Speed!',
    2: 'Hurry',
    3: 'Schedule',
    4: 'Normal',
    5: 'Delayed'
  };

  ///  make to present all info of this class / app
  void showInfo() {
    print('''idea:   some base / flow  functionality, that is too small 
        for packages and too big for tools.dart''');
  }

//-------------------  -op-  variables and methods

  //  'open'  variables
  bool opOn = false;
  bool opDone = false;
  int opCount = 0;

  //constructor
  Mission(this.name, this.state);

  /// devNote  function, that OPENS something.  so rename; init
  bool opInit(int openCount, var openThis) {
    print('----  oInit ------');

    bool _initB = false;
    //  code to initialize variables in system
    return _initB;
  }

  /// devNote  function, that OPENS something.  so rename; init
  bool oOpen(int openCount, var openThis) {
    print('----  oOpen ------');
    bool _openB = false;
    //  code to roll -open-   - operations
    return _openB;
  }

  int oRoll(int rollCount, var autoRollFunc) {
    print('----  oRoll ------');
    int _rollCount =
        rollCount; //  now this just rolls func rollCount time,  lol
    for (var i = 0; i < rollCount; i++) {
      _rollCount++;
      autoRollFunc;
    }
    return _rollCount;
  }

  /// devNote  function, that OPENS something.  so rename; init
  int oClose(int openCount, var openThis) {
    print('----  oClose ------');

    int _openCount = openCount;
    openThis; // is this how it goes??
    _openCount++;

    return _openCount;
  }

//TODO  teamNext   coming?:   returning some finnish day names aso.
  /// Should include some international values from other languages

  /// -----------------------------------------------   connect to chore
//TODO  teamDev *chore*, if is toChore.. should there be  outChore,  lonChore ?
  ///  base lib's connection to chore (package)
  ///  *chore* is separate package, which controls *job* :s
  ///  mediating calls to outside executor process
  void toChore() {
    String motto = 'mediating process to chore..';
    assert(motto.substring(10, 17) == 'process');
    //  code..
  }

//--------------------------------------------------   coming
//TODO  teamNext    coming:    Base Isolate example
//TODO  teamNext    Base future  sample
//TODO  teamNext    Base Mixin   sample

} // ---------------------------------------   end class Mission

///  creating instance of Mission and using it's methods
///  all render__X functions are for test and presentation
void renderMission() {
  var missionR = new Mission('MissionRender', 'Testing<<inRender<<Lib');
  missionR.showInfo();
  missionR.toChore();
  missionR.rollCount;
  print('--  mission render done  --');
}
