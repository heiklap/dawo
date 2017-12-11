// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  glb   keeping important everybody-uses variables and constants.
/// * dawo version:  0.0.6.  27.11.2017  -  devState:  10%
/// * GitHub: yes.
/// * State:  schema
//
//  Hist:hkl  19.11.2017  Moved stuff out from beta to make clarity.

library glb;

//  for box_serve:
import 'box_serve.dart';
import '../tools.dart';

///  Global, everybody to use variables and constants.
class GlobalClass {
  // Aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout. Grabbed.
  var signature;
  var output;
  var input;

  ///  5 x 56 logo
  final List<String> dawoLogo = [
    'DDD_____________A________W____________W_________OOO',
    'D___D__________A__A_______W__________W________O______O',
    'D____D________A____A_______W___W____W_________O______O',
    'D___D________A_AAAA_A_______W__W___W__________O______O',
    'DDDD________A________A_______W___W______________OOOO',
  ];
  /*
  'DDD             A        W            W         OOO',
  'D   D          A  A       W          W        O      O',
  'D    D        A    A       W   W    W         O      O',
  'D   D        A AAAA A       W  W   W          O      O',
  'DDDD        A        A       W   W              OOOO',
  */

  List<String> infoL = [
    'glb   keeping important everybody-uses variables and constants.',
    'prSt controls global printing states in every object'
  ];

  ///  HowTo track dawo important things in screen-output.
  List<String> keyWords = [
    '     #dawo objects  -  keywords-2 : find them in :out:put  (=new-idea) ',
    '     IDEA:NEW:   chain - hook - gear  ',
    ':A: -  :an: analyzer  affair  :Ar:=AppRoll  agenda-5  area-21  ask-14  ',
    ':B: - :boxServe:-9    BIND  :BUG:  :DEBUG: ',
    ':C: connector   :con: :corporate: clause-14 :courier: chore   chrs_?',
    ':C: camp-0 !!   code-11 ',
    ':D:3 dawoApp   devBox  :dawolang:analyze:EXTRACTED:  diag  diagonal',
    ':D:3   DB-8    DAY-45?!',
    ':E: -   :effort: eff enc=encode  EQU=equipment-5  (envelope-0)  ',
    ':F: -   FIND  ',
    ':G: -    :glb: = Global   GRANT-3',
    ':H: -   http-5    HTML-9    HINT_?',
    ':I: -  IDEA    INFO_?    idb-0!?',
    ':J: -   JSON    join-18-31     '
    ':K: -',
    ':L: -  LANG~137  learn-19                (lamp-0)  (legend-0) (letter-0)',
    ':M: mission    Mongo-3    ',
    ':N: =  NEXT   NOTE  ',
    ':O: -          (opera-6)          ( oath-0) ',
    ':P: -  PING   peg=screenMark    (plan-24)  ',
    ':Q: -    QUEST: ',
    ':R: Rumba     RULE                                  (ritual-0) ',
    ':S: -   schedule   :scout:Roll say    STREAM  store-1  secret-0 scout-20',
    ':T: -  team*-45     TEST-10  track-7',
    ':U: -  :usher:   user-26',
    ':V: -',
    ':X: -',
    ':Y: -',
    ':Z: -',
    '::',
  ];

  ///  HowTo track dawo important things in screen-output.
  List<String> keyWordsSmall = [
    '     #dawo objects,   keywords-2   less used & promising. ',
    ':a: -  ::  adm  ',
    ':b: - :buf:=buffer     bLib=:OLD:DEPRECATED:   buy-24   sell-7  bus-8',
    ':c:       C: = caller   clay=data  (carry-3) car-33  chat-1   client-12',
    ':d:3    dev    decoded    :demand:   deal-1   devBox-22                ',
    ':e: -  :ex:=example   ',
    ':f: -  :flowServe:    film-0 fire-0   fury-2   ',
    ':g: -   ',
    ':h: -  howTo  hklTry= meTryingSomething    human-2',
    ':i: -  *inno* -12 ',
    ':j: -'
    ':k: -',
    ':l: -   level-2-5     link-0      ',
    ':m:     meet-4    member*-7     myTime-30',
    ':n: = numbr-Grant-Valid  ',
    ':o: -  out_=    (opC-23 ?!)    office-9',
    ':p: -   PLAN:   placardM  pole-3   priority-3   peg=eyeMark',
    ':q: -',
    ':r: = report                      ',
    ':s: - sec  schedule  SOON:   :sh-it-diagL ?? (simulate-2) state-14  ',
    ':t: -    (try-7)    typedef-17   tempo*-2   time-14 task-0  tutor-o     ',
    ':u: -',
    ':v: -     value-effort:in#effort',
    ':w: -     week-9 ',
    ':x: -',
    ':y: -',
    ':z: -',
    '::',
  ];

