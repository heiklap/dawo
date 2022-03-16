// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Chore for organizing work flow.  version:  0.0.8.  -  13.3.2019.
///  * Sub-ordinate of Mission, with wide operative flow capabilities.
///  devState : 27 %  -   In  GitHub:   yes
///
///  Primary functionality: get notes-list aso data from input/clay and DB.
///  Incoming data (clayIn) comes from customer. coders OR sample aso.
///  Controlling work-flow and processes. Wrapper round of your small piece of
///  code:  Put your actual code inside Chore.  Chore has also outside-class
///  functions.  In normal operation Chore engages #FLUX (In plan phase)
///  100s of times to access: Outer Dawo actions and answers in pervasive
///  roll-mill-say-join-loop where all #LANG references will be resolved.
///
///   ## *chore* became eventually its own, independent package, and it did fly
///   out of dawo 1915, with it's own wings. Here will be small version of it.
///   Chore is again growing big, but with different means.
///
///   hist: hkl  6.5.2014  0.0.1  dawo/lib  "w o r k  flow"  methods for dawo
///
//

///  idea:   Place ALL  W O R K  procedures here.
///  Automatic-  life-cycle / W O R K / messages and rolling.
///  NOTE  chore do not have own named out-buffer

library chore;

import 'effort.dart';
//  import 'equipment.dart';  //  mission handles equipment

import '../alpha.dart';
import '../beta.dart'; //  flowServe() is here.
import '../tools.dart';
import '../src/box_serve.dart'; //  boxServe is here

import '../corp/affair.dart';
import '../corp/connector.dart';
import '../corp/corporate.dart';

import '../dev/dawo_dev.dart';
import 'missions.dart';

import '../src/glb.dart';
import '../clay/clay_roll.dart';

/*  howTo Map increment
https://stackoverflow.com/questions/56943363/dart-map-increment-the-value-of-a-key
extension CustomUpdation on Map<dynamic, int> {
  int increment(dynamic key) {
    return update(key, (value) => ++value, ifAbsent: () => 1);
  }
}

void main() {
  final map = <String, int>{};
  map.increment("foo");
  map.increment("bar");
  map.increment("foo");
  print(map); // {foo: 2, bar: 1}
}
 */


///  using - getters -example
num dawLibWorkReadiness = 94; // for version  0.0.1

///  This is for ALL chores,
StringBuffer choreBuf = new StringBuffer();

bool _pB = false; //  Not printing now.
///  TODO  Temporary hack.
bool pBNotNow = false; //  Not printing now.
int _flowServeCount = 0;

///  Chores that operate in common area, outside Mission class.
List<BlanketChore> choreComL = [];

///  TODO  devNote: ==   #chore, that is always in dawoApp
///  So dawoApp uses chore to maintain it's work-projects.

///   Initializing of chore system. Update dev-class.
///   CalledBy: dawo_app build.
void initChoreSystem() {
  dev.devN
    ..add('Make COMMON  init-module to EVERY  lib part. ?')
    ..add('This could be for NOTES like W O R K s to be done.');
  //  devNote:
  dev.admN.add(':INIT-CHORE: NO: for  big   W O R K -lists.');
  dev.innoN.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.howToN.add(':INIT-CHORE: :CHECK-IN: testing.');
  dev.secN.add(':INIT-CHORE: :CHECK-IN: testing.');
}     //     -----     initChoreSystem

///  Many important dawo classes are extending Alpha class.
class BlanketChore extends BaseStruct {
  String name = 'Blanket Chore class  ';
  String toString() {
    return name;
  }

  String info = 'Chore resolves  W O R K  flow and control ..';
  //  Do not initialize values; just study, what this class got.
  String motto = 'chore handling small jobs as sub-ordinate of mission.';

  ///  Used in function calls to bring-in objects permanent String-values.
  String clause = ''; //  Combination of #LANG words in sentence.

  ///  devNote: PLAN: Three fields for to better shape outPut stuff in console.
  String seal = ''; //   No usage
  String emblem = ''; //  or this emblem.  like:  ":DAWO:APP:";
  String indent = ''; // like:  "      ";  3-5-7 empty marks or something visible.

