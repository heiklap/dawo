// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file.
///
///  ##  dawoHist class
///  * Primary functionality:  Keep historic dev data.
/// * dwv: version:   0.9.7.  3.4.2022.
/// * devState : 25%    in GitHub : yes
///
//  V:  0.2.0  Only Format - DartFormat
//  V:  0.3.0  Modify comments, style and clarity

part of dawo_dev;

///  Keeping historical aso. info about dawo.
///  Just testing: implements, here.
///  Class DawoHist keeps some hist & dev info and statistics of dawo app.
// CAN NOT IMPLEMENT  class DawoHist implements BaseStruct {
class DawoHist {
  ///
  String name = 'dawoHist';

  ///
  List<String> infoL = [
    'Historical and old stuff of dawo for many years.',
    'Version 1.0.0 getting ready in april 2022',
    'Ideas for 2.0.0 modified'
  ];

  ///  time List
  List<String> timeL = ['hst', 'year', 'month', 'week', 'day       12'];

  //area List
  List<String> areaL = ['Adm', 'Resource', 'Staff', 'QRW-QRP', 'Sec'];

  ///  Bugs from gitHub heiklap:dawo
  List<String> bugL = [
    'Control console print for every or certain objects; howTo implement?',
    'ALREADY INITIALIZED BUILD CHORE", in app_chore_play.dart ',
    'Testing DartDevCompiler, In IntelliJ IDEA',
    'Libraries give better information in dartdoc, than "parts". Wanna good documents? ',
    'Direction and purpose of this package. Or just a collection of data. ',
    'dawlib_base s role was unclear; it emptied, to get new content. name: base_lib',
    'Streams must be checked against latest Dart language changes. ',
    'Chore is based on my other package; I am building here smaller and more handy version of it. ',
    'Overall comments missing in many places, functions and methods aso. ',
    'aldente functions have some logical name-not-corresponding-functionality -errors. ',
    '..11',
    '..12',
    '..13',
    '..Last14',
  ];

  ///  motto
  Map<String, String> mottoM = {
    '1': 'Do slow steady work and document it',
    '2': 'Keep pack small, use outside resources',
    '3': 'Clean note TODO Bug try stuff'
  };

  ///  agenda
  Map<String, String> agendaM = {
    'Agenda 1': 'Tighten library, but do keep all the ideas.',
    'Agenda 2': 'Keeping this stuff out of dawoApp',
    'Agenda 3': 'Be inspirative and keep windows open to every direction',
  };

  ///  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  ///  Combination of #LANG words in a sentence.
  String clause = '';

  ///  devMemo: PLAN: Two fields for to better shape outPut stuff in console.
  ///  like:  ":DAWO:HIST:";
  String seal = '';

  ///  or this emblem.
  String emblem = ':dawoHist:';
  // like:  "      ";  3-5-7 empty marks or something visible.
  String indent = '';

  ///  Object that owns this.
  String master = ':dawoApp:';
  //  yes / no   ..  printing now.
  bool _pB = true;

  ///
  StringBuffer buf = StringBuffer();

  ///  4 var to control connectors state, working-condition-state values.
  ///  DONE: This is now a map.
  Map<String, bool> st = {
    'wake': false,
    'work': false,
    'pause': false,
    'done': false,
  };

  ///
  String thisVersion = ''; //  users announce their version of dawo
  ///
  String latestChange = '23.3.2017. th.12.15';

  ///  git messages list
  List<String> gitL = [
    '2022-04-02  0.9.7 hist, hist.box, dev.box  week:BUG:friday.box=>Treaty.auction',
    '2022-04-02  0.9.6  clean, folder: tools, gear :venue:= mill, shower box_serve: Lib:hacker',
    'Fixed: WORD:,hkl, hklTry, dev-note TO MEMO -79x, lib_dev_memos, / NOTE 51x',
    'DO:31.3. => vers 0.9.0 to GH - folder-lib alpha. Folder-lib beta - flow - stock',
    'vers. 0.8.5 to GH  dev renew:aide, envoy  ex/daily_action to class',
    '2022-03-29  vers 0.8.0 in GH  clay lib: 11 class, 16 libs overall now',
    '2022-03-28 GH vers 0.7.0 only in GH.  mission all made mis-library',
    '2022-03-27 vers  0.6.0 only in GH,  corp library, corp_interface.',
    '2022-03-26 dawo_example as class now,  version 0.5.0 in GitHub.',
    '2022-03-25 Modify classes, keyword new away, mark version 0.4.0',
    '2022-03-24 V:  0.3.0  Modify comments, style and clarity',
    '2022-03-23  V:  0.2.0  Only Format - DartFormat',
    '2022-03-16  Null check update to NNBD version 0.1.0',
    '2019-03-18 Version to: 0.0.8, Pub Health suggestions, and formatting recommendations.',
    '2019-03-13 Some small changes > to start new development cycle.',
    '2018-10-07 Deleted bin folder, sync used-packages to my other packages.',
    '',
  ];

