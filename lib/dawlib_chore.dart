///  hkl  6.5.2014  0.0.1  dawo/lib   Common   "w o r k  flow"  methods for dawo
///  Ready-state:   94%   in  GitHub:   yes   updated  22.04.2015
///   Wrapper round of your small piece of code:  //put your actual code here..
///   *chore* became eventually its own, independent package, so can not show
///   it's code here, or use it for now.
//TODO  chore; dawo can't use chore package. so make a simple plugin. But how?

///  Meant to:   place ALL common  W O R K  procedures here
///  Automatic-  life-cycle / W O R K / messages and rolling

//TODO  chore  build simple plugin or usage-case for chore
//TODO  chore  NEXT, make  Chr -class.??

library dawlib_chore;

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

//--------------------------------------------------------------
// Temporary added variables from team package here, to solve lib visibility.
List<String> innoNotes = ['Team inno notes:  ', '1', '2', '3'];
List<String> admNotes = ['Team Admin notes:  ', 'AdiminA', 'AdminB'];
List<String> howToNotes = ['Team HowTo notes:  ', 'How', 'To', 'Do'];
List<String> devNotes = ['Team dev notes:  ', 'DevA', 'DevB', 'DevC'];
//--------------------------------------------------------------

///  PLAN:     this is meant to.... ??   initialize some start-values
/// TODO  collection-list  add  ..  is there control for these lists and adds?
void initChore() {
  //   initializing of chore system

  devNotes
    ..add('make COMMON  init-module to EVVVERY  lib part')
    ..add('This could be for NOTES like W O R K s to be done');

  admNotes.add('NO: for  big   W O R K -lists');
}

//---------------------------------------------------------
//TODO  chore :   nice  chore class is already in separate team_work

//--------------------------------------------------------------------
/// temporary added here, from my chore-package (path based) to solve errors.
abstract class ChoreBase {
  String name = 'ChoreBase class';
  String info = 'Building chore s do-library';

  showInfo() => print('$name    :        $info');
}

//--------------------------------------------------------------------
///  PLAN:   organize   W O R K
/// TODO  chore  ERROR:  PROBLEM:  can't use baseClass from  team_chore-chore
class SuperChore extends ChoreBase {
  String name = 'Super Chore class  ';
  String info = 'Chore resolves  W O R K  flow and control ..';
}

///
class CommonChore extends ChoreBase {
  //  String name = 'Common Chore class  ';
  //  String info = 'Chore resolves  W O R K  flow and control ..';
  //  do not initialize values; just study, whhat this class got..
}

//---------------------------------------------------------------
///  some elementary: "execute-in-every-user-command-if-flagged" ideas
///  sometimes these X 10 objects are executed in EVERY occasion / keystroke..
///  PLAN   smmall checks, updates, msg:s, notes aso.
///  But only, if marked in   "flow - chart"
void topAll() {
  print('these   W O R K S   are executed in every cycle');
}

/// USAGE:    these are meant to be avoided.. as long as possible
void underAll() {
  // not nice name..
  print('These are executed ONLY in last occasion');
}

///  USAGE:    run   occasionally / timely, in sidebar
void sideAll() {
  print('executed occasionally in sidebar..');
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var alog, var xList, var yChore, var zSignal) {
  print('these are executed in beginning of W O R K  ');

  ///  rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow
  ///  zSignal (signAlable)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore() {
  print('Actual  W O R K   code here...');
}

///   routines, after W O R K   is done
void endChore() {
  print('execution scheduled, when   W O R K   is done');
}

///  example / testing chore
void renderChore() {
//TODO  temporary variables for to get this to work
  var _roller;
  var _alog;
  var _xList;
  var _yChore;
  var _zSignal;

//  var superChore = new SuperChore();
  var sc = new SuperChore();
  sc.showInfo();

  topAll();
  underAll();
  sideAll();

  startChore(_roller, _alog, _xList, _yChore, _zSignal);
  doChore();
  endChore();

  print(sc.info);
} //----------------------------------------------   end renderChore

//