  ///  Master field is used in boxes to access Master-objects data.
  String master = ''; //  mission, that owns this chore. Like : 'packDawoMission'
  ///  get other same-group chores via master/Mission choreL, or via up-level choreL list.
  var sister; //  Not used in 0.0.7.

  ///  Control and describe Chores state during it's life-cycle.
  Map<String, bool> st = {
    'wake': true,
    'work': false,
    'pause': false,
    'done': false,
  };

  ///  4 var to control connectors state, working-condition-state values.
  ///  howTo Null  hklTry  static Map  or final
  final Map<String, int> extra = {
  //  static Map<String, int> extra = {
    'init': 0,

    ///  NOTE: init-build-roll calls are not yet orderly planned in 0.0.7.
    'build': 0,
    'roll': 0,
    'flux': 0, //  #say flow, aso: bind-bing & 12 others flow.
  };

  ///  Small description of Chore-object used in boxes.
  Map<String, String> agenda = {
    'help': 'Help Mission.',
    'con': 'Connect chores.',
    'msg': 'Send and listen.',
    'bind': 'Bind to activities.',
  };

  ///  Abstract plan of Chore's contacts.
  var circle; //  Other Chores or objects, that this Chore can join.
  void join(circle) {}

  ///  Row data describing work-flow and life-cycle events.
  StringBuffer buf = new StringBuffer();

  //TODO  deliberated error to find error in build usage.
  bool errorInBX = false; // TODO  temporary, to find error

  ///  Serializing objects msg's dawo uses placardM
  ///  Present info for outer process calls.
  Map<String, String> placardM = {
    'actor': 'Chore',
    'sender': 'Chore instance',
    'receiver': 'Other Chores',
    'command': 'Ch-command:',
    'msg': 'Ch-message:',
  };

  ///  Dawo active objects are continuously running #action-loop, where their
  ///  act is checked and evaluated against other users #say actions.
  ///  Answers to say-bind-bing-analyze-camp-schedule-handle-use loop,
  ///  And return values from #Community via #Mill
  ///  These fields correspond to loop-action-loop mill-loop functions.
  Map<String, String> action = {
    ///  When coming to process, give all your info for others to check.
    'aimAndFire': 'Define Audience and send stuff to world.',

    ///  Privilege aso for ?? roll
    'msgRoll': 'SAMPLE: :3 :RollOK :NoErrors :readyNEXT',

    /// #Usher is upper-level worker / handy-man in #Rumba; => send message.
    'msgUsher': 'SAMPLE: :U:favorite :U:ok',

    /// mill messages, to controller of main roll-loop
    'msgMill': 'SAMPLE: :MillDone _MillOK _Mill-oneWaiting',

    /// To spheres where this object is: bind to /  users activities
    'bindTo': ':common :buyRound :MaterialRound :StoreInfo',

    /// This.objects special say, that is used in action loop by this user.say
    /// May be checked by #dawolang => circulate msg via/ from an analyze #LANG
    'say': ':ADD:    ADD:    ADD:',

    ///Message to master, who owns this object
    'master': ':MASTER:Ask    :MASTER:Say    :MASTER:',

    ///Use plan field, if exists, to #SAY in loop => connect to other plans.
    'plan': ':PLAN:    :PLAN:    :PLAN:',

    /// #Connector action in user.con joined
    'conJoin': 'Seeking connector Join log.',

    ///  #Corporate action => camp or affair.
    'affair': ':AFFAIR:get    :AFFAIR:say  ',

    /// Get and handle con answer.
    'conMsg': ':con:answer _ _ _ _ _ _ _ _ _ _ _ _ _',

    /// Talk in Corporate camp system.
    'campSay': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _',

    ///  Camp get answers and act to it.
    'campGet': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',

    /// add / read   effort table; get picture of your capabilities.
    'effort': ':EFF:',

    /// add / read / use  schedule; get your share of #time.
    'schedule': 'Checkd: _ _ _ _ _ _ _ _ _ _ _ _',

    /// add / read / use   get your share of #resources
    'resource': ':RES: _ _ _ _ _ _ _ _ _ _ _ _ _ ',

    /// Equipment:  you need some.
    'equ': ':EQU: _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',

    /// handle ping - send, read, react: direct connection to other users aso.
    'ping': ':PING: _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',

    /// statistics; for records.
    'stats': ':OK:___  :BUSY: ___    Re-Run_ _ _ _ _ ',

    /// leave message; there might be some kind of post-box.
    'tell': ':leavedMsg: _ _ _ _ _ _ _ _ _ ',

    /// roll.control,  flow and log. End-activities of #flux
    'log': ':log: _ _ _ _ _ _ _ _ _ _ _ _ _ _',
  };     //     -----     action

