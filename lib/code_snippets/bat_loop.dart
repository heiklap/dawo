///  Do not produce to dawoApp.  Just sample code-snippets.
///  Some useful copy-paste stuff for learning simple functions.
///  GOAL: find common, reusable elements for control-flow, and develop
///  names, and ideas-
///  In GitHub, for to be able to modify while on-The-Road.
///  dawo version:   0.0.4  16.10.2017
///  readyState for 0.0.5.  0%    in gitHub:   yes
///  This serves as example:  What can you develop from these ideas..?
///
/// *  hist:  20.4.2014  0.0.1  dawo/lib  Collection of control-flow structures
/// *  Words:  batLoop: 11 / 21, batman : 18, robin : 27, joker : 31 times.

//NOTE   Function anonymous
/* functions
  batman();
  robin();
  joker();    do not exsist here.. they are used BY YOU as parameters and
  inside functions


If you don’t need to give a name to a function, there is an anonymous form, too.
 *It looks like a named function, but without a name or return type.
 Here is an example:

var shouts2 = messages.where((m) {
  return (m.toUpperCase() == m);
}).toList();
  */

library bat_loop.dart;

//  example: howTo use getters to collect values from searate files
//  xxxReadiness :  getters in dawo_src.dart collects sum of these variables
final num batLoopReadiness = 90; // for 0.0.1 version

void doLine(String msg) {
  print('----------------------------------------' + msg);
}

///
void doBatLine(String msg) {
  print('------------------ Batman ----------------------' + msg);
}

/// TODO  teamDev  Untested function, NOT-READY
/// TODO  teamNext  returns, when joker returns false and others are true
bool batFight(var batman, var robin, var joker, bool condition) {
  batman();
  robin();
  joker();
  num _loopCount = 0;
  num _loopMax = 3; //  backdoor
//TODO  control
  bool _thisCondition = condition;
  do {
    _loopCount++;
    if (_loopCount == _loopMax) (_thisCondition = true); // backdoor
    if (batman() == false) {
      _thisCondition == false;
    } else if (robin() == false) {
      _thisCondition == false;
    } else if (joker() == false) {
      _thisCondition == true;
    } else {
      _thisCondition == true;
    }
  } while (!_thisCondition);
  //TODO  teamNext    isolateFuncOne()     // roll inside isolate
  //    isolateFuncTwo()
  return _thisCondition;
}

/// TODO  teamNext  PLAN: execute 3 of functions X times.. or X  DISTANCE.
void batRide(
    var batman, var robin, var joker, num batNum, num robinNum, numJokerNum) {
  batman();
  robin();
  joker();
  print('.. coming soon:    batRide gives nr of rides to everyone');
}

//TODO  teamDev :  ??... what was this meant to do...??
///  Maybe some class, which includes these 3 methods.
///  Mobile must be...   but what would it do ?
void batMobile(var batman, var robin, var joker) {
  batman();
  robin();
  joker();
  print('----------  batMobile might say no to 3.  Joker');
}

///  :(
String batMail(){
  String sender = 'Wayne Enterprise';
  return 'Greetings from Bstmail!  $sender';
}

///  PLAN:  maybe some base-class.. and these three work inside it
///  MAYBE:  using dependency injection so plant 3 in one
void batHome(var batman, var robin, var joker) {
  batman();
  robin();
  joker();
  print('----------  batHome..  no plans for it now..      ');
}

///  PLAN:  exception in output.. joker wins.. maybe..
void joker(var batman, var robin, var joker) {
  batman();
  robin();
  joker();
}

///  Totals sums of 3 functions, WHICH RETURN num values.
num batCount(var numX, var numY, var numZ) {
  num _total = 0;
  num _batReturn = 0;
  _batReturn = numX();

  num _robinReturn = 0;
  _robinReturn = numY();

  num _jokerReturn = 0;
  _jokerReturn = numZ();
  _total = (_total + _batReturn + _robinReturn + _jokerReturn);
  print(_total.toString());
  return _total;
}

///  Totals sums of 3 functions, WHICH RETURN num value. (simple)
// you can not call this with values : print(batTotal(3,4,5));
num batTotal(var batman, var robin, var joker) {
  //  num total = 0;        //  Future plans..?
  //  num batReturn = batman();
  //  num robinReturn = robin();
  //  num jokerReturn = joker();
  //  total = (total + batReturn + robinReturn + jokerReturn);
  return (batman() + robin() + joker());
}

///   Roll 3 functions until everyone returns true
//TODO  teamDev     should be backdoor here.. to avoid deadLock
//TODO  control     NOT-READY   make necessary loops here
void rollTrue(var batman, var robin, var joker) {
  batman(); // roll until everybody is true
  robin();
  joker();
  print(' .. missing necessary loops for now on..      ');
  print(' should be backdoor here.. to avoid deadLock');
}

/*
  if {
  (bat() == false) or
  (robin() == false) or
  (joker() == false)
  } condition == false
  else (condition == true);
   */

//TODO  Functions --------       Functions     ----------
///  three functions are rolled until ALL THREE return true