  ///  Map to hold development status of this app / version.
  Map<String, String> dawo003 = {
    'devStateNum': '95% to  1.0.0',
    'devSituation': 'Soon to Publish',

    ///  Find, where in my test-folders is THIS  version used?
    'version': '0.9.7',
    //  'version': '0.0.3',
    'published': 'Yes, Pub',

    ///  next-version-info might be useful for my different tests and devMemo:s
    'next version': '0.9.8. ~4.4.2022',
    'author': 'Heikki Lappalainen',
    'devOp': 'Heikki Lappalainen',
    'webPage': 'https://github.com/heiklap/dawo',
    'started': '15.7.2013 ',
    'purpose': 'Education, Learning  '
  }; //     -----     dawo003

  /// Models and sample maps ; for later usage and playing.
  Map<String, String> appMap = {
    'name': 'dawo App',
    'info': 'dartang pub package for education',
    'creator': 'me',
    'version': '0.9.7',
    'active': '0',
    'stopped': '0',
    'paused': '0',
    'userChoise': '-',
    'userChoise': '-',
    'autoChoise': '1'
  }; //     -----     appMap

  /// TODO  teamInno    this map is for testing work-flow routines
  Map<String, String> appPhaseM = {
    'act': 'super:act',
    'dance': 'galop',
    'dRoom': 'dance Rooms',
    'actAsync': 'beta_actions',
    'time': 'Track-time',
    'mill': 'Build Loops',
    'Steward': 'Contro Flow',
    'danceQueue: ': 'yes',
    'initBuild': 'SuperState',
    'superC': 'Interface'
  }; //     -----     appPhaseM

  //
  Map<String, String> libPhaseM = {
    'alpha': '_ _ _ _ _ _ _ _ _ _ ',
    'beta': '_ _ _ _ _ _ _ _ _ _ ',
    'clay': '_ _ _ _ _ _ _ _ _ _ ',
    'corp': '_ _ _ _ _ _ _ _ _ _ ',
    'dev': '_ _ _ _ _ _ _ _ _ _ ',
    'fake': '_ _ _ _ _ _ _ _ _ _ ',
    'gear': '_ _ _ _ _ _ _ _ _ _ ',
    'hacker': '_ _ _ _ _ _ _ _ _ _ ',
    'mis': '_ _ _ _ _ _ _ _ _ _ ',
    'src': '_ _ _ _ _ _ _ _ _ _ ',
    'tools': '_ _ _ _ _ _ _ _ _ _ ',
    'venue': '_ _ _ _ _ _ _ _ _ _ ',
  };

  ///
  Map<String, String> actPhaseM = {
    '1 Start': '_ _ _ _ _ _ _ _ _ _ ',
    '2 Usher': '_ _ _ _ _ _ _ _ _ _ ',
    '3 Actor': '_ _ _ _ _ _ _ _ _ _ ',
    '4 Lib': '_ _ _ _ _ _ _ _ _ _ ',
    '5 Roll': '_ _ _ _ _ _ _ _ _ _ ',
    '6 Act': '_ _ _ _ _ _ _ _ _ _ ',
    '7 SubAct': '_ _ _ _ _ _ _ _ _ _ ',
    '8 Async': '_ _ _ _ _ _ _ _ _ _ ',
    '9 Steward': '_ _ _ _ _ _ _ _ _ _ ',
    '10 GLB': '_ _ _ _ _ _ _ _ _ _ ',
    '11 Brain': '_ _ _ _ _ _ _ _ _ _ ',
    '12 Done': '_ _ _ _ _ _ _ _ _ _ ',
  };

  ///
  List<String> hklTryL = [
    'shower dev-box   final int sW = 210;  Screen width., hklTry: 205',
    '',
    '',
    '',
    '',
    '',
  ];

  ///  Method for setting class field values.
  ///  TODO  ? add parameters ? base class
  void init() {
    buf.writeln(':buf:dawoHist:  init-empty ow-done.');
    print('------------ :dawoHist: init done-------------------------');
  }

  ///  Method for setting class in working condition.
  void build(String _emblem, String _master) {
    buf.writeln(':buf:dawoHist:  build-empty ow-done.');
    print('------------ :dawoHist: build done-------------------------');
  }

  ///  #run-like method, it my have sub-methods; do, run.
  void roll() {
    print('------------ :dawoHist:roll done -------------------------');
  }