  ///  Value-fields of this Map refer to return-values of operations, that
  ///  outer- and inner-Chore commands, like #flux produce.
  ///  Chore Class and library operations and #answer #say Strings.
  Map<String, String> operations = {
    'BeginInitRoll': '_ _ _ _ _ _ _ _ ',
    'decision': '_ _ _ _ _ _ _ _ ',
    'streams': '_ _ _ _ _ _ _ _ ',
    'popularCom': ':p:OP:_ _ _ _ _ _ _ _ ',
    'popularJoint': ':p:OP:_ _ _ _ _ _ _ _ ',
    'popular': ':p:OP:_ _ _ _ _ _ _ _ ',
    'assign': '_ _ _ _ _ _ _ _ ',
    'com': 'command _ _ _ _ ',
    'pro WTF?': 'process?_ _ _ _ ',
    'chore': '_ _ _ _ _ _ _ _ ',
    '*GRANT*': '*Outer-Commands* ',
    'topGrant': ':tGR:_ _ _ _ _ _ _ _ ',
    'lowGrant': ':lGR:_ _ _ _ _ _ _ _ ',
    'sideGrant': ':GR:_ _ _ _ _ _ _ _ ',
    'startChore': '_ _ _ _ _ _ _ _ ',
    'doChore': '_ _ _ _ _ _ _ _ ',
    'uniteChore': '_ _ _ _ _ _ _ _ ',
    'endChore': '_ _ _ _ _ _ _ _ ',
    'choreEffort': '_ _ _ _ _ _ _ _ ',
    'choreToEffort': '_ _ _ _ _ _ _ _ ',
  };     //     -----     operations

  ///  V:= Value, E:= effort in Chore development
  Map<String, String> plan = {
    '1. V:5 E:6  ': 'Git part-1 dev _ _ _ _ _ _ _',
    '2. V:9 E:9 ': 'Write mill-say-loop Class_ _ _ _ _ _ _',
    '3. V:5 E:5': 'Git part-2 dev _ _ _ _ _ _ _',
    '4. V:6 E:6': 'Make example packDawo_ _ _ _ _ _ _',
    '5. ': 'Something wlse_ _ _ _ _ _ _',
  };     //     -----     plan

  ///  Phases of Chore development
  Map<String, String> phase = {
    'ClassStructure': ' 60% ready _ _ _ _ _ _ _',
    'Inside Functions': '20 %_ _ _ _ _ _ _',
    'Outside Functions': 'Not used 0 % _ _ _ _ _',
    'Slave Functions': 'Connect master _ _ _ _ _',
    'Mil-Loop-say': 'Headers done 5 %_ _ _ _ _ _ _',
  };     //     -----     phase

  ///  Initialize class for ready-to-use: Method for setting class field values.
  void init() {
    _flowC('--> C-init $name  -->---->--', _pB);

    //  howTo NULL  Map
    //  extra['init'] ++;
    //  hklTry NO  extra!['init']! ++;
    //  NO  extra!['init'] ++?;
    //  Map<String, int> extra  'init': 0,
    //  howTo Map:  only 4 properties usable   extra.['init'].
    //  TODO  hkl:  find in tour dartlang
    //  https://stackoverflow.com/questions/56943363/dart-map-increment-the-value-of-a-key
    //  from Punch::
    if(extra.containsKey('init') ) {
      //  TODO howToMap increment
      int _i = 0;
      //  howTo Null Map
      _i = extra['init']!;
      extra['init'] = _i;
      //  extra['init']!++;
    }  //  --  if

    // extra['init'].toInt()++;
    //  extra['init']! ++;
    //  extra['init'] =  33;

    String __name = name.toUpperCase();
    String _name = ':$__name :';
    //  Actor in glb has not any use.
    glb.changeActor(_name);
    _flowC('-->  Chore buffer output initialized  -->---->--', _pB);
    buf.writeln(':ch:buf: init for name: $name done');
    //  Set-fields values done.
    _flowC('<-- ch init done  $name --<----<--', _pB);
  }     //     -----     init