  List<String> dawoTextOutput = [
     'String rumbaS = rumbaBuf.toString',
     'String dawoAppS = dawoBuf.toString',
     'String missionS = packDawoMission.say.toString',
     'String choreS = packDawoMission.joyChr.buf.toString',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',
     '   ',

  ];

  /*
    String rumbaS = rumbaBuf.toString();  //  void
    String dawoAppS = dawoBuf.toString();
    String missionS = packDawoMission.say.toString();
    String choreS = packDawoMission.joyChr.buf.toString();

   */

  ///  Records changes to states
  List<String> actionL = [];

  ///  For glb:s inner data
  StringBuffer buf = new StringBuffer();

  //  Method saveToGLB from box_serve fills this map.
  Map<String, StringBuffer> boxServeBuffers = {

  };


  var register; //  register of objects that participate in Dawo / glb.
  //  Actor: String actor;  //  too important to be a String
  //  Not used anymore, everybody uses flowC() and local :ACTOR :buf:
  String actor = ':UNKNOWN: - :UNUSED:';

  ///  states. PLAN: many levels of flow-printing control.
  ///  TODO  howTo mediate these to xPrint?
  Map<String, bool> prSt = {
    'flow': false, //  false prevents all "flow" printing via flowServe();
    //  Shorten output 2 screens.
    'buf': false, // TODO   controls bufPrint
    'info': false,
    'help': false,
    'bug': false,
    'test': false,
    'msg': false,
    'dev': false,
    'header': false,
    'footer': false,
    'state': false, //  state
  };

  ///  User dan set print variables like this.
  void setGlbPrint(bool tOrF) {
    for (var x in prSt.keys) {
      prSt[x] = tOrF; //  set it true or false.
    }
  }

  ///  Not much use, #Actor is announced in function parameter.
  void changeActor(String _actor) {
    actor = _actor;
  }

  ///  Minimize / stop console-flow printing.
  void printControl() {}

  ///  Calling boxServe-class for info.
  void box(String caller) {
    buf.writeln(':glb:box:start:  ');
    //  use: boxServe  OR  create own class here
    final int _sw = 140; //  screen width, changed later =>
    final int _rc = 15; //  row count
    //  ???  Keep matrix here on callers side all the time
    List<String> _glbMatrix = new List(_rc);
    String boxHeader = ':glb:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
    boxServe.init(15, 140, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':glb:box:  C: $caller', ':glb:box:');

    boxServe.aHeader(1, 4, '* *  Print-State * * ');
    boxServe.aBox(2, 7, 12, 20, tl.mapToListB(prSt));

    boxServe.aHeader(0, 60, ' *  GLOBAP VARIABLE STATES  *');

    boxServe.aHeader(2, 42, 'Info:');
    boxServe.aBox(2, 50, 2, 70, infoL);

    boxServe.aHeader(6, 30, 'Phases:');
    boxServe.aBox(7, 30, 5, 5, ['Play', 'Test', 'Code', 'Again']);
    boxServe.vertLine(6, 29, 7); //  phases

    boxServe.aHeader(6, 50, '* Plans: *');
    boxServe.aBox(7, 50, 4, 20, ['Plans: ', 'More plans', 'xxxx', 'yyyyy']);
    boxServe.vertLine(6, 49, 7); //   plans

    boxServe.aHeader(6, 80, '* reserved *');
    boxServe.aBox(7, 80, 5, 15, [
      'A',
      'B',
      'C',
      'C',
    ]);

    boxServe.aHeader(6, 100, '* Clients *');
    boxServe.aBox(7, 100, 5, 15, [
      'State',
      'Set',
      'Puf',
      'Print',
    ]);

    boxServe.vertLine(1, 117, 13); //  Up-right edge
    boxServe.vertLine(1, 139, 13); //  Up-right edge
    boxServe.aHeader(1, 120, '* Actions *');

    boxServe.show(boxHeader, 'print');
    boxServe.done(boxHeader);
    print('--<<--<<  boxHeader boxServe  done  --<<--<<--  ');
  }

  //  code
  void showInfo() {
    print('\n ***  no code in :glb:  GlobalClass yet :)  *** \n');
  }
}

GlobalClass glb = new GlobalClass();
