///  ##  Chore for organizing work flow.  Version 0.0.2
///  Primary functionality: get notes-list aso data from input/clay
///  incoming data (clayIn) comes from customer. coders OR sample aso.
///  Controlling work-flow and processes. Wrapper round of your small piece of
///  code:  Put your actual code inside Chore.
///
///   ## *chore* became eventually its own, independent package, and it did fly
///   out of dawo with it's own wings. Here will be small version of it.
///
///  hkl  6.5.2014  0.0.1  dawo/lib   Common   "w o r k  flow"  methods for dawo
///  Ready-state:   94%   in  GitHub:   yes   updated  22.04.2015///
///
//TODO  chore; dawo can't use chore package. so make a simple plugin. But how?

///  Meant to:   place ALL common  W O R K  procedures here
///  Automatic-  life-cycle / W O R K / messages and rolling

//TODO  chore  build simple plugin or usage-case for chore
//TODO  chore  NEXT, make  Chr -class.??

library dawlib_chore;

import 'base_struct.dart';
import 'base_lib.dart';
import 'dawo_dev.dart';
import 'clay/clay_roll.dart';

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

///  buffer also outside class, for testing and adding visibility
var choreBuf = new StringBuffer();

///  generic List to keep all Chores
List<CommonChore> choreL = [];


///  TODO  devNotes ==   #chore, that is always in dawoApp
//

///   initializing of chore system. Update dev-class
void initChore() {
  dev.devNotes
    ..add('make COMMON  init-module to EVVVERY  lib part')
    ..add('This could be for NOTES like W O R K s to be done');

  dev.admNotes.add('NO: for  big   W O R K -lists');
}

///  every important dawo class extending now base struct class
class CommonChore extends BaseStruct {
  String name = 'Common Chore class  ';
  String infoS = 'Chore resolves  W O R K  flow and control ..';
  //  do not initialize values; just study, what this class got..
  String motto = 'chore handling small jobs';

  StringBuffer buf = new StringBuffer();

  ///  controlling chores state, working-condition-state values
  bool offB;
  bool onB;
  bool pauseB;
  bool doneB;

  ///  testing placardM inside chore
  Map<String, String> placardM = {
    'actor': 'Chore',
    'sender': 'Chore instance',
    'receiver': '',
    'command': 'Ch-cmd:',
    'msg': 'Ch-msg:',
  };

  ///  Method for setting class field values
  void init() {
    buf.writeln('---  Chore buffer output initialized  ---');

    //  set fields values
    buf.writeln('init done');
  }

  ///  method for setting class in working condition
  void build() {
    print('----------------------  chore $name build  ----------------------');

    offB = false; //  off-state ends
    onB = true; //   app is in on
    buf.writeln('build for chore:  $name  : done');
    print('-----------------    chore build  done --------------------');
  }

  ///  #run-like method
  void roll() {
    print('---  ch roll  -----');
    String _s = 'Chore::    $infoS   :: roll engaged ';
    buf.writeln(_s);

    init(); //  calling init and build methods in this class
    build();
    //  code for roll
    //  TODO  testing clay map. Scope;  where to lay:: getClay() - function??
    print('------------------  clay maps ---------------------------------');
    print(clayMapL);
    print('------------------  clay maps ---------------------------------');
    for (var f in clayMapL) {
      Map _m = getClayMap(f);
      print('\n  map/chore::   $f   ------ ');
      _m.forEach((k, v) => print('$k ,$v'));
    }

    //  run #op, for single operation
    op(placardM); //  actually map is not yet used there
    //  loop
    show();
    done();
    //  code here
    print('---  ch roll  done -----');
  }

  ///  individual operations are done here.
  ///  common operation with placard-Map  is in base_lib
  String op(Map<String, String> _pcM) {
    ///NOTE  placardM is not used TODO
    String _retStr;
    // make placard in shape
    ///  calls commonProcess with #placard
    ///  TODO  operation class instance
    ///  TODO  add eventually constructor
    ///  order: #actor #sender #receiver #command #msg
    var chOpClass =
        new GlobalOpClass(name, 'chore', 'rec:test', helloChore, 'all ok');
    //  use buffer somewhere
    StringBuffer _retBuf = new StringBuffer();

    ///  mediate command to common process (in base_lib) with info from chore
    commonProcess(chOpClass, helloChore); //  with actual command

    return _retStr;
  }

  ///  presentation method
  void show() {
    print(buf);
  }

  ///  get
  String rowInfo (){
    String _s = '$name  m: $motto on: $onB off: $offB p: $pauseB d: $doneB ';
    return _s;
  }

  ///  close method
  void done() {
    print('Chore::    $infoS   :: engaged ');
    //  code here
    buf.write('---  Chore buffer output app: done  ---');
    print(buf);
    buf.clear(); //  empty buffer
  }

  ///  for to test global command in #op
  void helloChore() {
    print('   **  hello from command Chore    ***');
  }

  ///  constructor
  CommonChore(this.name, this.infoS);
}

//---------------------------------------------------------------
///  assume that Chore needs outside-activity to organize all-Chore's
///  some elementary: "execute-in-every-user-command-if-flagged" ideas
///  sometimes these X 10 objects are executed in EVERY occasion / keystroke..
///    * * *   so they ARE outside of Chore class  * * *
///  PLAN   small checks, updates, msg:s, notes aso.
///  But only, if marked in   "flow - chart"
void topAll() {
  print('these   W O R K S   are executed in every cycle');
}

/// USAGE:    execution is meant to be avoided.. as long as possible
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
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  print('these are executed in beginning of W O R K  ');

  ///  rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow
  ///  zSignal (signalAble)  makes log / list
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
StringBuffer renderChore() {
  StringBuffer _retBuf;
//TODO  temporary variables for to get this to work
  var _roller;
  var _aLog;
  var _xList;
  var _yChore;
  var _zSignal;

//  var superChore = new SuperChore();
  var ch = new CommonChore('ChoreInRenderChore', 'Testing-Chore');
  print(ch.infoS);

  topAll();
  underAll();
  sideAll();

  startChore(_roller, _aLog, _xList, _yChore, _zSignal);
  doChore();
  endChore();

  print(ch.infoS);
  return _retBuf;
} //----------------------------------------------   end renderChore

//