  ///  TODO  Chore gets emblem and master from mission in build. Are they right
  ///  Method for setting class in working condition.
  ///  Usage:  Caller added:
  void build(String _emblem, String _master) {
    _flowC('--> chore $name build  -->---->--', _pB);
    //  print(':BUG:DEBUG:build:chore:build: $name'); ? build 2X?
    //  howTo NULL Map
    //  TODO  away  extra['build']++;
    emblem = _emblem; //  set master and emblem fields.
    master = _master;
    //  TODO  Initialized 2X?  Where?
    if (st['on'] == true) print('\n ALREADY INITIALIZED BUILD CHORE  \n');
    //  print(onB);
    buf.writeln(':ch:buf: chore buid done for: $name  ');
    st['wake'] = true; //  sleep-state ends
    st['work'] = true; //   app is in on
    _flowC('<--  chore build  $name done --<----<-- ', _pB);
  }     //     -----     build

  ///  #run-like method
  ///  If this or one of it's sub-operations conduct #connector-operations,
  ///  it might be annotated in function parameter.
  void roll() {
    _flowC('--> :ch:roll:  $name -->---->--', _pB);
    //  howTo NULL Map++
    //  TODO  Away   extra['roll' ++;
    _flowC(':ch:roll:  $info   :: roll engaged ', _pB);
    print(':ch:roll:  $info   :: roll engaged :TEST:DEBUG:');

    init(); //  Calling init and build methods in this class.
    //  NOTE  Mission also calls this build.
    //  How to get mission emblem here??  out now.  build();
    //  code for roll
    //  TODO  testing clay map. Scope;  where to lay:: getClay() - function??
    //  print('------------ chore  clay maps -------------------------------');
    //  print(clayMapL);
    //  [helsinkiGuide, packDawo, learnDartlang, myMusic, myTime, nationalParks]
    //  print('------------ chore  clay maps printed Names------------------');

    if (pBNotNow) {
      for (var f in clayMapL) {
        Map _m = getClayMap(f);
        print('\n  map/chore::   $f   ------ ');
        _m.forEach((k, v) => print('$k ,$v'));
      }
      print('-------:ch:roll:    chore  clay maps details done ---------');
    } //  --_pB

    ///  Connector: normal procedure when acting with it.
    ///  Connector: join.  placardM mediates necessary info.
    /// This works, even if analyzer is not finding Connector.
    /// TODO  Connector, analyzer do not find, or handle #var dynamic.
    //  Join "clients" / Members to opList. placardM mediates necessary info.
    _flowC('-->>-->>--  :ch:roll: calling :connector:  -->>-->>--', _pB);
    String connectorMsg = ':EVERY chore :MAY :COME :TO :JOIN :TOMORROW :8clock';
    connector.join(name, placardM, connectorMsg, ':Chr:');
    connector.roll();

    //  we have also instance of Action class: decision.

    //  run #op, for single operation
    popular(placardM); //  Actually map is yet not used there.
    //  loop
    buf.writeln(':ch:buf: :chore:rtoll: done for $name ');
    show('no-print, buf, test');
    done();
    //  code here
    _flowC('<-- :ch:roll: $name  done --<----<--', _pB);
  }     //     -----     roll

  ///  TODO  Some idea: s. to adopt stream-like thinking everywhere.
  ///  * * *    in beta, chore and mission  * * *
  ///  Action class from alpha; name, sayM, reasonM.
  ///  Might serve #LANG phrase to reason for made decisions.
  Action decision = new Action();