/// TODO  Functions ..something clever planned here... suppose, but what?
bool trueBat(var bat, var robin, var joker, bool condition) {
  bool _thisCondition = condition;
  do {
    if (bat() == false) {
      condition == false;
    } else if (robin() == false) {
      condition == false;
    } else if (joker() == false) {
      condition == false;
    } else {
      condition == true;
    }
  } while (!condition);
  //    isolateFuncOne()     // roll inside isolate
  //    isolateFuncTwo()
  return _thisCondition;
}

///   presents info about batLoop functions: batLoopInfo
void batLoopInfo() {
  doLine('info');
  print('batLoop.dart,  grazy collection of loop structures');
  print('examples:  https://www.dartlang.org/dart-tips/dart-tips-ep-8.html ');
  print('USAGE: use this as fast memory cards or templates..');
  doLine('info end');
}

/// TODO  teamNext  class  :  NOT-READY  not much use yet to BatLoop class
///  but however...   of course here must be class for this..
class BatLooper {
  String info = 'this is batLoop class  ';

  void commandLoop() => print('this is bat command loop');
}

/*
void rainLoop() {
  /*TODO  control      coded in string
  String myCode = 'void rainLoop() {
  bool isRaining() => true;
  bool isSnowing() => false;
  if (isRaining()) {
  print('im wearing raincoat');
  } else if (isSnowing()) {
    print('Im wearing jacket');
  } else {
    print('beautiful weather');
  }
}
';
*/

  bool isRaining() => true;
  bool isSnowing() => false;
  if (isRaining()) {
  print('im wearing raincoat');
  } else if (isSnowing()) {
    print('Im wearing jacket');
  } else {
    print('beautiful weather');
  }
}


void notBoolLoop() {
String name = '';
if (name) {
  // will never be reached
} else {
  // a string is not a bool, so it is false
}
}
*/

///   borrowed directly from dartlang docs... I think
/// TODO  teamNext     NOT-READY.   PLAN:  yes.. but what?
void isBoolLoop() {
  String name = '';
  if (name != null && !name.isEmpty) {
    print(' yes this is name');
  } else {
    print('tryAgain');
  }
}

///  from  dartlang.org
/// For very simple conditions, you can write an if statement on one line of
///  code. Here is an example:
void oneRowIf() {
  recurse(List items) {
    //  function not used
    //  The function 'recurse' is not used
    if (items == null || items.isEmpty) return;
    // …
  }

  recurse([1, 3, 5]); //  test
}

/*
while(peopleAreClapping()) {
playSongs();
}

do {
processRequest();
} while(stillRunning());

while (true) {
if (shutDownRequested()) break;
processIncomingRequests();
}
*/

///  model from dartlang.org
///    sample loop for    switch   cases
void commandLoop() {
  var command = 'OPEN';
  //.........................
  doClosed() => print('..closed');
  doOpen() => print('..open');
  doApproved() => print('..approved');
  doUnknown() => print('..unknown');

  //.........................
  switch (command) {
    case 'CLOSED':
      doClosed();
      break;
    case 'OPEN':
      doOpen();
      break;
    case 'APPROVED':
      doApproved();
      break;
    default:
      doUnknown();
  }
}

///  sample data to develope some maps for dawlib
///  PLAN:   Maybe:   menu...  mnFile, mnOpen, mnEdit ...
Map<String, String> batInfo = {
  'arName': 'dawo App',
  'arInfo': 'dartang pub package for education',
  'arCreator': 'me',
  'arInstructions': '0.0.01',
  'arActive': '0',
  'arStopped': '0',
  'arPaused': '0',
  'arUserWork': 'yes',
  'arAutoWork': 'no'
};

///  PLAN:  autoRunMap
Map<String, String> batWorld = {
  'Home': 'Bat cave',
  'Car': 'BatMobile',
  'Work': 'Gotham City',
  'Hometownn': 'Gotham City',
  'Enemy': 'joker',
  'Boy': 'Robin',
  'Partner': 'Police',
  'Obey': 'law',
  'Prevent': 'crime',
};

///  NOT-READY  sample-data    batFlags
Map<String, bool> batFlags = {
  'WorkReal': false,
  'WorkAccepted': false,
  'WorkAborted': true,
  'WorkStarted': false,
  'WorkActive': false,
  'WorkStopped': false,
  'WorkPaused': false,
  'UserWork': false,
  'AutoWork': false
};

/// NOT-READY, PLAN?   bat Hurry map xxx
Map<num, String> batHurry = {
  1: 'Speed!',
  2: 'Hurry',
  3: 'In schedule',
  4: 'Normal',
  5: 'delayed'
};

///  ..
void renderBatLoop() {
  //  for testing purposes render class here
  var batLooper = new BatLooper();
  print(batLooper.info);
}

///   UNTESTED:     tests batLoop functions
void batLooperTest() {
  var batLooper = new BatLooper();
  // batLooper.rainLoop();
  doLine('rain loop no exists..  ');

//TODO  Functions   Class   these are not yet inside class.
  // batLooper.isBoolLoop();
  isBoolLoop();
  doLine('is bool loop');

  //batLooper.oneRowIf();
  oneRowIf();
  doLine('one row if');

  batLooper.commandLoop();
  doLine('command loop');
}

///  you can test moving all these functions inside a class:
//  class Func{
///  move functions here
//  }

//
