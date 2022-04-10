//  Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file.
//
///  ##  glb   keeping important everybody-uses variables and constants.
/// * dwv: version:   1.0.0.  10.4.2022.  -  devState:  13%
/// * GitHub: yes.
/// * State:  schema
//

//  library glb;
part of 'gear.dart';



///  Global, everybody to use variables and constants.
class GlobalClass {
  // Aka, you have some property StringSink output. All of your code writes
  // to that - output?.writeln(“some message”). Depending on the context,
  // output = new StringBuffer() or output = stdout. Grabbed.
  var signature;
  ///
  var output;
  ///
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
  ///
  List<String> infoL = [
    'glb   keeping important everybody-uses variables and constants.',
    'prSt controls global printing states in every object'
  ];

  ///  WORD: HowTo track dawo important things in screen-output.
  List<String> keyWords = [
    '     #dawo objects  -  keywords-1 : find them in :out:put  (=new-idea) ',
    '     IDEA:NEW:   chain - hook - gear  ',
    ':A: -  :an: analyzer  affair  :Ar:=AppRoll  agenda-5  area-21  ask-14  ',
    ':B:-13 Build-67 - :boxServe:-9    BIND  :BUG:  :DEBUG: ',
    ':C: connector   :con: :corporate: clause-14 :courier: chore   chrs_?',
    ':C: camp-0 !!  Channel  code-11   :cib:=CallerInBox  coma',
    ':D:3 dawoApp   devBox  :dawolang:analyze:EXTRACTED:  diag  diagonal',
    ':D:3   DB-8    DAY-45?!  !?:done:0   doctor-o ',
    ':E: -   :effort: eff enc=encode  EQU=equipment-5  (envelope-0)  ',
    ':F: -   FIND  ',
    ':G: -    :glb: = Global   GRANT-3',
    ':H: -   http-5    HTML-9    HINT_?   hire  ',
    ':I: -  IDEA    INFO_?    idb-0!?',
    ':J: -   JSON    join-18-31     '
        ':K: -',
    ':L: -  LANG~137  learn-19                (lamp-0)  (legend-0) (letter-0)',
    ':M:64-mission    Mongo-3   memo ',
    ':N:         =  NEXT   memo-  ',
    ':O: -          (opera-6)          ( oath-0) ',
    ':P: -  PING-13   p e g=screenMark    (plan-24)   pool-0 :promo: PDCA ',
    ':P2: -  POC-proof of concept.    ',
    ':Q: -    QUEST-13 ',
    ':R:-27  Rumba-8-54     RULE-13                                  (ritual-0) ',
    ':S:-0  -   schedule-43  scout-27 :scout:Roll say  STREAM  store-4  secret-0 ',
    ':T: -!!   task-0!!   team*-45     TEST-10  track-7  time:29   TODO-1 ',
    ':U: -  :usher:   user-26',
    ':V: -             vigilant-new   ',
    ':W: -        WTF-2  ',
    ':X: -',
    ':Y: -',
    ':Z: -',
    '::',
  ];

  ///  WORD: HowTo track dawo important things in screen-output.
  List<String> keyWordsSmall = [
    '     #dawo objects,   keywords-2   less used & promising. ',
    ':a: -  ::  adm :ad: :advertising: ',
    ':b: - :buf:=buffer     bLib=:OLD:DEPRECATED:   buy-24   sell-7  bus-8',
    ':b: -                      blend-0   ',
    ':c:       C: = caller   clay=data  (carry-3) car-33  chat-1   client-12',
    ':d:3    dev    decoded    :demand:   deal-1   devBox-22                ',
    ':e: -  :ex:=example   eye-0/2  #:ERP: Enterprise Resource Planning ',
    ':f: -  :flow.fServe:    film-0 fire-0   fury-2   ',
    ':g: -   ',
    ':h: -  howTo  hklTry= meTryingSomething    human-2',
    ':i: -  *inno* -12 ',
    ':j: -'
        ':k: -',
    ':l: -   level-2-5     link-0   :LAB:-0   ',
    ':m:     meet-4    member*-7 merge-0  mix-0    myTime-30',
    ':n: = numbr-Grant-Valid  ',
    ':o: -  out_=    (opC-23 ?!)    office-9',
    ':p: -   PLAN:   placardM  plug-0  pole-3   priority-3   p e g=eyeMark   peek  poke',
    ':q: -',
    ':r: = report                 round-13   rural   ',
    ':s: - sec  schedule  SOON:   :sh-it-diagL ?? (simulate-2) state-14  ',
    ':t: -   tale  (try-7)    typedef-17   tempo*-2   time-14  tutor-o     ',
    ':u: -       unite-6      unify-0',
    ':v: -     value-effort:in#effort',
    ':w: -     week-9 ',
    ':x: -',
    ':y: -',
    ':z: -',
    '::',
  ];