  ///  Map to collect all Actions.
  Map<String, Map<String, Action>> decisionChainMM  = {};

  ///  ***********************************************************************
  ///  #Word 's for stream-like processes. What 3 words to use?
  ///  chain, procession, queue, order, request, stream, river, flow, rune
  ///  19.10.2017  adapt this structure everywhere, until find better.
  void orderStream() {} //  is not async, just normal wait-a-little-in-queue.
  void chainStream() {} //  real stream, slow answer.
  void fireStream() {} //  NOTE: Should use StreamChannel package.
  ///  ***********************************************************************

  ///  Operations with other Chores in choreComL List.
  ///  Chore might use #connector to communicate with other Chores.
  ///  Chore might send new material to it's substance in #connecctor.
  popularCom() {}

  ///  Second version of above
  ///  Might unite with other chores in special activities.
  void popularJoint() {}

  ///  Individual Chore's connector-operations are done here.
  String popular(Map<String, String> _pcM) {
    _flowC('-->  ch roll=>:popular:  $name -->---->', _pB);

    ///  NOTE  placardM is not used.  TODO
    String _retStr = '';
    print('-->>-->>--  :Ch:popular: calling :connector:  -->>-->>--');
    String connectorMsg = ':EVERY chore :MAY :COME :TO :JOIN :TOMORROW :8clock';

    ///  new parameter name; do we get it to right chore name?
    connector.join(name, placardM, connectorMsg, ':Ch:popular:');
    connector.roll();

    ///  Make placard in shape.
    ///  TODO  operation class instance
    ///  order: #actor #sender #receiver #command #msg
    var chPopularClass =
        new Affair(name, 'chore', 'rec:test', 'assignComProChore', 'all ok');
    //  use buffer somewhere
    StringBuffer _retBuf = new StringBuffer();
    _retBuf.writeln('_retBuf in chore-popular method is ready...');

    ///  TODO  Mediate clay-stuff itemL to Process
    ///  With actual command:
    ///  Add placardM to parameters
    _retBuf.write(corporate.process(
        ':Ch:popular:', chPopularClass, placardM, assignComProChore));
    print('\n ---------- :chore:popular: and  process  ----------------------');
    print(_retBuf);

    print('------------ :chore:popular: and  process  done  -------------- \n');
    buf.writeln(':ch:buf: :popular: for chore: $name  done');
    _flowC('<-- ch roll-popular: $name  done <----<--', _pB);
    return _retStr;
  }     //     -----     popular

  ///  Usual presentation method.
  ///  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'
  void show(String action) {
    _flowC('--> ch show:  $name -->---->--', _pB);
    //  print(buf);
    ///  :TEST: :glb:ifPrint:  Is false: so should not print buf.
    ///  howTo NULL Map  OK,  add !
    if (glb.prSt['buf']!) {
      print('bbbbbbbbbb chore.show  choreBuf bbbbbbbbbbbbbbbbbbbbbbbbbbb');
      print(glb.prSt['buf']); //  true or false
      print(choreBuf);
      print('bbbbbbbbbb chore.show  choreBuf done bbbbbbbbbbbbbbbbbbbbbb');
    }
    buf.writeln(':ch:buf: :show: done for chore: $name  ');
    _flowC('<-- ch show: $name  done --<----<--', _pB);
  }     //     -----     phase

  ///  Report of chore.
  List<String> reportList(String caller) {
    String rowInfoS = rowInfo();
    String _s1 = '** __________________ choreReport _______________________';
    String _s2 = '** Name:  $name     C:  $caller';
    String _s3 = '** $info';
    String _s4 = '** $motto';
    String _s5 = '** Master:   $master  Emblem: $emblem';
    String _s6 = '** st: $st.toString';
    String _s7 = '** $rowInfoS';
    String _s8 = '** ';
    String _s9 = '** ';
    String _s10 = '** ______________________________________________________';

    ///  fix2.0.0
    List<String> _l = [_s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9, _s10];
    buf.writeln(':ch:buf: :report: done for chore:  $name  ');
    return _l;
  }     //     -----     reprtList

