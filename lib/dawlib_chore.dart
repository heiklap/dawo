///  ##  Chore for organizing work flow.  dawo version:  0.0.3  25.9.2017
///  Ready-state:   0%  for 0.0.4 In  GitHub:   yes   updated  22.04.2015
///
///  Primary functionality: get notes-list aso data from input/clay
///  incoming data (clayIn) comes from customer. coders OR sample aso.
///  Controlling work-flow and processes. Wrapper round of your small piece of
///  code:  Put your actual code inside Chore.
///
///   ## *chore* became eventually its own, independent package, and it did fly
///   out of dawo with it's own wings. Here will be small version of it.
///
///  hkl  6.5.2014  0.0.1  dawo/lib   Common   "w o r k  flow"  methods for dawo
///
///
//  TODO  chore; dawo can't use chore package. Make a simple plugin. But how?

///  idea:   Place ALL common  W O R K  procedures here.
///  Automatic-  life-cycle / W O R K / messages and rolling.

//  TODO  chore  Build simple plugin or usage-case for chore.
//  TODO  chore  NEXT, make  Chr -class.??

library dawlib_chore;

import 'base_struct.dart';
import 'base_lib.dart';
import 'dawo_dev.dart';
import 'clay/clay_roll.dart';

///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

///  Buffer also outside class, for testing and adding visibility.
var choreBuf = new StringBuffer();
bool pB = false; //  Not printing now.

///  Generic List to keep all Chores.
List<CommonChore> choreL = [];

///  TODO  devNote: ==   #chore, that is always in dawoApp
///  So dawoApp uses chore to maintain it's work-projects.

///   Initializing of chore system. Update dev-class.
///   CalledBy: dawo_app build.
void initChoreSystem() {
  dev.devNotes
    ..add('Make COMMON  init-module to EVERY  lib part. ?')
    ..add('This could be for NOTES like W O R K s to be done.');
  //  devNote:
  dev.admNotes.add(':INIT-CHORE: NO: for  big   W O R K -lists.');
  dev.innoNotes.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.howToNotes.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.secNotes.add(':INIT-CHORE: :CHECK-IN: testing.');
}

///  Every important dawo class is extending BaseStruct class.
class CommonChore extends BaseStruct {
  String name = 'Common Chore class  ';
  String infoS = 'Chore resolves  W O R K  flow and control ..';
  //  Do not initialize values; just study, what this class got.
  String motto = 'chore handling small jobs';

  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal; //  like:  ":DAWO-APP:";
  String indent; // like:  "      ";  3-5-7 empty marks or something visible.

  StringBuffer buf = new StringBuffer();

  ///  Controlling chores state, working-condition-state values.
  bool offB;
  bool onB;
  bool pauseB;
  bool doneB;

  ///  Testing placardM inside chore.
  Map<String, String> placardM = {
    'actor': 'Chore',
    'sender': 'Chore instance',
    'receiver': '',
    'command': 'Ch-cmd:',
    'msg': 'Ch-msg:',
  };

  ///  Method for setting class field values.
  void init() {
    buf.writeln('-->---->--  init  -->---->--');
    String __name = name.toUpperCase();
    String _name = ':$__name :';
    glb.changeActor(_name);
    buf.writeln('-->---->--  Chore buffer output initialized  -->---->--');

    //  Set-fields values done.
    buf.writeln('   --<----<--  init done  --<----<--');
  }

  ///  Method for setting class in working condition.
  void build() {
    //  TODO  Chore Build Too much printing
    String msg = '-->---->--  chore $name build  -->---->--';
    flowC(msg, pB); //  Call to print / buffer function.

    offB = false; //  off-state ends
    onB = true; //   app is in on
    buf.writeln('build for chore:  $name  : done');
    flowC('     --<----<--    chore build  done --<----<-- \n', pB);
  }

  ///  #run-like method
  ///  If this or one of it's sub-operations conduct #connector-operations,
  ///  it might be annotated in function parameter.
  void roll() {
    flowC('-->---->--  ch roll  -->---->--', pB);
    String _s = 'Chore::    $infoS   :: roll engaged ';
    buf.writeln(_s);

    init(); //  Calling init and build methods in this class.
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
    op(placardM); //  Actually map is yet not used there.
    //  loop
    show();
    done();
    //  code here
    flowC('     --<----<--  ch roll  done --<----<--', pB);
  }

  ///  Individual operations are done here.
  ///  Common operation with placard-Map  is in base_lib.
  String op(Map<String, String> _pcM) {
    ///  NOTE  placardM is not used.  TODO
    String _retStr;

    ///  Make placard in shape.
    ///  calls commonProcess with #placard
    ///  TODO  operation class instance
    ///  TODO  Constructor: add eventually constructor
    ///  order: #actor #sender #receiver #command #msg
    var chOpClass =
        new GlobalOpClass(name, 'chore', 'rec:test', helloChore, 'all ok');
    //  use buffer somewhere
    StringBuffer _retBuf = new StringBuffer();
    _retBuf.writeln('_retBuf in op method is ready...');

    ///  Mediate command to common process (in base_lib) with info from chore.
    commonProcess(chOpClass, helloChore); //  with actual command

    return _retStr;
  }

  ///  Usual presentation method.
  void show() {
    print(buf);
  }

  ///  get
  String rowInfo() {
    String _s = '$name  m: $motto on: $onB off: $offB p: $pauseB d: $doneB ';
    return _s;
  }

  ///  close method
  void done() {
    print('Chore::    $infoS   :: engaged ');
    //  code here
    buf.write('--<----<--  Chore buffer output app: done  --<----<--');
    print(buf);
    buf.clear(); //  empty
    flowC('     --<----<--  chore.done    ok   --<----<--', false);
  }

  ///  For to test global command in #op
  void helloChore() {
    print('   **  hello from command Chore    ***');
  }

  ///  constructor
  CommonChore(this.name, this.infoS);
}

///  Calling print/print-to-buffer method.
///  Getting local variables; Actor and Buffer right.
void flowC(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.
  flowServe(':CHORE:', outBr, msg, p);
}

//---------------------------------------------------------------
///  Assume that Chore needs outside-activity to organize all-Chore's.
///  Some elementary: "execute-in-every-user-command-if-flagged" ideas.
///  Sometimes these X 10 objects are executed in EVERY occasion / keystroke..
///    * * *   so they ARE outside of Chore class  * * *
///  PLAN   small checks, updates, msg:s, notes aso.
///  But only, if marked in   "flow - chart"
void topAll() {
  flowC('these   W O R K S   are executed in every cycle', pB);
}

/// USAGE:    Execution is meant to be avoided.. as long as possible.
void underAll() {
  // Name: not nice name..
  flowC('These are executed ONLY in last occasion', pB);
}

///  USAGE:    Run occasionally / timely, in sidebar.
void sideAll() {
  flowC('executed occasionally in sidebar..', pB);
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  print(' -->---->--  these are executed in beginning of W O R K  ');

  ///  ABLE: rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow.
  ///  zSignal (signalAble)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore() {
  print(' -->---->--  Actual  W O R K   code here...');
}

///   routines, after W O R K   is done
void endChore() {
  print('     --<----<--   execution scheduled, when   W O R K   is done');
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
