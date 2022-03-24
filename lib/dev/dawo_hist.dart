// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawoHist class
///  Primary functionality:  Keep historic dev data.
/// * dawo version:   0.3.0.  23.3.2022.
/// * devState : 25%    in GitHub : yes
/// hist>  9.1.2018  Separated from dawoApp.
//  V:  0.2.0  Only Format - DartFormat
//  V:  0.3.0  Modify comments, style and clarity

part of dawo_dev.dart;

///  Keeping historical aso. info about dawo.
///  Just testing: implements, here.
class DawoHist implements BaseStruct {
  ///
  String name = 'dawoHist';
  String info = 'Historical and old stuff of dawo.';
  Map<String, String> say = {};
  ///
  String motto = 'Keeping this stuff out of dawoApp';

  //  Like: ":ALLOW X :LOW Y :ROLE Z :GOAL XX :OPEN YY
  String clause = ''; //  Combination of #LANG words in sentence.
  ///  devNote: PLAN: Two fields for to better shape outPut stuff in console.
  String seal = ''; //  like:  ":DAWO:HIST:";
  String emblem = ':dawoHist:'; //  or this emblem.
  // like:  "      ";  3-5-7 empty marks or something visible.
  String indent = '';
  String master = ':dawoApp:'; //  Object that owns this.

  bool _pB = true; //  yes / no   ..  printing now.
  StringBuffer buf = new StringBuffer();

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

  ///  Map to hold development status of this app / version.
  Map<String, String> dawo003 = {
    'devStateNum': '99% to  0.0.3',
    'devSituation': 'Ready to Publish',

    ///  Find, where in my test-folders is THIS  version used?
    'version': '0.2.0',
    //  'version': '0.0.3',
    'published': 'Yes, Pub',

    ///  next-version-info might be useful for my different tests and devNotes
    'next version': '0.0.4. ~15.10.2017',

    'author': 'Heikki Lappalainen',
    'webPage': 'https://github.com/heiklap/dawo',
    'started': '15.7.2013   hkl  ',
    'purpose': 'Education, Learning  '
  };

  /// Models and sample maps ; for later usage and playing.
  Map<String, String> appMap = {
    'name': 'dawo App',
    'info': 'dartang pub package for education',
    'creator': 'me',
    'version': '0.0.3',
    'active': '0',
    'stopped': '0',
    'paused': '0',
    'userChoise': '-',
    'autoChoise': '1'
  };

  /// TODO  teamInno    this map is for testing work-flow routines
  Map<String, String> appPhaseM = {
    'closed': '',
    'dance': 'galop',
    'dancer': 'LateNightCoder',
    'tempo': '7',
    'time': '18',
    'active': '0',
    'paused': '0',
    'danceQueue: ': 'yes',
    'danceDone:  ': 'no',
    'stopped': '0'
  };

  ///  Method for setting class field values.
  ///  TODO  add parameters
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
    //  TODO  set min-max values
    //  :BOX:SW:  was 190
    //  unused::  final int _sw = 200; //  screen width, changed later =>
    final int _rc = 37; //  row count
    //  ???  Keep matrix here on callers side all the time
    //  unused::  List<String> _dawoHistMatrix = new List(_rc);
    String boxHeader = ':dawoHist:box:';

    print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
    //  :BUG:  Clear old lists first. ??
    //  :BOX:SW:  was 190
    boxServe.init(_rc, 200, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':dhst:box: ', ':dHst:'); //  :BUG: C: $caller');
    print(':BUG:DEBUG: dawoHist:box is not called * * * ');
    //  unused::  int r9 = 9; //  anchor for row.
    boxServe.show(':box:dHst:', 'print', 0);

    ///  Set boxServe ready for next user: clear data.
    boxServe.done(':box:dHst:');
  }

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
    ///  call flowServe with #LOCAL variables
    ///  :dawoHist:  is too long.
    flowServe(':d:Hist:', buf, msg, p);
  }
} //  -----  class DawoHist

//