  ///  Console present Map and List aso. data in screen-matrix.
  void box(String caller) {
    buf.writeln(':ch:buf:  box called for chore:  $name ');
    int bufLength = buf.length;
    int choreBufLength = choreBuf.length;

    ///  Give shapes for screen matrix.
    ///  :BOX:WAS:  190
    boxServe.init(42, 198, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':chr:box: ', ':chr:box:'); //  :BUG: C: $caller');
    ///  Place String-header in wanted place.
    boxServe.aHeader(1, 5, 'Name: $name');

    boxServe.aHeader(2, 5, 'Master: $master');

    boxServe.aHeader(4, 5, '* chore$name  buf  *');
    //  boxServe.aBox(4, 5, 39, 33, tl.bufToList(buf));
    //  TODO  We have 2 buffers!!
    //  boxServe.aBox(4, 5, 39, 33, buf.toString().split('\n'));
    boxServe.aBox(5, 5, 39, 33, buf.toString().split('\n'));

    boxServe.aHeader(1, 80, 'Info: $info');
    boxServe.aHeader(2, 80, 'Motto: $motto');

    boxServe.aHeader(1, 45, 'bufLength:  $bufLength  ');
    boxServe.aHeader(2, 45, 'chrBufL:  $choreBufLength  ');
    boxServe.aHeader(2, 60, 'count:  $_flowServeCount ');

    boxServe.aHeader(4, 45, '* States * ');
    boxServe.aBox(5, 45, 6, 16, tl.mapToListB(st));

    boxServe.aHeader(4, 61, '*  Extra * ');
    boxServe.aBox(5, 61, 6, 16, tl.mapToListI(extra));

    boxServe.aHeader(10, 44, ' CHORE placard');
    boxServe.aBox(11, 44, 6, 14, tl.mapToFineList(placardM, 2, 12));

    boxServe.aHeader(10, 66, ' * Master    $master     say * ');
    //  Get Map-say from master:  missionL[$master].say
    //  howTo NULL Map   say    add !
    boxServe.aBox(11, 62, 9, 52, tl.mapToFineList(missionM[master]!.say, 6, 46));

    //  boxServe.aHeader(20, 44, '* Chore Operations *');
    boxServe.aBox(20, 45, 22, 53, tl.mapToFineList(operations, 13, 40));

    boxServe.aHeader(4, 83, ' * Agenda: con Msg: :bind: * ');
    boxServe.aBox(5, 83, 6, 27, tl.mapToFineList(agenda, 5, 20));

    boxServe.aHeader(
        4, 124, ' :flux:  Outer Dawo actions and answers in roll-mill-loop ');
    boxServe.aBox(5, 119, 22, 70, tl.mapToFineList(action, 10, 60));

    boxServe.vertLine(32, 107, 7); //  plans aso.
    boxServe.aHeader(32, 111, ' *  Chore  Plans:  roadMap   *  ');
    boxServe.aBox(33, 107, 6, 39, tl.mapToFineList(plan, 12, 27));

    boxServe.vertLine(32, 150, 7); //   phase
    boxServe.aHeader(32, 154, '  *     Chore     Phases   *     ');
    boxServe.aBox(33, 150, 6, 40, tl.mapToFineList(phase, 18, 20));

    ///  Present it on screen and save to glb-buffer.
    boxServe.show(':box:Chr:', 'print', 0);

    ///  Set boxServe ready for next user: clear data.
    boxServe.done(':box:Chr:');
  }     //     -----     box

  ///  Get info of Chore in one row.
  String rowInfo() {
    //  st::  'wake'; false, 'work' false',  'pause': true, 'done': false
    String _s = '$name  m: $motto $st.toString ';
    buf.writeln(':ch:buf: :rowInfo: called for chore: $name');
    return _s;
  }     //     -----     rowInfo

  ///  close-method. This is not: terminate.
  void done() {
    _flowC('<-- Chore buffer $name output app: done  --<----<--', _pB);
    _flowC('Chore::    $info   :: engaged ', _pB);
    //  code here
    //  Too many times.  print(choreBuf);
    //  choreBuf.clear(); //
    buf.writeln(':ch:buf:  done called for chore:  $name');

    _flowC('<-- chore.done    ok   --<----<--', _pB);
  }     //     -----     done

