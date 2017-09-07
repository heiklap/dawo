///  ## Modeling control of small app or operation.
///
///  idea:   some base / flow  functionality, that is too small for packages,
///  and too big for tools.dart or dawo_app.dart.
///  Connections to packages, that we do not want to import fully.
///  Some extra control / flow variables for processes/events/jobs
///
///  Hist:  hkl  9.10.2013  0.0.1  dawo/lib    daw lib_base.dart
///
///  READY-STATE for version 0.0.1   95 %   in GIT  Upd. 22.04.2015
///  Open for all ideas, when seeking common functionality between app / lib /
///  classes / process aso.  Name is little funny, for historical reasons.
///  includes  10   teamXxx notes

//  NOTE:  to-do's are now ELEMENTARY part of dawo's idea & work-flow
//TODO  teamDev  use "scrollable", "signalAble" properties developed elsewhere
//TODO  teamDev  use   and maybe  eventAble package...

part of dawo_src;

final num dawLibBaseReadiness = 95; //  readiness for  version  0.0.1

///  base lib class... Some info/state/basic values of -this- "part".
///  to control some extra/lower level state of apps or operations
///  it plays clearly below -app level
class BLib {
//  every class member and method begins with -bl.. to avoid mess, when class
//  is used in mixin 's
//  Throwing some variables and thinking their usage later.
  String blName;

  /// some maps to give platform for ideas to future development. bl maps
  /// PLAN:    trying to develop some maps for dawLib..  bl...
  Map<String, String> blInfo = {
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
  String blState = 'Functional';
  bool blStDo = false;
  bool blStDone = false;
  bool blStAware = false;

  ///   PLAN:  use flags maps to control something     blStFlags
  Map<String, bool> blStFlags = {
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
  bool blRollDone = false;
  int blRollCount = 0;

  ///  chore map to give names to  W O R K    states
  Map<int, String> blRollSchedule = {
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
  bool blOpOn = false;
  bool blOpDone = false;
  int blOpCount = 0;

  /// devNote  function, that OPENS something.  so rename; init
  bool blOpInit(int openCount, var openThis) {
    print('----  blOpInit ------');

    bool _initB = false;
    //  code to initialize variables in system
    return _initB;
  }

  /// devNote  function, that OPENS something.  so rename; init
  bool blOpOpen(int openCount, var openThis) {
    print('----  blOpOpen ------');
    bool _openB = false;
    //  code to roll -open-   - operations
    return _openB;
  }

  int blOpRoll(int rollCount, var autoRollFunc) {
    print('----  blOpRoll ------');
    int _rollCount =
        rollCount; //  now this just rolls func rollCount time,  lol
    for (var i = 0; i < rollCount; i++) {
      _rollCount++;
      autoRollFunc;
    }
    return _rollCount;
  }

  /// devNote  function, that OPENS something.  so rename; init
  int blOpClose(int openCount, var openThis) {
    print('----  blOpClose ------');

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
  void blToChore() {
    String motto = 'mediating process to chore..';
    assert(motto.substring(10, 17) == 'process');
    //  code..
  }

//constructor
  BLib(this.blName, this.blState);

//--------------------------------------------------   coming
//TODO  teamNext    coming:    Base Isolate example
//TODO  teamNext    Base future  sample
//TODO  teamNext    Base Mixin   sample

} // ---------------------------------------   end class BLib


///  creating instance of BLib and using it's methods
///  all render__X functions are for test and presentation
void renderBLib() {
  var bLib = new BLib('BLibRender', 'Testing<<inRender<<Lib');
  bLib.showInfo();
  bLib.blToChore();
}

//
