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

  ///  Records changes to states
  List<String> actionL = [];

  StringBuffer buf = new StringBuffer();

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
    boxServe.construct(':glb:box:  C: $caller');

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