  ///  PLAN: For to share stuff with  :affair: command in #operations
  ///  :connector:  to mediate to :affair: and do :bind:
  ///  TODO  Name: #Assign  This should have same name in all libraries?
  String assignComProChore() {
    _flowC('   **  resource sharer assignChore > Process    ***', _pB);
    buf.writeln(':ch:buf:  :assign:comPro called for $name  ');
    return ('   **  resource sharer assignChore > Process   ***');
  }     //     -----     assignComProChore

  ///  Calling print/print-to-buffer function from beta.
  ///  FlowCall : Getting local variables; Actor and Buffer right.
  ///  Location of: _flowC inside OR outside of class?
  ///  Here we record no-important messages to _choreBuf
  void _flowC(String msg, bool p) {
    ///  Call flowServe with #LOCAL variables.
    //  Not here, but in flowServe : _flowServeCount ++;

    //change it for testing   flowServe(':CH:', choreBuf, msg, p);
    flowServe(':CH:', buf, msg, p);
  }     //     -----     _flowC

  ///  constructor; master is mandatory for Chore to use masters fields.
  ///   was error:  decisionChainMM must be initialized  OK
  BlanketChore(this.name, this.master, this.info);
} //  -----  BlanketChore class

///  * * * *   Functions that are outside of chore class    * * * *
///  * * * *   chore-instances will use these actively(?)   * * * *

///  Calling print/print-to-buffer function from beta.
///  Getting local variables; Actor and Buffer right.
///  Location of: _flowC inside OR outside of class?
///  Here we record no-important messages to _choreBuf
///  Started to use / renamed this to ...Outer
void _flowCOuter(String msg, bool p) {
  ///  Call flowServe with #LOCAL variables.
  _flowServeCount++;

  //change it for testing   flowServe(':CH:', choreBuf, msg, p);
  flowServe(':CH:', choreBuf, msg, p);
}     //     -----     _flowCOuter

//---------------------------------------------------------------
///  #QUEST: Construct functions outside of Chore and use them for something.
///  Assume that Chore needs outside-activity to organize all-Chore's.
///  Outer functions return a String value to Map<String, String> operations.
///  Some elementary: "execute-in-every-user-command-if-flagged" ideas.
///  Sometimes these 11 functions are executed in EVERY occasion / keystroke..
///    * * *   so they ARE outside of Chore class  * * *
///  PLAN   small checks, updates, msg:s, notes aso.
///  But only, if marked in   "flow - chart"
///  NOTE: ?  _flowCOuter DO NOT HAVE ACCESS TO inside-class-name variable.'
///  So it must be given in parameter. lol
///  But when using these from outside of Chore, it is different story.
//

///  Handling outer-functions feedback and saving it to
///  =>  Map<String, String> operations value-field.
///  To be seen: How complicated is to handle stuff outside class.
void handler(String _key, _inS, BlanketChore chr, var _act) {
  ///  TODO  no idea what this is doing, so just change it.
  //  announce value field changed.
  //  so: ':tGR:_ _ _ _ _ _ _ _ ' changed to:  ':tGR: OK _ _ _ _ _ '
  //  chr.operations[_key].padRight(7, '  $_inS');     //= 'Changed:  $_inS';
  // howTo NULL + can not be;  receiver can be NULL
  //  OK  chr.operations[_key] = chr.operations[_key]! + '  $_inS';
  chr.operations[_key] = chr.operations[_key]! + '  $_inS';
  //  should do _act
}     //     -----     handler

///  Function named like this, should act with highest priority.
void topGrant(BlanketChore chr, var _act) {
  String _result = 'Act:TG';
  //  code to get wanted _result
  handler('topGrant', _result, chr, _act);
  _flowCOuter('these   W O R K S   are executed in every cycle', _pB);
}

/// USAGE:    Execution of EVENT is meant to be slowed-up.. as long as possible.
void lowGrant(BlanketChore chr, var _act) {
  ///  String to be returned for Chore.box.
  String _result = 'Act: LowG';
  //  code to get wanted _result
  handler('lowGrant', _result, chr, _act);
  _flowCOuter('FLOW:lowGrant:  These are executed ONLY in last occasion', _pB);
}