  ///  usage:  not used
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

  ///  Records changes to states, usage:  not used
  List<String> actionL = [];

  ///  For glb:s inner data
  StringBuffer buf = StringBuffer();

  ///  :box:statistics: Method saveToGLB from box_serve fills this map.
  Map<String, StringBuffer> boxServeBuffers = {};

  //  register of objects that participate in Dawo / glb. usage:  not used
  var register;

  //  Actor: String actor;
  //  too important to be a String
  //  Not used anymore, everybody uses flowC() and local :ACTOR :buf:
  String actor = ':UNKNOWN: - :UNUSED:';

  ///  states. PLAN: many levels of flow-printing control.
  ///  DO:print  howTo mediate these to xPrint?
  Map<String, bool> prSt = {
    'flow': false, //  false prevents all "flow" printing via flow.fServe();
    //  Shorten output 2 screens.
    'buf': false, // DO:print   controls bufPrint
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

  ///  :box:statistics: in glb
  void boxStatsShow(String caller) {
    //  target is:    Map<String, StringBuffer>
    List<String> _lL = [];

    print('> > >  :box:statistics:  :glb:boxServe:buf: length and names  > >');
    int bLength = glb.boxServeBuffers.length;
    String _bLS  = bLength.toString();
    print('caller: $caller    :box:count:   $_bLS ');
    print(glb.boxServeBuffers.length);
    for (var _zStr in glb.boxServeBuffers.keys) {
      //
      String _orderNS = '';
      String _lengthS = '';
      print(glb.boxServeBuffers[_zStr]?.length);
      int i = 0;
      i = glb.boxServeBuffers[_zStr]!.length;
      _lengthS = i.toString();
      //  :BUG:  howTo   i = glb.boxServeBuffers[_zStr]?.length;
      _orderNS = _zStr.toString();
      //  :BUG:   howTo   _lengthS = glb.boxServeBuffers[_zStr]?.length.toString();
      print(_zStr);
      _lL.add(':buf:N: $_orderNS   Length: $_lengthS ');
    }  //  for
    _lL.forEach(print);
    tl.listShowNeat(_lL, ':box:tatistics:', ':glb:box:stats:Show:');
    /*    Output like:
    :buf:No: :glb:box: C: :d:ex:1   Lnegth: 2171
:buf:No: :con:box: :R:.do:2   Lnegth: 8414
:buf:No: :da:box:3   Lnegth: 7419
:buf:No: :da:box:4   Lnegth: 7419
:buf:No: :chr:box:5   Lnegth: 8525
:buf:No: :con:box: :d:ex:6   Lnegth: 8414
:buf:No: :dHst:7   Lnegth: 8699
:buf:No: :chr:box:8   Lnegth: 8525
:buf:No: :da:box:9   Lnegth: 7419
< < <   :box:statistics:  :glb:boxServe:buf: length and names < <

     */

    print('< < <   :box:statistics:  :glb:boxServe:buf: length and names < <');
    //  glb.boxServeBuffers.keys.forEach(print);
  }      //     -----     boxStatsShow

  ///
  void devBoxStatsShow(String _caller) {
    tl.listShowNeat(devBoxStatL, ':devBoxStats', _caller);
  }

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

  ///  Minimize / stop console-flow printing.  usage:  not used
  void printControl() {}

  ///  Calling boxServe-class for info.
  void box(String caller) {
    buf.writeln(':glb:box:start:  ');
    //  use: boxServe  OR  create own class here
    //  unused::  final int _sw = 140; //  screen width, changed later =>
    // unused::  final int _rc = 15; //  row count
    //  ???  Keep matrix here on callers side all the time
    //  unused::  List<String> _glbMatrix = new List(_rc);
    String boxHeader = ':glb:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
    boxServe.init(15, 140, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':glb:box:', ':glb:box: C: $caller');

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

    boxServe.show(boxHeader, 'print', 28);
    boxServe.done(boxHeader);
    print('--<<--<<  boxHeader boxServe  done  --<<--<<--  ');
  }     //     -----     box

  //  code:5
  void showInfo() {
    print('\n ***  no code in :glb:  GlobalClass yet :)  *** \n');
  }
}     //     -----     class GlobalClass

GlobalClass glb = GlobalClass();