  ///  Calling boxServe-class for info.
  void box(String caller) {
    buf.writeln(':dawoHist:box:start: C:$caller 123456789-23456789-23456788');
    print('-->>-->>-- :dawoHist:box:start: C:$caller  -->>-->>-- ');
    //  use: boxServe  OR  create own class here
    //  TODO box  set min-max values
    //  :BOX:SW:  was 190
    //  unused::  final int _sw = 200; //  screen width, changed later =>
    //  row count, was 37,  added to 45
    final int _rc = 43;

    ///
    String boxHeader = ':dawoHist:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
    //  :BUG:  Clear old lists first. ??
    //  :BOX:SW:  was 190
    boxServe.init(_rc, 200, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':dhst:box: ', ':dHst:'); //  :BUG: C: $caller');
    print(':BUG:DEBUG: dawoHist:box is not called * * * ');
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    //  DONE: 2.4.2022  copy layOutDap code for box here
    //  hklTry: NOT USE:  boxLayOutDep
    int r9 = 9;
    int r28 = 28;
    String _rubric = 'layout:rubric';
    boxServe.aHeader(1, 4, '* *  info L * * ');
    boxServe.aBox(2, 4, 3, 30, infoL);

    ///  rubric like: DAWO HIST INFO
    boxServe.aHeader(0, 60, ' :layout:dawoApp: ');
    boxServe.aHeader(1, 60, ' *  $_rubric  *  by :layout:baseStruct:dawoApp:');

    boxServe.aHeader(2, 52, '  *  Motto:  *  ');
    boxServe.aBox(3, 50, 3, 48, tl.mapToFineList(mottoM, 4, 30));

    boxServe.aHeader(7, 52, '    *       agendaM:                     *   ');
    boxServe.aBox(8, 50, 8, 42, tl.mapToFineList(agendaM, 8, 42));

    //  boxServe.aBox(2, 7, 6, 16, tl.mapToListB(_model.st));

    //  TODO  also buffer must catch to inner buf.
    List<String> _bufList = [];
    _bufList.addAll(buf.toString().split('\n'));
    boxServe.aHeader(r9 - 2, 7, '   *   Buffer:   *  ');
    boxServe.aBox(r9 - 1, 6, 28, 38, _bufList);

    //  50- 57,  row  1
    boxServe.aHeader(12, 52, '   *   bugList from gitHub heiklap:dawo *   ');
    boxServe.aBox(13, 50, 16, 55, bugL);

    int r21 = 21;

    boxServe.vertLine(r21, 6, 7); //  time
    boxServe.aHeader(r21, 10, '* Time: *');
    boxServe.aBox(r21 + 1, 8, 5, 12, timeL);

    boxServe.aHeader(r21, 27, '* areas *');
    boxServe.aBox(r21 + 1, 25, 5, 15, areaL);
    boxServe.vertLine(r21, 49, 7); //  area

    boxServe.aHeader(2, 108, '  *     git   update   list  messages  *  ');
    boxServe.aBox(3, 108, 15, 90, gitL);

    ///  hklTry for 1.0.0 version
    boxServe.aHeader(r28, 9, ' * dawo:003  * ');
    boxServe.aBox(r28 + 1, 7, 10, 34, tl.mapToFineList(dawo003, 10, 22));

    boxServe.aHeader(r28, 46, ' *    app:Map    *       ');
    boxServe.aBox(r28 + 1, 45, 10, 43, tl.mapToFineList(appMap, 10, 31));

    boxServe.aHeader(r28, 91, ' *   appPhaseM  * ');
    boxServe.aBox(r28 + 1, 91, 10, 32, tl.mapToFineList(appPhaseM, 12, 16));

    boxServe.aHeader(r28, 130, ' *   v 1.0.0 libPhaseM * ');
    boxServe.aBox(r28 + 1, 126, 12, 32, tl.mapToFineList(libPhaseM, 8, 22));

    boxServe.aHeader(r28, 164, ' *   to v 2. actPhaseM  * ');
    boxServe.aBox(r28 + 1, 163, 12, 32, tl.mapToFineList(actPhaseM, 8, 22));

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    //  unused::  int r9 = 9; //  anchor for row.
    boxServe.show(':box:dHst:', 'print', 0);

    ///  Set boxServe ready for next user: clear data.
    boxServe.done(':box:dHst:');
  } //     -----     box

  ///  Presentation method.
  void show(String action) {
    _pB; //  print-Bool   controls printing
  }
  //  action like: 'print, buf, pause, hello-World!, info:Watch, act:dim'

  ///  Close method.
  void done() {}

  ///  Every important library has it's own flowC function. #Library #Privacy!!
  ///  Calling print/print-to-buffer function from beta.
  ///  Getting local variables; Actor and Buffer right.
  void flowC(String msg, bool p) {
    ///  call flow.fServe with #LOCAL variables
    flow.fServe(':d:Hist:', buf, msg, p);
  } //     -----     flowC

} //  -----  class DawoHist

//