///  USAGE PLAN:    Run occasionally / timely, in sidebar.
void sideGrant(BlanketChore chr, var _act) {
  String _result = 'ActSideG';
  //  code to get wanted _result
  handler('sideGrant', _result, chr, _act);
  _flowCOuter('FLOW:SideGrant:  executed occasionally in sidebar..', _pB);
}

//------------------------------------------------------------------------
///  flow of chore might be like this... Functions to execute W O R K   flow
void startChore(var roller, var aLog, var xList, var yChore, var zSignal) {
  _flowCOuter('--> these are executed in beginning of W O R K  ', _pB);

  ///  ABLE: rollAble and signalAble are separate properties of chore.
  ///  roller(rollAble)   takes care of workFlow.
  ///  zSignal (signalAble)  makes log / list
  ///  yChore is actual  w o r k   code
}

///  main   W O R K   routines
void doChore(BlanketChore chr, var _act) {
  _flowCOuter(' :FLOW:doChore -->  Actual  W O R K   code here...', _pB);
}

/// United chore   W O R K   routines.
void uniteChore(BlanketChore chr, var _act) {
  _flowCOuter(
      ' :FLOW:uniteChore -->  Combined Chore  W O R K   code here...', _pB);
}

///   routines, after W O R K   is done
void endChore(BlanketChore chr, var _act) {
  _flowCOuter('<-- endChore  execution scheduled, when  WORK is done', _pB);
}

///  Quick hack to run effort from test aso files.
///  This is only access to effort.
///  TODO  dd parameters:  BlanketChore chr, var _act
void choreEffort(String caller) {
  //  Add ability to choose between user-data in effort.
  eff.build(':chEf:');
  eff.makeAllLists(':chEf:');

  eff.getDiagonalList(':chEf:');
  eff.showUserDiagonal(':chEf:');

  //  TODO  New
  eff.getRecommendation(':choreEffort:');
}

///  QuickHack
///  TODO  add parameters:  BlanketChore chr, var _act
void choreToEffortUserJson(String caller) {
  effortCallingUserJson(':chore::callRenderUserJson:');
}

///  example / testing chore ----------------------------------------------
///  Should show use-case of all Chore inner and outer methods.
StringBuffer renderChore() {
  print('-->-->--  renderChore  :roll:box:  -->-->--');
  StringBuffer _retBuf = new StringBuffer();
//TODO  temporary variables for to get this to work
  String _actS = 'Action String';
  var _roller;
  var _aLog;
  var _xList;
  var _yChore;
  var _zSignal;

//  var superChore = new SuperChore();
  var ch =
      new BlanketChore('ChoreInRenderChore', 'renderChore', 'Testing-Chore');
  ch.master = 'PackDawoMission';
  print(ch.info);
  print(ch.master);

  topGrant(ch, _actS);
  lowGrant(ch, _actS);
  sideGrant(ch, _actS);

  startChore(_roller, _aLog, _xList, _yChore, _zSignal);
  doChore(ch, _actS);
  uniteChore(ch, _actS);
  endChore(ch, _actS);

  //  Enlisted class
  eff.makeAllLists(':render:Chore:');

  print(ch.info);
  //  Box is done like this:
  print('-->-->--  joyChore;roll:box: myTimeMission   -->-->--');
  print(myTimeMission.joyChr.master);

  /// TODO   Should get init and build bool values right
  myTimeMission.joyChr.init(); //  NO!!  Must it be master??
  myTimeMission.joyChr.roll();
  myTimeMission.joyChr.master = 'MyTimeMission';
  myTimeMission.joyChr.box(':choreRender:call:joyChr:box:');

  print('-->-->--   chore  ch.box   ;roll:box:  -->-->--');

  //  So we make here:
  ch.roll();
  ch.box(':dawoExample:call:joyChr:box:');

  print('--<--<--  renderChore  :roll:box:  done --<--<--');
  return _retBuf;
} //----------------------------------------------   end renderChore

//
